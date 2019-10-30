<%-- 
    Document   : index
    Created on : Oct 22, 2019, 9:05:12 PM
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession(true);


%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login Form Design One | Fazt</title>
        <link rel="stylesheet" href="./css/master.css">
    </head>
    <body>

        <div class="login-box">
            <img src="img/logo.png" class="avatar" alt="Avatar Image">
            <h1>Login Here</h1>
            <form action="signin" method="post">
                <!-- USERNAME INPUT -->
                <label for="username">Username</label>
                <input type="text" placeholder="Enter Username" name="uname">
                <!-- PASSWORD INPUT -->
                <label for="password">Password</label>
                <input type="password" placeholder="Enter Password" name="pass">

                
                <input type="submit" value="Log In">
                <a href="#">Olvido su contraseña? Contacte al administrador del sitio</a><br>

            </form>
        </div>
    </body>
</html>
