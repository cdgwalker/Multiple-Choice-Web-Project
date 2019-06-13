<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/CSS/style.css" type="text/css">
    <title>View Questions</title>
    <script src="/tableSort.js"></script>
</head>
<body>
<div class="topnav" id="myTopnav">
    <a href="#home">Home</a>
    <a href="/logout.jsp">Logout</a>
    <a href="#help">Help</a>
</div>
<div class="sidenav">
    <a href="#makeQuiz">Create Quiz</a>
    <a href="createQues.jsp">Create Question</a>
    <a class="active" href="quesView.jsp">View Questions</a>
    <a href="#viewRes">View Results</a>
    <a href="#viewStuds">View Students</a> //12652
</div>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/multi_choice_quiz_db", "root", "");
    PreparedStatement pst = con.prepareStatement("SELECT question_id, question_text, quiz_question_option.answer_text, " +
            "quiz_question_option.is_correct FROM quiz_questions INNER JOIN quiz_question_option " +
            "ON quiz_questions.question_id = quiz_question_option.quiz_ques_id;");
    ResultSet rs = pst.executeQuery();
%>
    <table>
        <thead>
            <tr>
                <th>Question ID</th>
                <th>Question Text</th>
                <th>Question Answers</th>
                <th>Correct Option</th>
            </tr>
        </thead>
        <tbody>
        <% while(rs.next()) { %>
        //Column 1 not found, but when query runs in mysql, returns table
        //
            <tr>
                <td><%=rs.getInt("1")%></td>
                <td><%=rs.getString("2")%></td>
                <td><%=rs.getString("3")%></td>
                <td><%=rs.getInt("4")%></td>
            </tr>
        </tbody>
        <% } %>
    </table>
</body>
</html>