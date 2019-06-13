<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/CSS/style.css" type="text/css">
    <title>Take Quiz</title>
</head>
<body>
<div class="topnav" id="myTopnav">
    <a class="active" href="/studHome.jsp">Home</a>
    <a href="/logout.jsp">Logout</a>
    <a href="#help">Help</a>
</div>
<div class="sidenav">
    <a class="active" href="/takeQuiz.jsp">Take Quiz</a>
    <a href="/viewRes.jsp">View Results</a>
    <a href="#reqJoin">Join a class</a>
</div>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/multi_choice_quiz_db", "root", "");
    Statement s = con.createStatement();
    ResultSet rs;
    //Get random questions for a quiz
    rs = s.executeQuery("SELECT question_id, question_text FROM Quiz_Questions ORDER BY RAND() LIMIT 5");
    ArrayList<String> questions = new ArrayList<>();
    ArrayList<Integer> ques_nos = new ArrayList<>();
    while (rs.next()) {
        String ques = rs.getString(2);
        Integer ques_no = rs.getInt(1);
        questions.add(ques);
        ques_nos.add(ques_no);
    }
%>

<form class="container" id="quiz" method="post" action="/quizChecker.jsp">
    <center>
    <%
        for (int i = 0; i < ques_nos.size(); i++) {
            String query = "SELECT answer_text, is_correct FROM Quiz_Question_Option WHERE quiz_ques_id = ?";
            PreparedStatement prepstmt = con.prepareStatement(query);
            prepstmt.setInt(1, ques_nos.get(i));
            ResultSet rsq = prepstmt.executeQuery();
            rsq.last();
            int size = rsq.getRow();
            rsq.first();
            %>
            <p id="ques" class="Question<%=i%>"><%=questions.get(i)%></p><br>
            <% for (int j = 0; j < size; j++) {
                %>
                <input class="checkmark" value="<%=rsq.getString(1)%>" type="radio" name="q<%=i%>" id="q<%=i%><%=j%>"><label for="q<%=i%><%=j%>"><%=rsq.getString(1)%></label><br>
            <% rsq.next();
            }
        }
        session.setAttribute("ques", ques_nos);
    %>
        <button type="submit" value="checkQuiz">Submit Quiz</button>

    </center>
</form>
</body>
</html>