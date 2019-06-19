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
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <table class="table table-hover">
                <tr>
                    <th class="text-center" colspan="2">
                        <h3><i><span >Thông tin Quản lý</span></i></h3>
                    </th>
                </tr>
                <tr>
                    <td style="width: 40%">
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
                <tr>
                    <td>
                        <a href="http://localhost:8084/E-Commerce/users/editprofile" class="btn btn-danger text-center"><span>Chỉnh sửa</span></a>
                    </td>
                    <td>
                      <a href="http://localhost:8084/E-Commerce/customer/listOrder" class="btn btn-success text-center"><span>Danh sách đơn hàng</span></a>
                    </td>
                </tr>

            </table>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
