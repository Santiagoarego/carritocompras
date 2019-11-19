<%-- 
    Document   : panel
    Created on : Oct 22, 2019, 9:53:01 PM
    Author     : santi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="gestion.GestionProducto"%>
<%@page import="administrativo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
    GestionProducto gp = new GestionProducto();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Modulo Cliente</title>
    </head>
    <body>
        <%            if (username != null && sesion.getAttribute("rango").equals(1)) {
                response.getWriter().print("Bienvenido " + username);
            } else {

                response.sendRedirect("index.jsp");
            }

        %>

        <div  class="container text-center">
            <input  class="btn btn-info" type="button" value="Productos" onClick="muestra_oculta('divControlProducto');">
            <input  class="btn btn-info" type="button" value="Facturas" onClick="muestra_oculta('divFacturacion');">
            <a  class="btn btn-info" href="newProduct.jsp">Check Out</a>       
            <input  class="btn btn-info" type="button" value="Modulo pagos" onClick="muestra_oculta('divPagosFacturas');">
            <a  class="btn btn-danger" href="logout">Cerrar Sesion</a>
        </div>

        <div  class="container" id="divControlProducto">

            <br>
            <div syle="padding-left:400px">
                <form action="panel.jsp" method="POST">
                    <p>Buscar
                        <input class="form-control" type="text" name="buscaProducto" value="">


                        <input class="btn btn-success btn-sm" type="submit" value="Buscar">
                        <a class="btn btn-danger btn-sm" href="panel.jsp">Eliminar busqueda</a>
                    </p>

                </form>
            </div>
            <h1> Busca Producto</h1>
            <table class="table table-bordered" id="controlProducto" >

                <thead>
                <th>FOTO</th>
                <th>ID PRODUCTO</th>
                <th>Nombre</th>

                <th>Precio venta</th>
                <th>Existencias</th>
                <th>Acciones</th>
                </thead>
                <%                    String nombreProducto = request.getParameter("buscaProducto");

                    if (nombreProducto != null && nombreProducto != "") {
                %>
                <script type="text/javascript">
                    muestra_oculta('divFacturacion');
                </script>

                <%ArrayList<Producto> productos = gp.getBusqueda(nombreProducto);
                    for (Producto prod : productos) {

                %>
                <tr>
                    <td><image src="../imgprodu/<%= prod.getNombreFoto()%>" width="100" height="100"></td>
                    <td><%= prod.getId()%></td>
                    <td><%= prod.getNombre()%></td>

                    <td><%= prod.getPrecioVenta()%></td>
                    <td><%= prod.getExistencias()%></td>
                    <td class="text-center"><a class="btn btn-warning" href="detalles.jsp?id=<%= prod.getId()%>">DETALLES</a></td>
                </tr>
                <%     }
                } else {
                    ArrayList<Producto> productos = gp.getTodos();
                    for (Producto prod : productos) {%>
                <tr>
                    <td><image src="../imgprodu/<%= prod.getNombreFoto()%>" width="100" height="100"></td>
                    <td><%= prod.getId()%></td>
                    <td><%= prod.getNombre()%></td>

                    <td><%= prod.getPrecioVenta()%></td>
                    <td><%= prod.getExistencias()%></td>
                    <td class="text-center"><a class="btn btn-warning" href="detalles.jsp?id=<%= prod.getId()%>">DETALLES</a></td>
                </tr>
                <%
                        }
                    }

                %>

            </table>
        </div>
    </body>
</html>
