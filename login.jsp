<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("email");
    String password = request.getParameter("pword");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/multi_choice_quiz_db", "root", "");
    Statement s = con.createStatement();
    ResultSet rs;
    rs = s.executeQuery("select * from users where email='"+ userid + "' and pword='" + password + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        session.setAttribute("usertype", rs.getInt(6));
        out.println("Welcome "+ userid);
        out.println("<a href='/logout.jsp'>Logout</a>");
        response.sendRedirect("/success.jsp");
    } else {
        out.println("Invalid email address or password, ensure you are registered or that your email and password are entered correctly. <a href='index.jsp'>Please Try Again</a>");
    }
%>
