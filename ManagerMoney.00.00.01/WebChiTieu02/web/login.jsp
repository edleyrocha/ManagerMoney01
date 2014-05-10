<%-- 
    Document   : login
    Created on : May 8, 2014, 8:18:14 PM
    Author     : h10t93
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/temp.css"/>
        <link rel="stylesheet" href="css/bootstrap-theme.css"/>
        <link rel="stylesheet" href="css/bootstrap-theme.css.map"/>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/bootstrap.css.map"/>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
    </head>
    <body>
        <div id="wap">

            <div id="header">
                <div id="img"></div>
                <div class="log">
                    <form action="Servlet?action=login" method="POST">
                        <table cellspacing="0">
                            <tr>
                                <td><input name="id" type="text" tabindex="1"
                                           style="border:0px ;height: 30px;border-radius: 0px;"class="form-control"
                                           " 
                                           placeholder="Enter ID"/></td>
                                <td><input name="password" type="password" tabindex="2" 
                                           style="border:0px ;height: 30px;border-radius: 0px;" 
                                           class="form-control"
                                           placeholder="Password"/></td>
                                <td><input tabindex="3" type="submit" style="margin-left: 10px;border:0px ;height: 30px;border-radius: 0px;" value="Login" class="btn btn-danger"/></td>
                            </tr>
                            <tr>
                                <td><input tabindex="4" type="checkbox">Remember me</td>
                                <td><a>Forgot password</a></td>
                            </tr>
                        </table>
                    </form>
                </div>	
            </div>

            <div id="content_left">      
            </div>

            <div id="content_right">

            </div>
            <div class="clear"></div>
            <div id="footer"></div>

        </div> 

    </body>
</html>
