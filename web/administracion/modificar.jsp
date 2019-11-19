<%-- 
    Document   : modificar
    Created on : Nov 13, 2019, 9:35:11 AM
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");

    int idProd = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    float precom= Float.parseFloat(request.getParameter("precioVenta"));
    
    
   

%>
<%  
        if (username != null && sesion.getAttribute("rango").equals(2)) {
            response.getWriter().print("Bienvenido " + username.toString());
        } else {
            response.getWriter().print("Acceso denegado");
            response.sendRedirect("index.jsp");
        }

    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
       <div class="container">
            <h1>Modificar Producto</h1>
            <hr>
            <form action="ModificarProducto" method="post" class="form-control" style="width: 500px; height: 400px">
                ID:
                <input type="number" readonly="" name="id" class="form-control" value="<%= idProd%>"/>
                 Nombres:
                <input type="text" name="nombre" class="form-control" value="<%= nombre%>"/><br>
              
                Precio Venta:
                <input type="text" name="precio" class="form-control" value="<%= precom%>"/>
                 <br>
                <input type="submit" value="Guardar" class="btn btn-success "/>
                
                <a href="panel.jsp">Regresar</a>
            </form>
            
        </div>
    </body>
</html>
