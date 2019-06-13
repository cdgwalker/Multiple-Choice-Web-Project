<%@ page import ="java.sql.*" %>
<%
    //Quiz_Questions ( id, quiz_id, question_text)
    //Quiz_Question_Options (id, quiz_ques_id, answer, correct, comment)
    String questionText = request.getParameter("quesText");
    String[] optionText = request.getParameterValues("option");
    String[] optionComms = request.getParameterValues("optionComms");
    String correctOpt = request.getParameter("ans");
    int pass, quesID = 0;

    //Creates connection, inserts question into database
    if (null != session.getAttribute("questionsLeft")) {
        //if currently creating a quiz


        //subtract 1 from the number of questions left to be added
        session.setAttribute("questionsLeft", (Integer)session.getAttribute("questionsLeft") - 1 );
    } else {
        //If individual question
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/multi_choice_quiz_db", "root", "");
        PreparedStatement pst = con.prepareStatement("INSERT INTO Quiz_Questions VALUES (Null, 1, ?)", Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, questionText);

        int test = pst.executeUpdate();
        //Get a result set with generated key for the question ID, to be passed in question answer statements
        ResultSet rs = pst.getGeneratedKeys();
        if (rs.next()) {
            quesID = rs.getInt(1);
        }
        //If the number of options and comments match (should always pass)
        if (optionText.length == optionComms.length) {
            int ansval = Integer.valueOf(correctOpt) - 1;
            correctOpt = String.valueOf(ansval);
            //for each option given add the question answer with the comment to the Quiz_Question_Option table
            for (int i = 0; i < optionText.length; i++) {
                //Answer added is correct
                if (Integer.valueOf(correctOpt) == i) {
                    PreparedStatement ps = con.prepareStatement("INSERT INTO Quiz_Question_Option VALUES (Null, ?, ?, TRUE, ?)");
                    ps.setString(1, String.valueOf(quesID));
                    ps.setString(2, optionText[i]);
                    ps.setString(3, optionComms[i]);
                    pass = ps.executeUpdate();
                    if (pass > 0) {
                    } else {
                        response.sendRedirect("/error.jsp");
                    }
                }
                //Answer added is not correct
                else {
                    PreparedStatement ps = con.prepareStatement("INSERT INTO Quiz_Question_Option VALUES (Null, ?, ?, FALSE, ?)");
                    ps.setString(1, String.valueOf(quesID));
                    ps.setString(2, optionText[i]);
                    ps.setString(3, optionComms[i]);
                    pass = ps.executeUpdate();
                    if (pass > 0) {
                    } else {
                        response.sendRedirect("/error.jsp");
                    }
                }
            }
        }

        if (test > 0) {
            response.sendRedirect("/confirm.jsp");
        }
    }
%>