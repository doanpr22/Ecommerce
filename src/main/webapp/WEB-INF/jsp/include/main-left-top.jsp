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
                <dt>Camera</dt>
            </dl>
            <dd>
                <ol class="sp-ol">
                    <li><a href="<%=request.getContextPath()%>/search?searchValue=5 MP">5 MP</a></li>
                    <li><a href="<%=request.getContextPath()%>/search?searchValue=8 MP"">8 MP</a></li>
                    <li><a href="<%=request.getContextPath()%>/search?searchValue=12 MP"">12 MP</a></li>
                    <li ><a href="<%=request.getContextPath()%>/search?searchValue=24 MP">24 MP</a></li>

                </ol>
            </dd>
             <dl>
                <dt>Màu</dt>
            </dl>
            <dd>
                <ol class="sp-ol">
                    <li ><a href="<%=request.getContextPath()%>/search?searchValue=đen"> Đen</a></li>
                    <li><a href="<%=request.getContextPath()%>/search?searchValue=vàng">Vàng</a></li>
                    <li><a href="<%=request.getContextPath()%>/search?searchValue=xanh">Xanh</a></li>
                    <li><a href="<%=request.getContextPath()%>/search?searchValue=hồng">Hồng</a></li>
                    <li><a href="<%=request.getContextPath()%>/search?searchValue=đỏ">Đỏ</a></li>
                </ol>
            </dd>
            
            <dl>
                <dt>Hệ điều hành</dt>
            </dl>
            <dd>
                <ol class="sp-ol">
                    <li ><a href="<%=request.getContextPath()%>">Tất cả</a></li>
                    <li><a href="<%=request.getContextPath()%>/search?searchValue=android">Android</a></li>
                    <li><a href="<%=request.getContextPath()%>/search?searchValue=ios">iOS</a></li>
                    <li><a href="<%=request.getContextPath()%>/search?searchValue=windown">Windown</a></li>
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
                        <option value="1" onclick="reverseList()">Giá từ thấp tới cao</option>
                        <option value="2">Các sản phẩm hot</option>
                        <option value="3">Sản phẩm được mua nhiều nhất</option>
                    </select>
                </div>
            </nav>

