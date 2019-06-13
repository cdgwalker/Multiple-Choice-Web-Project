<%@ page import ="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/CSS/style.css" type="text/css">
    <title>Quiz Results</title>
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
<div class="container">
<%
    double correct = 0.0;
    double questions = 0.0;
    ArrayList<String> feedback = new ArrayList<String>(5);
    ArrayList<String> ans = new ArrayList<String>(5);
    for (int i = 0; i < 5; i++) {
        String given = request.getParameter("q"+i);
        ans.add(given);
    }
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/multi_choice_quiz_db", "root", "");
    ArrayList<Integer> ques_nos = (ArrayList<Integer>)session.getAttribute("ques");
    for (int i = 0; i < ques_nos.size(); i++) {
        String query = "SELECT is_correct, comment_text FROM Quiz_Question_Option WHERE quiz_ques_id = ? AND answer_text = ?";
        PreparedStatement prepstmt = con.prepareStatement(query);
        prepstmt.setInt(1, ques_nos.get(i));
        prepstmt.setString(2, ans.get(i));
        ResultSet rs = prepstmt.executeQuery();
        if (rs.next()) {
            if (rs.getInt(1) == 1) {
                correct++;
                questions++;
            }
            else {
                questions++;
            }
            feedback.add(rs.getString(2));
        }
    }
    double mark = (correct/questions);
    String s = "SELECT user_id FROM users WHERE email = ?";
    PreparedStatement ps = con.prepareStatement(s);
    ps.setString(1, (String)session.getAttribute("userid"));
    ResultSet val = ps.executeQuery();
    val.next();
    int userid = val.getInt(1);

    String addRes = "INSERT INTO results VALUES (?, CURDATE(), 'Unnamed Quiz', ?)";
    PreparedStatement pst = con.prepareStatement(addRes);
    pst.setInt(1, userid);
    pst.setDouble(2, mark);
    int comp = pst.executeUpdate();
%>
    <center>
    <table class="results">
        <thead>
            <td>Quiz Results: </td>
            <td><%=mark*100 + "%"%></td>
        </thead>
        <tbody>
            <% for (int a = 0; a < feedback.size(); a++) { %>
            <tr>
                <td>Question <%=a+1%></td>
                <td><%out.println(feedback.get(a));%></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </center>
</div>
</body>