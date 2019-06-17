<%-- 
    Document   : profilecustomer
    Created on : Jun 15, 2019, 12:47:58 PM
    Author     : USER
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<jsp:include page="../include/main-left-top.jsp"/>
<section id="profile-customer">
    <div class="container row">
    <div class="col-md-4">
        <table class="table table-dark table-hover">
            <tr>
                <th class="text-center" colspan="2">
                    <h3><i><span >Thông tin khách hàng</span></i></h3>
                </th>
            </tr>
            <tr>
                <td>
                    <span>Họ Tên</span>
                </td>
                <td>
                    <span>${user.profile.lastname} ${user.profile.firstname}</span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Username</span>
                </td>
                <td>
                    <span>${user.username}</span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Giới tính</span>
                </td>
                <td>
                    <span>${user.profile.genderString}</span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Ngày sinh</span>
                </td>
                <td>
                    <span>${user.profile.birthDate}</span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Email</span>
                </td>
                <td>
                    <span>${user.profile.email}</span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Điện thoại</span>
                </td>
                <td>
                    <span>${user.profile.phone}</span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Địa chỉ</span>
                </td>
                <td>
                    <span>${user.profile.address}</span>
                </td>
            </tr>

        </table>
    </div>
               
                 <div class="col-md-6">
        <table class="table table-dark table-hover">
            <tr>
                <th class="text-center" colspan="4">
                    <h3><i><span >Thông tin Giỏ hàng</span></i></h3>
                </th>
            </tr>
            <tr>
                <td>
                    <span>Tên Sp</span>
                </td>
                <td>
                    <span>Số lượng</span>
                </td>
                <td>
                    <span>Đơn giá</span>
                </td>
                <td>
                    <span>Tổng tiền</span>
                </td>
            </tr>
            <c:forEach var="orderDestails" items="${cart.order.orderDestailsList}">
                
                <tr>
                <td>
                    <span>${orderDestails.product.productName}</span>
                </td>
                <td>
                    <span>${orderDestails.quantity}</span>
                </td>
                <td>
                    <span>${orderDestails.product.unitPriceString}</span>
                </td>
                <td>
                    <span> ${orderDestails.sumPrice}</span>
                </td>
            </tr>
            </c:forEach>
             <tr>
                 <td colspan="3">
                    <span>Tổng tiền thanh toán</span>
                </td>
                <td>
                    <span>${cart.order.sumPrice}</span>
                </td>
            </tr>
            <tr>
                 <td colspan="3">
                   
                </td>
                <td>
                    <span><button class="btn-primary btn">Thanh toán</button></span>
                </td>
            </tr>
        </table>
    </div>
               
    </div>
                
              
</section>

<jsp:include page="../include/footer.jsp"/>
