<%-- 
    Document   : registration
    Created on : Jun 11, 2019, 10:00:27 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/main-left-top.jsp"/>


<section class="container-fluid signin">
    <div class="row">
        <div class="col-md-5">
            <mvc:form  modelAttribute="customer" action="customer/signin"  method="post" class="form">
                <h2>Đăng ký</h2>
                <div class="form-group">
                    <div class="form-row">
                        <div class="col">
                            <label>Tên</label>
                            <mvc:input class="form-control" path="profile.firstname" placeholder="Tên" required=""/> 
                        </div>
                        <div class="col">
                            <label>Họ</label>
                            <mvc:input class="form-control" path="profile.lastname" placeholder="Họ của bạn" required=""/>                             </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Username</label>
                    <mvc:input class="form-control" path="username" placeholder="Usenname"/> 
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <mvc:input class="form-control" path="profile.email" placeholder="Email" type="email"/> 
                </div>

                <div class="form-group">
                    <label>Mật khẩu</label>
                    <mvc:password class="form-control" path="password" placeholder="Mật khẩu"/>
                </div>
                <div class="form-group">
                    <label>Giới tính</label>
                    <div class="row" data-toggle="buttons">
                        <div class="col">
                            <label class="btn btn-outline-secondary">Nam
                                <mvc:radiobutton path="profile.gender" value="true"/> Nam </label> 
                        </div>
                        <div class="col">
                            <label class="btn btn-outline-secondary">Nữ
                                <mvc:radiobutton path="profile.gender"  value="false"/> Nữ </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="checkbox" required name="">
                    <label>Tôi đồng ý điều khoản sử dụng</label>
                </div>
                <div class="form-group">
                    <button class="btn btn-success" type="submit">Đăng ký</button>
                </div>
            </mvc:form>
        </div>		
    </div>

</section>


<jsp:include page="include/footer.jsp"/>y>
