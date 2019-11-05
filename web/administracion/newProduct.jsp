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






        <div id="divCrearProducto">
            <form id="newproduct" action="CrearProducto" method="post">
                <table id="newProduct" border="1" >

                    <thead>
                    <th>ID PRODUCTO</th>
                    <th>Nombre</th>
                    <th>Foto</th>

                    </thead>
                    <tr>
                        <td><input type="Text" name= "id" placeholder="Ingrese el id"></td>
                        <td><input type="Text" name="nombre" placeholder="Ingrese el Nombre"></td>
                        <td><input type="file" name="foto" accept="../imgprodu/*"></td>
                        

                    </tr>



                </table>

                <input type="submit" value="Guardar producto">
            </form>
        </div>




    </body>

</html>