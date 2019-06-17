<%-- 
    Document   : product-destails
    Created on : May 31, 2019, 11:50:33 AM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/main-left-top.jsp"/>

<section class="container-fluid row product-item">
    <div class="product-name"><h2><span><i>${product.productName} ram ${product.productDestails.ram} - ${product.productDestails.bonhotrong}</i></span></h2></div>

    <div class="row container-fluid">
        <div class="col-md-5">
            <div  class="carousel slide" data-ride="carousel">
                <ul class="carousel-indicators" id="baner-product">
                    <li data-target="#baner-product" data-slide-to="0" class="active"></li>
                    <li data-target="#baner-product" data-slide-to="1"></li>
                    <li data-target="#baner-product" data-slide-to="2"></li>
                    <li data-target="#baner-product" data-slide-to="3"></li>


                </ul>
                <div class="carousel-inner" id="product-image">
                    <div class="carousel-item active">
                            <img src="<%=request.getContextPath()%>${product.urlImage}" alt="iPhone" width="450" height="500">
                    </div>
                    <c:forEach var="image"  items="${product.listproductImage}">
                        <div class="carousel-item">
                            <img src="<%=request.getContextPath()%>${image.url}" alt="iPhone" width="450" height="500">
                        </div>
                    </c:forEach>

                </div>
                <a class="carousel-control-prev" href="#baner-product" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#baner-product" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
        </div>
        <div class="col-md-4 bg-warning">
            <div>
                <div class="product-info">
                    <div class="title text-center" style="margin-top: 20px;"><a href=""><span>
                                <h3>${product.productName}</h3></span></a></div>
                    <div class="text-center">
                        <h2 class="text-left">${product.unitPriceString}</h2>
                    </div><br>

                    <div>
                        <p>${product.description}</p>
                    </div>

                    <div class="position-botton">
                        <a class="navbar-brand text-center btn-light btn" href="<%=request.getContextPath()%>/cart/add?id=${product.id}">       
                            <i class='fas fa-cart-arrow-down' style='font-size:20px;color:#155BF2'></i>
                            <span style='font-size:15px'>Thêm vào Giỏ hàng</span>
                        </a>
                        <a class="navbar-brand text-center btn-light btn float-right" href="#">       
                            <i class='fab fa-amazon-pay' style='font-size:20px;color:#155BF2'></i>
                            <span style='font-size:15px';>Thanh toán</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 bg-danger thong-so-sp">
            <table class="thong-so-kt table-hover" style="margin-top: 20px;">
                <tr>
                    <th colspan="2" class="text-center"><h4>Thông số kỹ thuật</h4></th>
                </tr>
                <tr>
                    <td style="width: 110px;"><strong class="float-left text-left">Màn hình: </strong></td>
                    <td class=""><span>${product.productDestails.manhinh}<br/> ${product.productDestails.dophangiai}</span></td>
                </tr>
                 <tr>
                     <td ><strong class="float-left text-left">Màu: </strong></td>
                     <td><span>${product.productDestails.mau}</span></td>
                </tr>
                 <tr>
                     <td ><strong class="float-left text-left">CPU: </strong></td>
                     <td><span>${product.productDestails.CPU}</span></td>
                </tr>
                 <tr>
                     <td ><strong class="float-left text-left">Camera trước: </strong></td>
                     <td><span>${product.productDestails.cameratruoc}</span></td>
                </tr>
                 <tr>
                     <td ><strong class="float-left text-left">Camera Sau: </strong></td>
                     <td><span>${product.productDestails.camerasau}</span></td>
                </tr>
                 <tr>
                     <td ><strong class="float-left text-left">Bộ nhớ trong: </strong></td>
                     <td><span>${product.productDestails.bonhotrong}</span></td>
                </tr>
                 <tr>
                     <td ><strong class="float-left text-left">Ram: </strong></td>
                     <td><span>${product.productDestails.ram}</span></td>
                </tr>
                 <tr>
                     <td ><strong class="float-left text-left">Số thẻ sim: </strong></td>
                     <td><span>${product.productDestails.khecamsim}</span></td>
                </tr>
                 <tr>
                     <td ><strong class="float-left text-left">Hệ điều hành: </strong></td>
                     <td><span>${product.productDestails.hedieuhanh}</span></td>
                </tr>
                 <tr>
                     <td ><strong class="float-left text-left">Kích thước: </strong></td>
                     <td><span>${product.productDestails.kichthuoc}</span></td>
                </tr>
                <tr>
                     <td ><strong class="float-left text-left">Trọng lượng: </strong></td>
                     <td><span>${product.productDestails.trongluong}</span></td>
                </tr>
                
            </table>
        </div>
    </div><!-- Product end -->

    <div class="container-fluid" style="padding-left: 0px;">
        <div>
            Xem thêm các sản phẩm cùng hãng
        </div>
        <ul class="list-sp">

        <c:forEach var="product" items="${productlistSameCategory}">
            <li class=" border">
                <div class="product-img"><a href="<%=request.getContextPath()%>/product-destails?productId=${product.id}"><img src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a href="<%=request.getContextPath()%>/product-destails?productId=${product.id}"><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng</i></span></a></div>
                    <div class="price">
                        <p class="new-price">${product.unitPriceString}</p>
                        <s class="old-price">${product.unitPriceString}</s>
                    </div>

                </div>
                </li>
        </c:forEach>
    </ul>
    </div>
    <div class="container-fluid" style="padding-left: 0px;">
        <div>
            Xem thêm các sản phẩm có giá tương đồng
        </div>
        <ul class="list-sp">

        <c:forEach var="product" items="${productlistSamePrice}">
            <li class=" border">
                <div class="product-img"><a href="<%=request.getContextPath()%>/product-destails?productId=${product.id}"><img src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a href="<%=request.getContextPath()%>/product-destails?productId=${product.id}"><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng</i></span></a></div>
                    <div class="price">
                        <p class="new-price">${product.unitPriceString}</p>
                        <s class="old-price">${product.unitPriceString}</s>
                    </div>

                </div>
                </li>
        </c:forEach>
    </ul>
    </div>
</section>
</div><!-- Col-main end -->


</div><!-- main-container end -->


</main>


<jsp:include page="include/footer.jsp"/>
