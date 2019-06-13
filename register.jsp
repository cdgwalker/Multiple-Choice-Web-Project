<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="/CSS/style.css" type="text/css">
        <title>Register Here</title>
    </head>
    <body>
    <form method="post" action="/registration.jsp">
    <center>
        <table>
            <thead>
            <tr>
                <th colspan="2">Register as a New User Below</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>First Name</td>
                <td><input type="text" name="fname" value="" required/></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><input type="text" name="lname" value="" required/></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pword" value="" required/></td>
            </tr>
            <tr>
                <td>Email Address</td>
                <td><input type="pattern" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" name="email" value="" required/></td>
            </tr>
            <tr>
                <td>User Type</td>
                <td>
                    <select name="usertype" required>
                        <option value="1">Teacher</option>
                        <option value="2">Student</option>
                    </select>
                </td>
            <tr>
                <td colspan="2"> <button type="submit" value="Sign Up" />Sign Up</td>
            </tr>
            </tbody>
        </table>
    </center>
</form>
</body>
</html>