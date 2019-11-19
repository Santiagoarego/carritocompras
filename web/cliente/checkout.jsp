<%-- 
    Document   : checkout
    Created on : Nov 19, 2019, 12:05:50 PM
    Author     : santi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="administrativo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
    ArrayList<Producto> cart;
    cart = (ArrayList<Producto>) session.getAttribute("cart");

    if (username != null && sesion.getAttribute("rango").equals(1)) {
        response.getWriter().print("Bienvenido " + username);
    } else {

        response.sendRedirect("index.jsp");
    }

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div  class="container" id="divControlProducto">

            <br>

            <h1> Carrito</h1>
            <table class="table table-bordered" id="controlProducto" >

                <thead>
                <th>FOTO</th>
                <th>ID PRODUCTO</th>
                <th>Nombre</th>

                <th>Precio venta</th>
                <th>Cantidad</th>
                <th>Acciones</th>
                </thead>

                <%                    for (Producto prod : cart) {

                %>
                <tr>
                    <td><image src="../imgprodu/<%= prod.getNombreFoto()%>" width="100" height="100"></td>
                    <td><%= prod.getId()%></td>
                    <td><%= prod.getNombre()%></td>

                    <td><%= prod.getPrecioVenta()%></td>
                    <td><%= prod.getExistencias()%></td>
                    <td class="text-center"><a class="btn btn-warning" href="EliminarCarrito?id=<%= prod.getId()%>">ELIMINAR</a></td>
                </tr>

                <% }%>
            </table>

            <form action="CrearVenta" method="POST">
                Credito :<input type="checkbox" name="credito"><br><br>
                <input type="submit" class='btn btn-success' value='comprar'>
            </form>
            <br>
            <a href="panel.jsp" class="btn btn-info">Regresar</a>
        </div>
    </body>
</html>
