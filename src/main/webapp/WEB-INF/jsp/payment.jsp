<%-- 
    Document   : gioi-hang
    Created on : May 31, 2019, 10:49:47 AM
    Author     : USER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/main-left-top.jsp"/>

<main  id="notNullProduct">
    <script type="text/javascript">
        function confirmAction() {
        return confirm("Bạn có muốn đặt hàng các sản phẩm này?")
    }
</script>
    <script src="<%=request.getContextPath()%>/js/payment.js"></script>
    <mvc:form modelAttribute="order" action="/E-Commerce/order" method="POST">
        <div class="row">
            <div class="container col-md-8"> 

                <h4 class="col-sm-12"><span>Giỏ hàng của bạn (${order.getOrderDestailsList().size()} sản phẩm)</span></h4>

                <table id="cart" class="table table-hover table-condensed"> 
                    <tbody>
                    <input type="hidden" id="product-number" value=" ${order.getOrderDestailsList().size()}"/>
                    <c:forEach var="orderDestails" items="${order.orderDestailsList}">
                        <tr>
                            <td data-th="Product" style="width:50%"> 
                                <div class="row"> 
                                    <div class="col-sm-4 hidden-xs"><img src="<%=request.getContextPath()%>${orderDestails.product.urlImage}" alt="Sản phẩm 1" class="img-responsive" width="100">
                                    </div> 
                                    <div class="col-sm-8"> 
                                        <h4 class="nomargin">${orderDestails.product.productName}</h4> 
                                    </div> 
                                </div> 
                            </td> 
                            <td data-th="Price" style="width:20%">${orderDestails.product.unitPriceString}</td> 
                        <input type="hidden" class="urlResetCart" value="<%=request.getContextPath()%>/cart/reset?id=${orderDestails.product.id}&quantity="/>
                        <td data-th="Quantity" style="width:20%"><input class="form-control text-center" onchange='resetCart()' 
                                                                        class="quantity-cart" value="${orderDestails.quantity}" type="number" min="1">
                        </td> 

                        <td class="actions" data-th="" style="width:10%">
                            <a class="btn btn-danger btn-sm" id="delete-card" href="<%=request.getContextPath()%>/cart/deletePayment?id=${orderDestails.id}"><i class="fa fa-trash"></i>
                            </a>
                        </td> 
                        </tr>
                    </c:forEach>
                    </tbody><tfoot> 
                        <tr> 
                            <td>
                                <a href="<%=request.getContextPath()%>" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
                            </td> 
                            <td class="hidden-xs">Tổng tiền:  </td> 
                            <td class="hidden-xs text-center"><strong>${order.sumPrice}</strong>
                            </td> 
                            <td>
                            </td> 
                        </tr> 
                    </tfoot> 
                </table>
            </div>
            <div class="container col-md-8 table-payment"> 
                <table class="table">
                    <mvc:hidden path="user.id"/>
                    <tr>
                        <td colspan="2" class="text-center"><span><i>Thông tin khách hàng</i></span></td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            Họ: <i style="color: red;">*</i>
                        </td>
                        <td style="width: 80%">
                            <mvc:input path="user.profile.lastname" cssStyle="width: 100%;padding: 10px;border-radius: 50px 20px;" required="" placeholder="Nhập họ của bạn"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            Tên: <i style="color: red;">*</i>
                        </td>
                        <td style="width: 80%">
                            <mvc:input path="user.profile.firstname" cssStyle="width: 100%;padding: 10px;border-radius: 50px 20px;" required="" placeholder="Nhập Tên của bạn"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            Số điện thoại: <i style="color: red;">*</i>
                        </td>
                        <td style="width: 80%">
                            <mvc:input path="user.profile.phone" cssStyle="width: 100%;padding: 10px;border-radius: 50px 20px;" required="" placeholder="Nhập số điện thoại"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email:
                        </td>
                        <td>
                            <mvc:input path="user.profile.email" cssStyle="width: 100%;padding: 10px;border-radius: 50px 20px;" required="" placeholder="Nhập địa chỉ Email"/>
                            <p>(Chi tiết đơn hàng sẽ được gửi vào email)</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Loại thanh toán:
                        </td>
                        <td>
                            <mvc:select path="paymentType.id" items="${listPaymentType}" itemValue="id" itemLabel="paymentType"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a style="width: 40%;padding: 10px" class="float-left btn btn-success">Chuyển khoản 
                                <i style="font-size: 30px;"class="fas fa-angle-double-right float-right"></i></a>
                                <input style="width: 40%;padding: 10px" class="float-right btn btn-primary fas fa-phone-volume float-right" type="submit" value="Đặt hàng ngay"/>
                        </td>
                    </tr>

                </table>

            </div>   
        </div>

    </mvc:form>


</main>
<main id="nullProduct">
    <h2 class="text-center">Chưa có sản phẩm để thanh toán!<br> Nhấn vào <a href="<%=request.getContextPath()%>">tôi</a> trở về trang chủ</h2>
    <div class="form-cart row">
        <div class="col-md-4"></div>
        <form class="form-inline col-md-4" action="search">
            <input class="form-control mr-md-2 text-center" name="searchValue" type="text" placeholder="Tìm kiếm...">
            <button class="btn btn-success" type="submit">Tìm kiếm</button>
        </form>
    </div>
</main>
<jsp:include page="include/footer.jsp"/>
