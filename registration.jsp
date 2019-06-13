<%@ page import ="java.sql.*" %>
<%
    String lname = request.getParameter("lname");
    String fname = request.getParameter("fname");
    String pword = request.getParameter("pword");
    String email = request.getParameter("email");
    Integer utype = Integer.parseInt(request.getParameter("usertype"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/multi_choice_quiz_db", "root", "");
    ResultSet rs;
    PreparedStatement pst = con.prepareStatement("INSERT INTO Users VALUES (Null, ?, ?, ?, ?, ?, 1)");
    pst.setString(1, lname);
    pst.setString(2, fname);
    pst.setString(3, email);
    pst.setString(4, pword);
    pst.setInt(5, utype);

    int rows = pst.executeUpdate();
    if (rows > 0) {
        session.setAttribute("userid", email);
        response.sendRedirect("welcome.jsp");
        out.print("Registration Successful!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
