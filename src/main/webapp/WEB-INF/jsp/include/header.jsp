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
            <nav class="navbar navbar-expand-md col-ms-5 justify-content-center ">
                <ul class="navbar-nav nav-between">
                    <li class="nav-item">
                        <a href="#" class="nav-link text-center"> Khuyến mãi</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-center">Tin tức</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-center"> Trả góp</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-center"> Liên hệ</a>
                    </li>
                </ul>
            </nav>
            <nav class="navbar navbar-expand-md col-ms-2 text-info">
                <ul class="login navbar-nav">
                    <li class="nav-item"><a class="navbar-brand text-center" href="<%=request.getContextPath()%>/card">       
                            <i class='fas fa-cart-arrow-down' style='font-size:20px;color:#7112DC'></i>
                            <span style='font-size:15px';>Giỏ hàng</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="navbar-brand text-cente align-middle" id="navbardrop" data-toggle="dropdown" onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" href="#">       
                            <i class="fas fa-users"  style='font-size:20px;color: #7112DC'></i>
                            <span style='font-size:15px' class="align-middle">Đăng nhập</span><br>
                        </a>

                        <div id="id01" class="modal dropdown-menu-right">

                            <form class="modal-content animate" action="<%=request.getContextPath()%>/j_spring_security_check" method="POST">
                                <div class="imgcontainer">
                                    <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                                    <img src="<%=request.getContextPath()%>/image/img_avatar2.png" alt="Avatar" class="avatar">
                                </div>

                                <div class="container">
                                    <img src="../../../image/iPhone/iphone-xs-max-512gb-gold-400x460.png" alt=""/>
                                    <label for="uname"><b>Tài khoản</b></label>
                                    <input type="text" placeholder="Nhập tài khản" name="username" required>

                                    <label for="psw"><b>Mật khẩu</b></label>
                                    <input type="password" placeholder="Nhập mật khẩu" name="password" required>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit">Đăng nhập</button>
                                    <label>
                                        <input type="checkbox" checked="checked" name="remember"> Lưu trình duyệt
                                    </label>
                                </div>

                                <div class="container" style="background-color:#f1f1f1">
                                    <button type="button" onclick="" class="">Đăng ký</button>
                                    <span class="psw">Quên <a href="#">mật khẩu?</a></span>
                                </div>
                            </form>

                        </div>
                    </li>


                </ul>
            </nav>
        </header>
