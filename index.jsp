<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="/CSS/style.css" type="text/css">
  <title>Login</title>
</head>
<body>
<form method="post" action="/login.jsp">
  <center>
    <table>
      <thead>
      <tr>
        <th colspan="2">Login Here</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>Email</td>
        <td><input type="pattern" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" placeholder="Enter Email" name="email" required /></td>
      </tr>
      <tr>
        <td>Password</td>
        <td><input type="password" name="pword" placeholder="Enter password" value="" required/></td>
      </tr>
      <tr>
        <td colspan="2"><button type="submit" value="Login"/>Login</td>
      </tr>
      <tr>
        <td colspan="2">Not Yet Registered?<a href="/register.jsp"> Register Here</a></td>
      </tr>
      </tbody>
    </table>
  </center>
</form>
</body>
</html>