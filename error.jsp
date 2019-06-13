There was an error when adding your Question/Quiz to the database, please return to the homepage.
<%
    if ((Integer)session.getAttribute("usertype") == 1) {%>
Return to <a href="teachHome.jsp">homepage</a> <%
} else if ((Integer)session.getAttribute("usertype") == 2) {
%> Return to <a href="studHome.jsp">homepage</a> <%
    }
%>