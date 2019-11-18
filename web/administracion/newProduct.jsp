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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
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






        <div class="container" id="divCrearProducto">
            <center>
                <form id="newproduct" class="form-control" action="CrearProducto" method="post" style="width: 500px; height: 400px">




                    Nombre
                    <input type="Text" class="form-control" name="nombre" placeholder="Ingrese el Nombre"><br>
                    Foto
                    <input type="file" class="form-control" name="foto" accept="image/png, .jpeg, .jpg, image/gif">
                    <br>
                    <input class="btn btn-success" type="submit" value="Guardar producto">
                    <a class="btn btn-info" href="panel.jsp">Regresar</a>
                </form>
            </center>
        </div>





    </body>

</html>