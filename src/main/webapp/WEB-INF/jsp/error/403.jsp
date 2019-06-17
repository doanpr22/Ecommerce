<%-- 
    Document   : 403
    Created on : Jun 15, 2019, 9:49:07 PM
    Author     : USER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"/>

<jsp:include page="../include/main-left-top.jsp"/>

<section style="margin-left: 300px;margin-top: 50px;">
    <h3 class="text-cente"><strong  class="text-cente" style="color: red;">ERROR: 403 </strong><br>
        <span>Có vẻ như bạn truy cập không hợp lệ</span></h3>
    <label>Bạn muốn tìm kiếm?</label>
    <form class="form-inline" action="<%=request.getContextPath()%>/search">
        <input class="form-control mr-md-2 text-center" name="searchValue" type="text" placeholder="Tìm kiếm...">
        <button class="btn btn-success" type="submit">Tìm kiếm</button>
    </form>
</section>

<jsp:include page="../include/footer.jsp"/>
