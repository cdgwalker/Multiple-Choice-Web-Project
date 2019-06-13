<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not Logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%> Proceeding to homepage
<%
    }
    if ((Integer)session.getAttribute("usertype") == 1) {
        response.sendRedirect("/teachHome.jsp");
    } else if ((Integer)session.getAttribute("usertype") == 2) {
        response.sendRedirect("/studHome.jsp");
    }
%>