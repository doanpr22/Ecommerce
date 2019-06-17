<%-- 
    Document   : delete
    Created on : Jun 14, 2019, 10:23:04 PM
    Author     : USER
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>

<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>

<jsp:include page="../include/main-left-top.jsp"/>
<section>
    <h2 class="text-center bg-primary">Chọn sản phẩm để xóa</h2>
    <div class="row">
        <form class="form-inline col-md-6 text-center" action="search">
            <input class="form-control mr-md-2 text-center" name="searchValue" type="text" placeholder="Tìm kiếm...">
            <button class="btn btn-success" type="submit">Tìm kiếm</button>
        </form>
    </div>
    <ul class="list-sp">
        <c:forEach var="product" items="${productlist}">
            <li class=" border">
                <div class="product-img"><a href="savedelete?id=${product.id}"><img src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><a href="savedelete?id=${product.id}"><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng</i></span></a></div>
                    <div class="price">
                        <p class="new-price">${product.unitPriceString}</p>
                        <s class="old-price">${product.unitPriceString}</s>
                    </div>

                </div>
            </li>
        </c:forEach>
    </ul>
</section>
<jsp:include page="../include/footer.jsp"/>