<%-- 
    Document   : crear
    Created on : Oct 26, 2019, 3:10:22 PM
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript" src="./js/main.js"></script>
        <link rel="stylesheet" href="./css/form.css">
    </head>
    <body>
        <form method="POST" action="registrar" id="formregistro">

            <table >
                <tr>
                    <td><label for="id">Cedula</label></td>
                    <td><input type="text" name="id" id="id"></td>
                </tr>
                <tr>
                    <td><label for="nombre">Nombre</label></td>
                    <td><input type="text" name="nombre" id="nombre"></td>
                </tr>
                <tr>
                    <td><label for="apellido">Apellido</label></td>
                    <td><input type="text" name="apellido" id="apellido"></td>
                </tr>
                <tr>
                    <td><label for="username">Usuario</label></td>
                    <td><input type="text" name="username" id="username"></td>
                </tr>
                <tr>
                    <td><label for="password">Password</label></td>
                    <td><input type="password" name="password" id="password"></td>
                </tr>
                <tr>
                    <td><label for="password2">Verificar Password</label></td>
                    <td><input type="password" name="password2" id="password2"></td>
                </tr>
                <tr>
                    <td><label for="email">Email</label></td>
                    <td><input type="email" name="email" id="email"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input class="btn" type="submit" value="Registrarse"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><a href="./">Ya tiene una cuenta? Inicie sesion</a></td>
                </tr>
            </table>
        </form>
        
    </body>
</html>
