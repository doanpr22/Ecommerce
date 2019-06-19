<%-- 
    Document   : edit
    Created on : Jun 14, 2019, 7:43:03 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>

<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>

<jsp:include page="../include/main-left-top.jsp"/>
<script type="text/javascript">
        function confirmAction() {
        return confirm("Bạn có muốn chỉnh sửa sản phẩm này?")
    }
</script>
<section>
    <h2 class="text-center bg-primary">Chọn sản phẩm để chỉnh sửa</h2>
    <div class="row">
        <div class="col-md-4"></div>
        <form class="form-inline col-md-6" action="search">
            <input class="form-control mr-md-2 align-middle" name="searchValue" type="text" placeholder="Tìm kiếm...">
            <button class="btn btn-success" type="submit">Tìm kiếm</button>
        </form>
    </div>
    <ul class="list-sp">
        <c:forEach var="product" items="${productlist}">
            <li class="border productDestails">
                <div class="product-img"><a href="sendedit?id=${product.id}" onclick="return confirmAction()"><img src="<%=request.getContextPath()%>${product.urlImage}"></a></div>
                <div class="product-info">
                    <div class="title text-center"><span><i>${product.productName} ${product.productDestails.bonhotrong} <br>Chính hãng</i></span></a></div>
                    <div class="price">
                        <p class="new-price">${product.unitPriceString}</p>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</section>

<jsp:include page="../include/footer.jsp"/>