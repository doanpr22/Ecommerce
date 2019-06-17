<%-- 
    Document   : profilecustomer
    Created on : Jun 15, 2019, 12:47:58 PM
    Author     : USER
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>

<jsp:include page="../include/header.jsp"/>

<jsp:include page="../include/main-left-top.jsp"/>

<section>
    <div>
        <div>
            <mvc:form modelAttribute="customer" action="savecustomer" method="POST">
                <table>
                    <tr>
                        <td colspan="2">Thông tin khách hàng</td>
                    </tr>
                    <tr>
                        <td>Họ </td>
                        <td><mvc:input path="customer.profile.lastname"/></td>
                    </tr>
                    <tr>
                        <td>Tên </td>
                        <td><mvc:input path="customer.profile.firstname"/></td>
                    </tr>
                    <tr>
                        <td>Username </td>
                        <td><mvc:input path="customer.username"/></td>
                    </tr>
                    <tr>
                        <td>Giới tính </td>
                        <td>
                    <mvc:select path="customer.gender">
                    </mvc:select></td>
                    </tr>
                    <tr>
                        <td>Ngày sinh </td>
                        <td><mvc:input path="customer.profile.birthDate" type="date"/></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ </td>
                        <td><mvc:input path="customer.profile.address"/></td>
                    </tr>
                    <tr>
                        <td>Email </td>
                        <td><mvc:input path="customer.profile.email" type="email"/></td>
                    </tr>
                     <tr>
                        <td>Điện thoại </td>
                        <td><mvc:input path="customer.profile.phone"/></td>
                    </tr>
                </table>
            </mvc:form>
        </div>
    </div>
</section>
<jsp:include page="../include/footer.jsp"/>
