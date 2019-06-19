<%-- 
    Document   : section
    Created on : May 30, 2019, 12:50:04 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="sp">
    <ul class="list-sp">
        <c:forEach var="product" items="${productlist}">
            <li class=" border">
                <div class="product-img"><a class="urlByAction" href="<%=request.getContextPath()%>/product-destails?productId=${product.id}"><img src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a class="urlByAction" href="<%=request.getContextPath()%>/product-destails?productId=${product.id}"><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng</i></span></a></div>
                    <div class="price text-center">
                        <p class="new-price text-center">${product.unitPriceString}</p>                        
                    </div>

                </div>
            </li>
        </c:forEach>
    </ul>
</section><!-- section end -->


