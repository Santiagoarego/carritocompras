<%-- 
    Document   : factura
    Created on : Nov 12, 2019, 8:43:10 PM
    Author     : santi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="administrativo.Producto"%>
<%@page import="administrativo.Compra"%>
<%@page import="gestion.GestionProducto"%>
<%@page import="gestion.GestionProveedor"%>
<%@page import="gestion.GestionCompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
if (username != null && sesion.getAttribute("rango").equals(2)) {
            response.getWriter().print("Bienvenido " + username.toString());
        } else {
            response.getWriter().print("Acceso denegado");
            response.sendRedirect("index.jsp");
        }
    int idCompra = Integer.parseInt(request.getParameter("id"));
    GestionProducto gp = new GestionProducto();

    GestionProveedor gprov = new GestionProveedor();
    GestionCompra gcompra = new GestionCompra();
    Compra com = gcompra.getCompra(idCompra);
    ArrayList<Producto> detalles = gcompra.getProductosCompra(idCompra);

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
            <h1>Hello World! <%= idCompra%></h1>
            <table class="table table-bordered" border="1">
                <thead>
                <th>ID COMPRA</th>
                <th>Proveedor</th>
                <th> Total</th>
                <th>Fecha</th>
                <th>Credito</th>
                <th>Abono</th>
                </thead>
                <tr>
                    <td><%= com.getId()%></td>
                    <td><%= com.getIdproveedor()%></td>
                    <td><%= com.getTotal()%></td>
                    <td><%= com.getFecha()%></td>
                    <td><%= com.getCredito()%></td>
                    <td><%= com.getAbono()%></td>
                </tr>

            </table>
            <br>
            <br>
            <table class="table table-bordered" border="1">
                <thead>
                <th>Producto</th>
                <th>Precio Unitario</th>
                <th> Cantidad</th>
                <th>Total</th>

                </thead>
                <%

                    for (Producto prods : detalles) {%>
                <tr>
                    <td><%= prods.getNombre()%></td>
                    <td><%= prods.getPrecioCompra()%></td>
                    <td><%= prods.getExistencias()%></td>
                    <td><%= (prods.getPrecioCompra() * prods.getExistencias())%></td>

                </tr>
                <%
                    }


                %>
            </table>
            <br>
            <br>
            <a class="btn btn-success" href="javascript:window.history.back();">Regresar</a>
        </div>
    </body>
</html>
