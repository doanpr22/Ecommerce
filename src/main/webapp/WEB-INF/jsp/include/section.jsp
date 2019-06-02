<%-- 
    Document   : section
    Created on : May 30, 2019, 12:50:04 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section>
    <ul class="list-sp">
        <c:forEach var="product" items="${productlist}">
            <li class=" border">
                <div class="product-img"><a href="<%=request.getContextPath()%>/product-destails?productId=${product.id}""><img width="200px" src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a href="<%=request.getContextPath()%>/product-destails?productId=${product.id}"><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng</i></span></a></div>
                    <div class="price">
                        <p class="new-price">${product.unitPrice}&nbsp;₫</p>
                        <s class="old-price">15.500.000&nbsp;₫</s>
                    </div>

                </div>
                <div class="promotion"><p><span>Tặng gói bảo hành năm thứ 2 cho iPhone chính hãng VNA đến 31/5 và <b>2 khuyến mãi khác</b></span></p></div>
            </li>
        </c:forEach>
        <c:forEach var="product" items="${productlist}">
            <li class=" border">
                <div class="product-img"><a href=""><img width="200px" src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a href=""><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng</i></span></a></div>
                    <div class="price">
                        <p class="new-price">${product.unitPrice}&nbsp;₫</p>
                        <s class="old-price">15.500.000&nbsp;₫</s>
                    </div>

                </div>
                <div class="promotion"><p><span>Tặng gói bảo hành năm thứ 2 cho iPhone chính hãng VNA đến 31/5 và <b>2 khuyến mãi khác</b></span></p></div>
            </li>
        </c:forEach>
        <c:forEach var="product" items="${productlist}">
            <li class=" border">
                <div class="product-img"><a href=""><img width="200px" src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a href=""><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng															</i></span></a></div>
                    <div class="price">
                        <p class="new-price">${product.unitPrice}&nbsp;₫</p>
                        <s class="old-price">15.500.000&nbsp;₫</s>
                    </div>

                </div>
                <div class="promotion"><p><span>Tặng gói bảo hành năm thứ 2 cho iPhone chính hãng VNA đến 31/5 và <b>2 khuyến mãi khác</b></span></p></div>
            </li>
        </c:forEach>
        <c:forEach var="product" items="${productlist}">
            <li class=" border">
                <div class="product-img"><a href=""><img width="200px" src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a href=""><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng															</i></span></a></div>
                    <div class="price">
                        <p class="new-price">${product.unitPrice}&nbsp;₫</p>
                        <s class="old-price">15.500.000&nbsp;₫</s>
                    </div>

                </div>
                <div class="promotion"><p><span>Tặng gói bảo hành năm thứ 2 cho iPhone chính hãng VNA đến 31/5 và <b>2 khuyến mãi khác</b></span></p></div>
            </li>
        </c:forEach>
        <c:forEach var="product" items="${productlist}">
            <li class=" border">
                <div class="product-img"><a href=""><img width="200px" src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a href=""><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng															</i></span></a></div>
                    <div class="price">
                        <p class="new-price">${product.unitPrice}&nbsp;₫</p>
                        <s class="old-price">15.500.000&nbsp;₫</s>
                    </div>

                </div>
                <div class="promotion"><p><span>Tặng gói bảo hành năm thứ 2 cho iPhone chính hãng VNA đến 31/5 và <b>2 khuyến mãi khác</b></span></p></div>
            </li>
        </c:forEach>
        <c:forEach var="product" items="${productlist}">
            <li class=" border">
                <div class="product-img"><a href=""><img src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a href=""><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng															</i></span></a></div>
                    <div class="price">s
                        <p class="new-price">${product.unitPrice}&nbsp;₫</p>
                        <s class="old-price">15.500.000&nbsp;₫</s>
                    </div>

                </div>
                <div class="promotion"><p><span>Tặng gói bảo hành năm thứ 2 cho iPhone chính hãng VNA đến 31/5 và <b>2 khuyến mãi khác</b></span></p></div>
            </li>
        </c:forEach>
    </ul>
</section><!-- section end -->
</div><!-- Col-main end -->


</div><!-- main-container end -->


</main>
