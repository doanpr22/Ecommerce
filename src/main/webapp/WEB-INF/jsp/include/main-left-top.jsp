<%-- 
    Document   : main-left-top
    Created on : May 30, 2019, 12:49:09 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main class="container-fluid"  >
    <div class="banner">
        <div id="myCarousel" class="carousel carousel-fade slide border " data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="<%=request.getContextPath()%>/image/banner/op-lung-samsung-800-300-800x300.png" alt="Leopard">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="<%=request.getContextPath()%>/image/banner/A9-T6-800-300-800x300.png" alt="Cat">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="<%=request.getContextPath()%>/image/banner/Vivo-V15-Y93-800-300-800x300.png" alt="Lion">
                </div>
            </div>
            <!-- Controls -->
            <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only"></span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only"></span>
            </a>
        </div>
    </div>
    <div class="main-container row">
        <div class="col-left col-sm-2 bg-light">
            <dl>
                <dt>Sản phẩm HOT</dt>
            </dl>
            <dd>
                <ol class="sp-ol">
                    <c:forEach var="pro" items="${productlistHot}">
                        <li ><a href="<%=request.getContextPath()%>/product-destails?productId=${pro.id}">${pro.productName}</a></li>
                        </c:forEach>
                </ol>
            </dd>

            <dl>
                <dt>Màn hình</dt>
            </dl>
            <dd>
                <ol class="sp-ol">
                    <li ><a href="">< 5 inches</a></li>
                    <li><a href="">Từ 5 đên 5.5 inches</a></li>
                    <li><a href="">Từ 5.5 đến 6 inches</a></li>
                    <li><a href="">> 6 inches</a></li>
                </ol>
            </dd>
            <dl>
                <dt>Bộ nhớ trong</dt>
            </dl>
            <dd>
                <ol class="sp-ol">
                    <li ><a href="">256GB</a></li>
                    <li><a href="">128GB</a></li>
                    <li><a href="">64GB</a></li>
                    <li><a href="">36GB</a></li>
                    <li><a href="">16GB</a></li>
                    <li><a href="">8GB</a></li>
                    <li><a href="">4GB</a></li>
                </ol>
            </dd>
            <dl>
                <dt>Hệ điều hành</dt>
            </dl>
            <dd>
                <ol class="sp-ol">
                    <li ><a href="#">Tất cả</a></li>
                    <li><a href="#">Android</a></li>
                    <li><a href="#">iOS</a></li>
                    <li><a href="#">Windown</a></li>
                    <li><a href="#">Khác</a></li>
                </ol>
            </dd>
        </div>

        <div class="col-main col-sm-10 container-fluid">
            <nav class="navbar navbar-expand-md justify-content-center nav-main-top">
                <h2 class="navbar-brand float-left">Điện thoại</h2>
                <ul class="navbar-nav">
                    <c:forEach var="category" items="${listCategory}">
                        <li class="nav-item">
                            <a href="<%=request.getContextPath()%>/search?searchValue=${category.categoryName}" class="nav-link text-center btn-primary btn ">${category.categoryName}</a>
                        </li>
                    </c:forEach>
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>" class="nav-link text-center btn-primary btn ">Tất cả</a>
                    </li>
                </ul>
                <div class="float-right">

                    <select class="browser-default custom-select" style="width: 200px; border-radius: 10%;">
                        <option selected value="0">Giá từ cao tới thấp</option>
                        <option value="1">Giá từ thấp tới cao</option>
                        <option value="2">Các sản phẩm hot</option>
                        <option value="3">Sản phẩm được mua nhiều nhất</option>
                    </select>
                </div>
            </nav>

