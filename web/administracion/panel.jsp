<%-- 
    Document   : panel
    Created on : Oct 22, 2019, 9:53:01 PM
    Author     : santi
--%>

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
%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <div>
            <input type="button" value="Informacion productos" onClick="muestra_oculta('divControlProducto');">
            <input type="button" value="Comprar productos" onClick="muestra_oculta('divAddProduct');">
            <a href="newProduct.jsp"><button>Crear producto</button></a>
            <a href="newProveedor.jsp"><button>Crear proveedor</button></a>

        </div>


        <div id="divControlProducto">
            <h1> Control Producto</h1>
            <table id="controlProducto" border="1">

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
                    <td></td>
                </tr>
                <%
                    }


                %>

            </table>
        </div>
        <div id="divAddProduct">
            <form action="CrearCompra" id="compra" method="post" onsubmit="return validateForm();">
                <h1> Comprar producto</h1>
                <table border="1">
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
                <table id="addProduct" border="1" >

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

                <br>
                <br>
                <table id="totalProductos" border="1">
                    <thead>
                    <th>ID</th>
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





    </body>

</html>