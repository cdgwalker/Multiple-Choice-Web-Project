<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/CSS/style.css" type="text/css">
    <title>All Quiz Results</title>
</head>
<body>
<div class="topnav" id="myTopnav">
    <a class="active" href="/studHome.jsp">Home</a>
    <a href="/logout.jsp">Logout</a>
    <a href="#help">Help</a>
</div>
<div class="sidenav">
    <a href="/takeQuiz.jsp">Take Quiz</a>
    <a class="active" href="/viewRes.jsp">View Results</a>
    <a href="#reqJoin">Join a class</a>
</div>
<div class="container">
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/multi_choice_quiz_db", "root", "");
    Statement s = con.createStatement();
    ResultSet rs;
    String query = "SELECT user_id FROM users WHERE email = ?";
    PreparedStatement prepstmt = con.prepareStatement(query);
    prepstmt.setString(1, (String)session.getAttribute("userid"));
    ResultSet user = prepstmt.executeQuery();
    user.first();
    int loggedUser = user.getInt(1);
    String getResults = "SELECT attempt_date, quiz_name, score FROM results WHERE user_id = ?";
    PreparedStatement pst = con.prepareStatement(getResults);
    pst.setInt(1, loggedUser);
    ResultSet res = pst.executeQuery();
    out.print("<center><table bgcolor='white'> <tr> <th> Attempt Date </th> <th> Quiz Name </th> <th> Score </th> </tr>");
    while (res.next()) {
        out.print("<tr><td>" + res.getDate(1) + "</td><td>" + res.getString(2) + "</td><td align='right'>" + ((res.getFloat(3))*100) + "%" + "</td></tr>");
    }
    out.print("</table></center>");
%>
</div>
</body>
</html>