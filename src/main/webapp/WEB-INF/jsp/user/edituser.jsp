<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>

<jsp:include page="../include/header.jsp"/>

<jsp:include page="../include/main-left-top.jsp"/>

<section>
    <script type="text/javascript">
        function confirmAction() {
        return confirm("Bạn có muốn chỉnh sửa thông tin quản lý?");
    }
</script>
    <div class="row">
        <div class="col-md-3"></div>

        <div class="col-md-5">
            <mvc:form  modelAttribute="user" action=""  method="post" class="form form_register">
                <h2 class="text-center">Chỉnh sửa thông tin quản lý</h2>
                <mvc:hidden path="id"/>
                <mvc:hidden path="profile.id"/>
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
                    <label>Địa chỉ</label>
                    <mvc:input class="form-control" path="profile.address" required="" placeholder="Nhập địa chỉ"/> 
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <mvc:input class="form-control" path="profile.email" required="" placeholder="Email" type="email"/>
                    <span id="email_error"  class="red"></span>
                </div>
                    <div class="form-group">
                    <label>Ngày sinh</label>
                    <mvc:input class="form-control" path="profile.birthDate" required="" placeholder="Ngày sinh" type="date"/>
                </div>
                <div class="form-group">
                    <label>Giới tính</label>
                    <div class="row" data-toggle="buttons">
                        <div class="col">
                            <label class="btn btn-outline-secondary">
                                <mvc:radiobutton path="profile.gender" value="true"/> Nam </label> 
                        </div>
                        <div class="col">
                            <label class="btn btn-outline-secondary">
                                <mvc:radiobutton path="profile.gender"  value="false" /> Nữ </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button class="btn btn-success float-right" style="width: 200px" onclick="return confirmAction()" type="submit">Lưu thông tin</button>
                </div>
            </mvc:form>
        </div>
    </div>
</section>
<jsp:include page="../include/footer.jsp"/>
