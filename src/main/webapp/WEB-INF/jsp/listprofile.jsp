<%-- 
    Document   : listBook
    Created on : Apr 2, 2019, 6:32:12 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <style>
            body{
                margin: auto 100px;
                align-content: center;
            }
            table, th, td {
                border:1px solid black;
                text-align: center;
            }
            th{font-style: italic;}
            table{
                margin-top: 10px;
                width: 100%;
                
            }
        </style>
    </head>

    <body>
        <table>
            <tr>
                <th>Id</th>
                <th>Full Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Phone</th>
            </tr>

            <c:forEach var="pro" items="${profileList}">
                <tr>
                    <td>${pro.id}</td>
                    <td>${pro.firstname} ${pro.lastname}</td>
                    <td>${pro.address}</td>
                    <td>${pro.email}</td>
                    <td>${pro.birthDate}</td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
