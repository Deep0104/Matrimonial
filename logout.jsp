<%-- 
    Document   : logout
    Created on : 3 Jul, 2020, 10:41:22 PM
    Author     : dprisky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
         Cookie c =new Cookie("user","");
            c.setMaxAge(0);
            response.addCookie(c);
            response.sendRedirect("index.jsp");
            %>
    </body>
</html>
