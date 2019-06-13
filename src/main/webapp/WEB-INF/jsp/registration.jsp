<%-- 
    Document   : registration
    Created on : Jun 11, 2019, 10:00:27 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/main-left-top.jsp"/>


<section class="container-fluid" id="form-dangki">
    <div  > 
        <div class="col-md-offset-4""> 

            <legend class="text-center"> Đăng ký thành viên!
            </legend> 
            <mvc:form modelAttribute="customer" action="save-customer"  method="post" class="form" role="form"> 
                <div class="row"> 
                    <div class="col-xs-6 col-md-12"> <mvc:input class="form-control" path="profile.lastname" placeholder="Họ" required="" type="text"/> 
                    </div> 
                    <div class="col-xs-6 col-md-12"> <mvc:input class="form-control" path="profile.firstname" placeholder="Tên" required="" type="text"/> 
                    </div> 
                </div>
                <mvc:input class="form-control" path="profile.email" placeholder="Email" type="email"/> 
                <mvc:input class="form-control" path="username" placeholder="username" type="text"/> 

                <mvc:input class="form-control" path="password" placeholder="Mật khẩu" type="password"/>
                <input class="form-control" name="retypepassword" placeholder="Nhập lại mật khẩu" type="password">
                <label for=""> Ngày sinh</label> 
                <mvc:input class="form-control" path="profile.birthDate" type="date"/>
                <label class="radio-inline"> 
                    <mvc:radiobutton path="profile.gender" id="inlineCheckbox1" value="true"/> Nam </label> 
                <label class="radio-inline">         
                    <mvc:radiobutton path="profile.gender" id="inlineCheckbox2" value="false"/> 
                    Nữ </label> 
                <br> 
                <br> 
               <button class="btn btn-lg btn-primary btn-block form-dangki-submit" type="submit"> Đăng ký</button> 
            </mvc:form> 
        </div>
    </div>
</section>>


<jsp:include page="include/footer.jsp"/>y>
