<%-- 
    Document   : modificar
    Created on : Nov 13, 2019, 9:35:11 AM
    Author     : santi
--%>

<%@page import="administrativo.Producto"%>
<%@page import="gestion.GestionProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");

    int idProd = Integer.parseInt(request.getParameter("id"));
    GestionProducto gp = new GestionProducto();
    Producto prod = gp.getProducto(idProd);


%>
<%    if (username != null && sesion.getAttribute("rango").equals(1)) {
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
            <h1>Detalles</h1>
            <div class="row">
                <div class="col-sm-4">
                    <image src="../imgprodu/<%= prod.getNombreFoto()%>" width="200" height="200">
                </div>
                <div class="col-sm-8">
                    <hr>
                    <form action="AgregaCarrito" method="post" class="form-control" style="width: 500px; height: 400px">
                        ID:
                        <input type="number" readonly="" name="id" class="form-control" value="<%= idProd%>"/>
                        Nombres:
                        <input type="text" readonly name="nombre" class="form-control" value="<%= prod.getNombre()%>"/><br>

                        Precio Venta:
                        <input type="text" readonly name="precio" class="form-control" value="<%= prod.getPrecioVenta()%>"/>
                        <br>

                        Cantidad disponible
                        <input type="number" readonly name="disponible" class="form-control" value="<%= prod.getExistencias()%>"/>
                        <br>

                        Cantidad a llevar
                        <input type="number" min="1" max="<%=prod.getExistencias()%>"  name="cantidad" class="form-control" value="0"/>
                        <br>
                        <input type="submit" value="Agregar al carrito" class="btn btn-success "/>

                        <a href="panel.jsp">Regresar</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
