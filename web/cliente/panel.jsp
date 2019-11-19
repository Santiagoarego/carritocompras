<%-- 
    Document   : panel
    Created on : Oct 22, 2019, 9:53:01 PM
    Author     : santi
--%>

<%@page import="administrativo.Venta"%>
<%@page import="gestion.GestionVenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestion.GestionProducto"%>
<%@page import="administrativo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
    ArrayList<Producto> cart;
    cart = (ArrayList<Producto>) session.getAttribute("cart");
    GestionProducto gp = new GestionProducto();
    GestionVenta gv = new GestionVenta();
    int iduser = Integer.parseInt((String) sesion.getAttribute("id"));

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/main.js" type="text/javascript"></script>
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
            <a  class="btn btn-info" href="checkout.jsp">Check Out</a>       
            <input  class="btn btn-info" type="button" value="Modulo pagos" onClick="muestra_oculta('divPagosFacturas');">
            <a  class="btn btn-danger" href="CerrarSesion">Cerrar Sesion</a>
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
                    muestra_oculta('divControlProducto');
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
                    <td class="text-center"><a class="btn btn-warning" href="detalles.jsp?id=<%= prod.getId()%>">Ver Mas</a></td>
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
                    <td class="text-center"><a class="btn btn-warning" href="detalles.jsp?id=<%= prod.getId()%>">Ver Mas</a></td>
                </tr>
                <%
                        }
                    }

                %>

            </table>
        </div>

        <div  class="container" id="divFacturacion">
            <br>
            <div syle="padding-left:400px">
                <form action="panel.jsp" method="POST">
                    <p>buscar factura desde
                        <input class="form-control" type="date" name="fechaInicio">
                        hasta
                        <input class="form-control" type="date" name="fechaFinal">

                        <input class="btn btn-success btn-sm" type="submit" value="Buscar">
                        <a class="btn btn-danger btn-sm" href="panel.jsp">Regresar</a>
                    </p>

                </form>
            </div>
            <h1> Facturas compra</h1>

            <table class="table table-bordered" id="facturas" border="1">

                <thead>
                <th  class="text-center">Numero de factura</th>
                <th class="text-center">Fecha</th>
                <th class="text-center">Total</th>
                <th class="text-center">Acciones</th>

                </thead>
                <%                    String fechaInicio = request.getParameter("fechaInicio");
                    String fechaFinal = request.getParameter("fechaFinal");
                    if ((fechaInicio != null && fechaFinal != null) && (fechaInicio != "" || fechaFinal != "")) {
                %>
                <script type="text/javascript">
                    muestra_oculta('divFacturacion');
                </script>

                <%ArrayList<Venta> ventas = gv.getVentaFecha(iduser, fechaInicio, fechaFinal);
                    for (Venta com : ventas) {

                %>

                <tr>

                    <td  class="text-center"><%= com.getId()%></td>
                    <td class="text-center"><%= com.getFecha()%></td>
                    <td class="text-center"><%= com.getTotal()%></td>
                    <td class="text-center"><a class="btn btn-primary" href="factura.jsp?id=<%= com.getId()%>">Detalles</a></td>


                </tr>


                <%
                    }
                } else {
                    ArrayList<Venta> compras = gv.getTodos(iduser);
                    for (Venta com : compras) {%>
                <tr>

                    <td  class="text-center"><%= com.getId()%></td>
                    <td class="text-center"><%= com.getFecha()%></td>
                    <td class="text-center"><%= com.getTotal()%></td>
                    <td class="text-center"><a class="btn btn-primary" href="factura.jsp?id=<%= com.getId()%>">Detalles</a></td>


                </tr>
                <%
                        }
                    }

                %>

            </table>


        </div>
        <div      class="container" id="divPagosFacturas">
            <br>
            <h1> Modulo Pagos</h1>
            <div syle="padding-left:400px">
                <form action="panel.jsp" method="POST">
                    <p>buscar factura desde
                        <input class="form-control" type="date" name="fechaInicioFacturacion">
                        hasta
                        <input class="form-control" type="date" name="fechaFinalFacturacion">

                        <input class="btn btn-success btn-sm" type="submit" value="Buscar">
                        <a class="btn btn-danger btn-sm" href="panel.jsp">Regresar</a>
                    </p>

                </form>
            </div>


            <table class="table table-bordered" id="facturas" border="1">

                <thead>
                <th  class="text-center">Numero de factura</th>
                <th class="text-center">Fecha</th>
                <th class="text-center">Total</th>
                <th class="text-center">Abono</th>
                <th class="text-center">Restante</th>
                <th class="text-center">Acciones</th>


                </thead>
                <%  String fechaInicioFacturacion = request.getParameter("fechaInicioFacturacion");
                    String fechaFinalFacturacion = request.getParameter("fechaFinalFacturacion");
                    if ((fechaInicioFacturacion != null && fechaFinalFacturacion != null) && (fechaInicioFacturacion != "" || fechaFinalFacturacion != "")) {
                %>
                <script type="text/javascript">
                    muestra_oculta('divPagosFacturas');
                </script>

                <%ArrayList<Venta> comcred = gv.getVentaFechaCredito(iduser, fechaInicioFacturacion, fechaFinalFacturacion);
                    for (Venta com : comcred) {

                %>
                <tr>

                    <td  class="text-center"><%= com.getId()%></td>
                    <td class="text-center"><%= com.getFecha()%></td>
                    <td class="text-center"><%= com.getTotal()%></td>
                    <td class="text-center"><%= com.getAbono()%></td>
                    <td class="text-center"><%= (com.getTotal() - com.getAbono())%></td>
                    <td class="text-center"><a class="btn btn-primary" href="pagos.jsp?id=<%= com.getId()%>">PAGAR</a></td>



                </tr>


                <%                    }
                } else {
                    ArrayList<Venta> comcred = gv.getTodosCredito(iduser);
                    for (Venta com : comcred) {%>
                <tr>

                    <td  class="text-center"><%= com.getId()%></td>
                    <td class="text-center"><%= com.getFecha()%></td>
                    <td class="text-center"><%= com.getTotal()%></td>
                    <td class="text-center"><%= com.getAbono()%></td>
                    <td class="text-center"><%= (com.getTotal() - com.getAbono())%></td>
                    <td class="text-center"><a class="btn btn-primary" href="pagos.jsp?id=<%= com.getId()%>">PAGAR</a></td>



                </tr>
                <%
                        }
                    }

                %>

            </table>


        </div>
    </body>
</html>
