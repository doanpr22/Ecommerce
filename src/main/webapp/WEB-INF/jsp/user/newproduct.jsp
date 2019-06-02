<%-- 
    Document   : newproduct
    Created on : May 30, 2019, 4:14:15 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="save-product" method="POST">
            <label>Tên sản phẩm</label>
            <input type="text" name="title"/>
            <input type="file" name="image"/>
        </form>
    </body>
</html>
