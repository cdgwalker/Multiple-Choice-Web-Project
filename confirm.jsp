Your Quiz/Question has been added to the database.
<%
    if ((Integer)session.getAttribute("usertype") == 1) {%>
    Return to <a href="teachHome.jsp">homepage</a> <%
    } else if ((Integer)session.getAttribute("usertype") == 2) {
    %> Return to <a href="studHome.jsp">homepage</a> <%
    }
%>