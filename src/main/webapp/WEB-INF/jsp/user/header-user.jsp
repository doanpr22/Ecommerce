<%-- 
    Document   : header
    Created on : May 30, 2019, 12:46:02 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Page Title</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css"/>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    </head>
    <body>
        <header class="container-fluid row">
            <nav class="navbar navbar-expand-md col-ms-5">
                <a class="navbar-brand logo" href="#">
                    <img src="<%=request.getContextPath()%>/image/icon/apple.icon.PNG" width="200px" height="50px">
                </a>
                <ul class="navbar-nav timkiem justify-content-end">
                    <form class="form-inline" action="/somepage">
                        <input class="form-control mr-md-2 text-center" type="text" placeholder="Tìm kiếm...">
                        <button class="btn btn-success" type="submit">Tìm kiếm</button>
                    </form>
                </ul>
            </nav>
            <nav class="navbar navbar-expand-md col-ms-7 justify-content-center ">
                <ul class="navbar-nav nav-between">
                    
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/users/newproduct" class="nav-link text-center"> Thêm sp</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-center"> Chỉnh sửa sp</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-center"> Xóa sp</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-center">User</a>
                    </li>

                </ul>
            </nav>
        </header>
