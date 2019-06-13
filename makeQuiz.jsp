<%@ page import ="java.sql.*" %>
<%
    //Quiz_Questions ( id, quiz_id, question_text)
    //Quiz_Question_Options (id, quiz_ques_id, answer, correct, comment)
    String quizName = request.getParameter("quizName");
    String quizTopic = request.getParameter("quizTopic");
    Integer totalQues = request.getParameter("quesNum");

    //Creates connection, inserts question into database
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/multi_choice_quiz_db", "root", "");
    PreparedStatement pst = con.prepareStatement("INSERT INTO Quiz VALUES (null, ?, ?)");
    pst.setString(1, quizTopic);
    pst.setString(2, quizName);

    int test = pst.executeUpdate();
    session.setAttribute("quizName", quizName);
    session.setAttribute("questionsLeft", totalQues);

    if (test > 0) {
        out.print("You have now created a quiz, to add questions navigate to the <a href='/createQues.jsp'>create question page</a>");
    } else {
        out.print("Quiz was unable to be created, return to <a href='/teachHome.jsp'>home</a>");
    }
%>