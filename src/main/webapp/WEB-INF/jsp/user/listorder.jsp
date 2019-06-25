<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>

<jsp:include page="../include/header.jsp"/>

<jsp:include page="../include/main-left-top.jsp"/>

<section>
    
    <div class="container">
        <div class="title"><h2 class="text-center">Danh sách đơn hàng</h2></div><br>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Mã đơn hàng</th>
                        <th scope="col">Tên khách hàng</th>
                        <th scope="col">Email</th>
                        <th scope="col">Điện thoại</th>
                        <th scope="col">Kiểu thanh toán</th>
                        <th scope="col">Sản phẩm</th>
                        <th scope="col">Tổng tiền</th>
                        <th scope="col"colspan="2">Thanh toán</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderlist}">
                        <tr>
                            <td scope="row">${order.id}</td>
                            <c:if test="${order.user==null}">
                                <td>${order.customerName}</td>
                                <td>${order.customerEmail}</td>
                                <td>${order.customerPhone}</td>

                            </c:if>
                            <c:if test="${order.user!=null}">
                                <td>${order.user.profile.lastname} ${order.user.profile.firstname}</td>
                                <td>${order.user.profile.email}</td>
                                <td>${order.user.profile.phone}</td>

                            </c:if>

                            <td>${order.paymentType.paymentType}</td>
                            <td> <a href="" class="btn btn-success">Chi tiết ${order.orderDestailsList.size()} sp</a></td>
                            <td>${order.sumPrice}</td>
                            <c:if test="${order.creditCard!=null}">
                                <td><a href="" class="btn btn-primary">Chi tiết </a></td></c:if>
                            <c:if test="${order.creditCard==null}">
                                <td><strong>Chưa</strong></td>
                            </c:if>
                                <td><a href="http://localhost:8084/E-Commerce/users/deleteOrder/orderid=${order.id}" class="btn btn-warning">Xóa</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    </div>
</section>
<jsp:include page="../include/footer.jsp"/>
