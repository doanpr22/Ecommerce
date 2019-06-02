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
    <div class="product-name"><h2><span><i>${product.productName} ram ${product.productDestails.ram},${product.productDestails.bonhotrong}</i></span></h2></div>

    <div class="row container-fluid">
        <div class="col-md-5">
            <div id="baner-product" class="carousel slide" data-ride="carousel">
                <ul class="carousel-indicators">
                    <li data-target="#baner-product" data-slide-to="0" class="active"></li>
                    <li data-target="#baner-product" data-slide-to="1"></li>
                    <li data-target="#baner-product" data-slide-to="2"></li>
                    <li data-target="#baner-product" data-slide-to="3"></li>

                </ul>
                <div class="carousel-inner" id="product-image">
                    <c:forEach var="image"  items="${product.listUrlImage}">
                        <div class="carousel-item">
                            <img src="<%=request.getContextPath()%>${image.url}" alt="iPhone" width="450" height="500">
                        </div>
                    </c:forEach>

                </div>
                <script>
                    $(document).ready(function () {
                        $('section').addClass('.bg-primarys')
                        $("#product-image + carousel-item").addClass('active');
                    });
                </script>

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
                    <div class="title text-center"><a href=""><span><i>Apple iPhone 8 64GB Chính hãng															</i></span></a></div>
                    <div class="price text-center">
                        <p class="new-price btn btn-primary">14.500.000&nbsp;₫</p>
                        <del class="old-price new-price btn btn-primary">15.500.000&nbsp;₫</del>
                    </div><br>

                    <div>
                        <p>${product.description}</p>
                    </div>
                    <div class="align-bottom">
                        <a class="navbar-brand text-center btn-light btn" href="<%=request.getContextPath()%>/addcart?id=${product.id}">       
                            <i class='fas fa-cart-arrow-down' style='font-size:20px;color:#155BF2'></i>
                            <span style='font-size:15px';>Thêm vào Giỏ hàng</span>
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

            <ul>
                <li>
                    <strong class="text-center">Thông số kỹ thuật</strong>
                </li>
                <li>
                    <strong class="float-left text-left">Màn hình: </strong>
                    <p><span>6 inchs</span></p>
                </li>
                <li>
                    <strong class="float-left">Màu : </strong>
                    <p><span>6 inchs</span></p>
                </li>
                <li>
                    <strong class="float-left">Bộ nhớ trong: </strong>
                    <p><span>6 inchs</span></p>
                </li>
                <li>
                    <strong class="float-left">Ram: </strong>
                    <p><span>6 inchs</span></p>
                </li>
                <li>
                    <strong class="float-left">Camera trước: </strong>
                    <p><span>6 inchs</span></p>
                </li>
                <li>
                    <strong class="float-left">Camera sau: </strong>
                    <p><span>6 inchs</span></p>
                </li>
                <li>
                    <strong class="float-left">Số thẻ sim: </strong>
                    <p><span>6 inchs</span></p>
                </li>
                <li>
                    <strong class="float-left">Hệ điều hành: </strong>
                    <p><span>6 inchs</span></p>
                </li>
            </ul>

        </div>
    </div><!-- Product end -->

    <div class="container-fluid" style="padding-left: 0px;">
        <div>
            Xem thêm các sản phẩm có giá tương đồng
        </div>
        <ul class="list-sp">
            <li class=" border">
                <div class="product-img"><a href=""><img src="<%=request.getContextPath()%>image/image/xiaomi-redmi-k20-600x600.jpg"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a href=""><span><i>Apple iPhone 8 64GB Chính hãng															</i></span></a></div>
                    <div class="price">
                        <p class="new-price">14.500.000&nbsp;₫</p>
                        <s class="old-price">15.500.000&nbsp;₫</s>
                    </div>

                </div>
            </li>
            <li class="bg-success">
            </li>
            <li class="bg-success">
            </li>
            <li class="bg-success">
            </li>
            <li class="bg-success">
            </li>
            <li class="bg-success">
            </li>

        </ul>
    </div>
</section>
</div><!-- Col-main end -->


</div><!-- main-container end -->


</main>


<jsp:include page="include/footer.jsp"/>
