<%-- 
    Document   : panel
    Created on : Oct 22, 2019, 9:53:01 PM
    Author     : santi
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="gestion.GestionProducto,administrativo.Producto"%>

<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");

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

        </div>


        <div id="divControlProducto">
            <h1> Control Producto</h1>
            <table id="controlProducto" border="1">

                <thead>
                <th>ID PRODUCTO</th>
                <th>Nombre</th>
                <th>Precio compra</th>
                <th>Precio venta</th>
                <th>Existencias</th>
                <th>Acciones</th>
                </thead>
                <%GestionProducto gp = new GestionProducto();
                ArrayList<Producto> productos = gp.getTodos();
                for(Producto prod: productos){%>
                <tr>
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
            <h1> Comprar producto</h1>
            <h3>Seleccione proveedor</h3>
            <select>
                <option value="Carulla">Carulla</option>
                <option value="surtimax">Surtimax</option>

            </select>
            <br>
            <br>
            <table id="addProduct" border="1" >

                <thead>

                <th>Producto</th>
                <th>Precio compra</th>
                <th>Cantidad</th>

                <th>Credito</th>
                <th>Subtotal</th>
                </thead>
                <tr>

                    <td><select>
                            <option value="chocolate">Chocolate</option>
                            <option value="condon">Condones</option>

                        </select>
                    </td>
                    <td><input type="Number" id="precompra0" onkeyup="calcularSubtotal('precompra0')" placeholder="Ingrese el Precio compra"></td>
                    <td><input type="number" id="canticompra0" onkeyup="calcularSubtotal('canticompra0')" placeholder="Ingrese cantidad"></td>

                    <td><input type="checkbox" id="credito0"> </td>
                    <td><p id="subtotal0"></p></td>


                </tr>



            </table>
            <button onClick="agregarFila();">agregar producto</button>
            <button onClick="eliminarFila();">Eliminar producto</button>
            <button>COMPRAR</button>
        </div>
        




    </body>

</html>