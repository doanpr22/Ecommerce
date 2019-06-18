<%-- 
    Document   : registration
    Created on : Jun 11, 2019, 10:00:27 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/main-left-top.jsp"/>
<script src="<%=request.getContextPath()%>/js/validateForm.js" type="text/javascript"></script>

<section class="container-fluid signin">
    <div class="row">
        <div class="col-md-3"></div>

        <div class="col-md-5">
            <mvc:form  modelAttribute="customer" action="saveRegistration"  method="post" class="form form_register">
                <h2 class="text-center">Đăng ký</h2>
                <div class="form-group">
                    <div class="form-row">
                        <div class="col">
                            <label>Tên</label>
                            <mvc:input class="form-control"  path="profile.firstname" required="" placeholder="Tên"/> 
                             <span id="firstname_error"  class="red"></span>

                        </div>
                        <div class="col">
                            <label>Họ</label>
                            <mvc:input class="form-control" path="profile.lastname" required="" placeholder="Họ của bạn"/>                             </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Username</label>
                    <mvc:input class="form-control" path="username" required="" placeholder="Usenname"/> 
                    <span id="username_error" class="red"></span>
                </div>
                <div class="form-group">
                    <label>Điện thoại</label>
                    <mvc:input class="form-control" path="profile.phone" required="" placeholder="Nhập số điện thoại"/> 
                    <span id="phone_error"  class="red"></span>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <mvc:input class="form-control" path="profile.email" required="" placeholder="Email" type="email"/>
                    <span id="email_error"  class="red"></span>
                </div>

                <div class="form-group">
                    <label>Mật khẩu</label>
                    <mvc:password class="form-control" path="password" required="" placeholder="Mật khẩu"/>
                    <span id="password_error"  class="red"></span>
                </div>
                <div class="form-group">
                    <label>Nhập lại Mật khẩu</label>
                    <input class="form-control" id="re_password" required="" type="password" placeholder="Mật khẩu"/>
                    <span id="re_password_error"  class="red"></span>
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
                                <mvc:radiobutton path="profile.gender"  value="false" /> Nữ </label>
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
