<%-- 
    Document   : header
    Created on : May 30, 2019, 12:46:02 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Thế giới điện thoại</title>

        <!-- Bootstrap CSS -->
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index-css.css">
        <link href="<%=request.getContextPath()%>/css/form-login.css" rel="stylesheet" type="text/css"/>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <script src="<%=request.getContextPath()%>/js/formatMoney.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/js/js.js" type="text/javascript"></script>

    </head>
    <body>
        <input type="hidden" id="role" value="${role}"/>
        <input type="hidden" id="action" value="${action}"/>
        <input type="hidden" id="error" value="${error}"/>

        <header class="container-fluid row">
            <nav class="navbar navbar-expand-md col-md-6">
                <a class="navbar-brand logo" href="<%=request.getContextPath()%>">
                    <img src="<%=request.getContextPath()%>/image/icon/apple.icon.PNG" width="200px" height="50px">
                </a>
                <ul class="navbar-nav timkiem justify-content-end">
                    <form class="form-inline" action="<%=request.getContextPath()%>/search">
                        <input class="form-control mr-md-2 text-center" name="searchValue" type="text" placeholder="Tìm kiếm...">
                        <button class="btn btn-success" type="submit">Tìm kiếm</button>
                    </form>
                </ul>
            </nav>
            <%--Menu trang index khi chua đăng nhập --%>
            <nav class="navbar navbar-expand-md col-md-6 nav-header justify-content-center "  id="nav-index">
                <ul class="navbar-nav nav-between">

                    <li class="nav-item ">
                        <a href="#" class="nav-link text-center ">Khuyến mãi</a>
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
                    <li class="nav-item"><a class="navbar-brand text-center" href="<%=request.getContextPath()%>/cart">       
                            <i class='fas fa-cart-arrow-down' style='font-size:20px;color:#7112DC'></i>
                            <span style='font-size:15px'>Giỏ hàng</span>
                        </a>
                    </li>
                    <li class="nav-item" id="li-dangnhap"  >
                        <a id="dangnhap"  class="navbar-brand text-cente align-middle dangnhap" data-toggle="dropdown" style="width:auto;" href="#">       
                            <i class="fas fa-users"  style='font-size:20px;color: #7112DC'></i><br>
                            <span style='font-size:15px' class="align-middle text-center" id="login">Đăng nhập</span><br>
                        </a>

                        <div id="form-login" class="modal dropdown-menu-right col-md-offset-4">

                            <form class="form" action="<%=request.getContextPath()%>/j_spring_security_check" method="POST">
                                <div class="container ">
                                    <span id="login-close" class="close" title="Close Modal">&times;</span>

                                    <div class="col-xs-6 col-md-12">
                                        <input class="form-control" name="username" placeholder="UserName" required="" autofocus="" type="text"> 
                                    </div> 
                                    <div class="col-xs-6 col-md-12">
                                        <input class="form-control" name="password" placeholder="Password" required="" type="password"> 
                                    </div> 
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <button class="form-control btn-primary"  type="submit">Đăng nhập</button>
                                    <label class="float-right">
                                        <input    type="checkbox" checked="checked" name="remember"> Lưu trình duyệt
                                    </label>
                                    <a href="<%=request.getContextPath()%>/registration" > <button class="form-control btn-primary" type="button" id="dang-ky">Đăng ký</button></a>
                                    <span class="psw float-right">Quên <a href="#">mật khẩu?</a></span>

                                </div>
                            </form>

                        </div>
                    </li>
                    <li class="nav-item dropdown" id="taikhoan-customer">
                        <a class="nav-link text-center dropdown-tonggle" 
                           data-toggle="dropdown"><i class="fas fa-users"  style='font-size:20px;color: #7112DC'></i><br>
                            <span style='font-size:15px' class="text-center">${username}</span><br></a>
                        <div class="dropdown-menu" id="taikhoan-customer-super">
                            <a class="dropdown-item" id="profile-customer"href="<%=request.getContextPath()%>/customer/profile">${user.profile.lastname} ${user.profile.firstname}</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/customer/editprofile">Chỉnh sửa tài khoản</a>
                            <a class="dropdown-item" href="#">Danh sách order</a>
                            <a class="dropdown-item" href="#">Đổi mật khẩu</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/logout">Đăng xuất</a>
                    </div>
                    </li>

                </ul>
            </nav>
            <%--Menu trang index khi  user đăng nhâp --%>

            <nav class="navbar navbar-expand-md col-ms-7" id="nav-quan-ly">
                <ul class="navbar-nav nav-between">
                    <li class="nav-item dropdown" >
                        <a href="newproduct" class="nav-link text-center dropdown-tonggle" 
                           data-toggle="dropdown">Quản lý<br/> Đơn hàng</a>

                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Đơn hàng mới</a>
                            <a class="dropdown-item" href="#">Đơn hàng đang ship</a>
                            <a class="dropdown-item" id="thong-ke" href="#">Thống kê</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link text-center dropdown-tonggle" 
                           id="navbardrop" data-toggle="dropdown">Quản lý<br/> Sản phẩm</a>

                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/users/product/all">Tất cả sản phẩm</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/users/product/new">Thêm sản phẩm</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/users/product/edit">Chỉnh sửa Sp</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/users/product/delete">Xóa Sp</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="" class="nav-link text-center dropdown-tonggle" 
                           id="navbardrop" data-toggle="dropdown">Quản lý<br/> Khách hàng</a>

                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Thêm sản phẩm</a>
                            <a class="dropdown-item" href="#">Chỉnh sửa Sp</a>
                            <a class="dropdown-item" href="#">Xóa Sp</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="" class="nav-link text-center dropdown-tonggle" 
                           id="navbardrop" data-toggle="dropdown">Quản lý<br/>Danh mục</a>

                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Thêm danh mục SP</a>
                            <a class="dropdown-item" href="#">Danh sách các danh mục</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link text-center dropdown-tonggle" 
                           id="navbardrop" data-toggle="dropdown">Quản lý<br/> Khác</a>

                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Nhà sản suất</a>
                            <a class="dropdown-item" href="#">Thanh toán</a>
                            <a class="dropdown-item" href="#">Khuyến mãi</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link text-center dropdown-tonggle" 
                           data-toggle="dropdown"><i class="fas fa-users"  style='font-size:20px;color: #7112DC'></i><br>
                            <span style='font-size:15px' class="align-middle text-center" id="login">${username}</span><br></a>

                        <div class="dropdown-menu">
                           <a class="dropdown-item" href="#">Thông tin tài khoản</a>
                            <a class="dropdown-item" href="#">Chỉnh sửa tài khoản</a>
                            <a class="dropdown-item" href="#">Đổi mật khẩu</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/logout">Đăng xuất</a>
                    </div>
                    </li>
                </ul>
            </nav>
        </header>
