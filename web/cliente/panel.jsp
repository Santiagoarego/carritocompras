<%-- 
    Document   : panel
    Created on : Oct 22, 2019, 9:53:01 PM
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <thead>
        <%
            if (username!=null && sesion.getAttribute("rango").equals(1)) {
                response.getWriter().print("Bienvenido " + username.toString()+sesion.getAttribute("rango"));
            } else {
                
                response.sendRedirect("index.jsp");
            }

        %>
    </body>
</html>
