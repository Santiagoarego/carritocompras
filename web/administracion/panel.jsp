<%-- 
    Document   : panel
    Created on : Oct 22, 2019, 9:53:01 PM
    Author     : santi
--%>

<%@page import="administrativo.Compra"%>
<%@page import="gestion.GestionCompra"%>
<%@page import="administrativo.Proveedor"%>
<%@page import="gestion.GestionProveedor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="gestion.GestionProducto,administrativo.Producto"%>

<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");

    GestionProducto gp = new GestionProducto();
    GestionProveedor gprov = new GestionProveedor();
    GestionCompra gcompra = new GestionCompra();
%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="./js/main.js"></script>

    </head>

    <body>

        <%            if (username != null && sesion.getAttribute("rango").equals(2)) {
                response.getWriter().print("Bienvenido " + username.toString());
            } else {
                response.getWriter().print("Acceso denegado");
                response.sendRedirect("index.jsp");
            }

        %>

        <div class="text-center">
            <input  class="btn btn-info" type="button" value="Informacion productos" onClick="muestra_oculta('divControlProducto');">
            <input  class="btn btn-info" type="button" value="Comprar productos" onClick="muestra_oculta('divAddProduct');">
            <input  class="btn btn-info" type="button" value="Facturas" onClick="muestra_oculta('divFacturacion');">
            <a  class="btn btn-info" href="newProduct.jsp">Crear producto</a>
            <a  class="btn btn-info" href="newProveedor.jsp">Crear proveedor</a>
            <input  class="btn btn-info" type="button" value="Modulo pagos" onClick="muestra_oculta('divPagosFacturas');">

        </div>


        <div class="container" id="divControlProducto">
            <h1> Control Producto</h1>
            <table class="table table-bordered" id="controlProducto" >

                <thead>
                <th>FOTO</th>
                <th>ID PRODUCTO</th>
                <th>Nombre</th>
                <th>Precio compra</th>
                <th>Precio venta</th>
                <th>Existencias</th>
                <th>Acciones</th>
                </thead>
                <%                    ArrayList<Producto> productos = gp.getTodos();
                    for (Producto prod : productos) {%>
                <tr>
                    <td><image src="../imgprodu/<%= prod.getNombreFoto()%>" width="100" height="100"></td>
                    <td><%= prod.getId()%></td>
                    <td><%= prod.getNombre()%></td>
                    <td><%= prod.getPrecioCompra()%></td>
                    <td><%= prod.getPrecioVenta()%></td>
                    <td><%= prod.getExistencias()%></td>
                    <td class="text-center"><a class="btn btn-warning" href="modificar.jsp?id=<%= prod.getId()%>&nombre=<%= prod.getNombre()%>&precioVenta=<%= prod.getPrecioVenta()%>">Modificar</a></td>
                </tr>
                <%
                    }


                %>

            </table>
        </div>
        <div  id="divAddProduct">

            <form action="CrearCompra" id="compra" method="post" onsubmit="return validateForm();">
                <h1> Comprar producto</h1>
                <table  class="table table-striped" border="1">
                    <thead>
                    <th>Proveedor</th>
                    <th>Fecha compra</th>
                    <th>Credito</th>

                    </thead>
                    <tr>
                        <td> <select name="proveedores" id="proveedores" required>
                                <% ArrayList<Proveedor> proveedores = gprov.getTodos();
                                    for (Proveedor prov : proveedores) {%>

                                <option value="<%=prov.getId()%>"><%=prov.getNombre()%></option>
                                <% }%>

                            </select>

                        </td>
                        <td>
                            <input name="fechacompra" type="date" required>
                        </td>
                        <td>
                            <input type="checkbox" name="credito" id="credito"> 
                        </td>
                    </tr>
                </table>

                <br>
                <br>
                <h2>Seleccion de producto</h2>

                <table class="table table-striped" id="addProduct" border="1" >

                    <thead>

                    <th>Producto</th>
                    <th>Precio compra</th>
                    <th>Cantidad</th>



                    </thead>
                    <tr>

                        <td><select name="products" id="products">
                                <% for (Producto prod : productos) {%>
                                <option value="<%= prod.getId()%>"><%= prod.getNombre()%></option>
                                <% }%>


                            </select>
                        </td>
                        <td><input type="Number" id="precompra"  placeholder="Ingrese el Precio compra"></td>
                        <td><input type="number" id="canticompra"  placeholder="Ingrese cantidad"></td>





                    </tr>



                </table>

                <input type='number' id='cantidadFactura'  name="cantidadFactura" value='0'>


                <br>

                <h2>Factura</h2>
                <table class="table table-striped" id="totalProductos" border="1">
                    <thead>
                    <th >ID</th>
                    <th>Producto</th>
                    <th>Precio compra</th>
                    <th>Cantidad</th>


                    <th>subtotal</th>

                    </thead> 
                </table>
                <input type="submit" value="comprar">
            </form>
            <button onClick="agregarFila();">agregar producto</button>
            <button onClick="eliminarFila();">Eliminar producto</button>

        </div>
        <div class="container" id="divFacturacion">
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
                <%
                    String fechaInicio = request.getParameter("fechaInicio");
                    String fechaFinal = request.getParameter("fechaFinal");
                    if ((fechaInicio != null && fechaFinal != null) && (fechaInicio != "" || fechaFinal != "")) {
                %>
                <script type="text/javascript">
                    muestra_oculta('divFacturacion');
                </script>

                <%ArrayList<Compra> compras = gcompra.getCompraFecha(fechaInicio, fechaFinal);
                    for (Compra com : compras) {

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
                    ArrayList<Compra> compras = gcompra.getTodos();
                    for (Compra com : compras) {%>
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


        <div class="container" id="divPagosFacturas">
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
                    muestra_oculta('divPagosFactuas');
                </script>

                <%ArrayList<Compra> comcred = gcompra.getCompraFechaCredito(fechaInicioFacturacion, fechaFinalFacturacion);
                    for (Compra com : comcred) {

                %>

                <tr>

                    <td  class="text-center"><%= com.getId()%></td>
                    <td class="text-center"><%= com.getFecha()%></td>
                    <td class="text-center"><%= com.getTotal()%></td>
                    <td class="text-center"><%= com.getAbono()%></td>
                    <td class="text-center"><%= (com.getTotal()-com.getAbono())%></td>
                    <td class="text-center"><a class="btn btn-primary" href="pagos.jsp?id=<%= com.getId()%>">PAGAR</a></td>
                    


                </tr>


                <%
                    }
                } else {
                    ArrayList<Compra> comcred = gcompra.getTodosCredito();
                    for (Compra com : comcred) {%>
                <tr>

                    <td  class="text-center"><%= com.getId()%></td>
                    <td class="text-center"><%= com.getFecha()%></td>
                    <td class="text-center"><%= com.getTotal()%></td>
                    <td class="text-center"><%= com.getAbono()%></td>
                    <td class="text-center"><%= (com.getTotal()-com.getAbono())%></td>
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