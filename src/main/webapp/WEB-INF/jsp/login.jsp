<%-- 
    Document   : login
    Created on : Apr 6, 2019, 7:58:34 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Login </h1>
        <form name="login" action="j_spring_security_check" onsubmit="validateForm()" method="POST">
            <label>User Name:</label>
            <input type="text" name="username"/><br/>
            <label>Password </label>
            <input type="text" id="password" name="password"/>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <input type="submit" value="Login"/>

        </form>

    </body>
</html>
