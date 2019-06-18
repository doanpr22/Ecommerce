<%-- 
    Document   : orderList
    Created on : Jun 18, 2019, 9:40:15 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<jsp:include page="../include/main-left-top.jsp"/>
<section>
    <c:forEach var="order" items="${listOrder}">
        <div class="container row">
            <div class="col-md-2"></div>

            <div class="col-md-8">
                <table class="table table-dark table-hover">
                    <tr>
                        <td><span><i>Mã Order</i></span></td>
                        <td><span><i>Ngày order</i></span></td>
                        <td><span><i>Hình thức thanh toán</i></span></td>
                    </tr>
                    <tr>
                        <td><span><i>${order.id}</i></span></td>
                        <td><span><i>${order.orderDate}</i></span></td>
                        <td><span><i>${order.paymentType.payentType}</i></span></td>
                    </tr>
                </table>
            </div>
            <div class="container row"> 

                <div class="col-md-2"></div>
                <table id="cart" class="table table-hover table-condensed col-md-8"> 
                    <thead> 
                        <tr> 
                            <th style="width:70%">Tên sản phẩm</th> 
                            <th style="width:20%">Giá</th> 
                            <th style="width:30%">Số lượng</th> 
                            <th style="width:20%" class="text-center">Thành tiền</th> 
                            <th style="width:5%"> </th> 
                        </tr> 
                    </thead>               
                    <tbody>
                    <input type="hidden" id="product-number" value=" ${order.getOrderDestailsList().size()}"/>
                    <c:forEach var="orderDestails" items="${order.orderDestailsList}">
                        <tr>
                            <td data-th="Product"> 
                                <div class="row"> 
                                    <div class="col-sm-4 hidden-xs"><img src="<%=request.getContextPath()%>${orderDestails.product.urlImage}" alt="Sản phẩm 1" class="img-responsive" width="100">
                                    </div> 
                                    <div class="col-sm-8"> 
                                        <h4 class="nomargin">${orderDestails.product.productName}</h4> 
                                    </div> 
                                </div> 
                            </td> 
                            <td data-th="Price">${orderDestails.product.unitPriceString}</td> 
                        <input type="hidden" class="urlResetCart" value="<%=request.getContextPath()%>/cart/reset?id=${orderDestails.product.id}&quantity="/>
                        <td data-th="Quantity"><input class="form-control text-center" onchange='resetCart()' 
                                                      class="quantity-cart" value="${orderDestails.quantity}" type="number" min="1">
                        </td> 

                        <td data-th="Subtotal" class="text-center" ><p class="sum-price">${orderDestails.sumPrice}</p></td> 
                        <td class="actions" data-th="">
                            <a class="btn btn-danger btn-sm" id="delete-card" href="<%=request.getContextPath()%>/cart/delete?id=${orderDestails.id}"><i class="fa fa-trash"></i>
                            </a>
                            <a class="btn btn-danger btn-sm" id="delete-card" href="<%=request.getContextPath()%>/cart/paymentDestails?idOrderDestails=${orderDestails.id}"><i class='fab fa-amazon-pay' style='font-size:20px;color:#155BF2'></i>
                            </a>

                        </td> 
                        </tr>
                    </c:forEach>
                    </tbody><tfoot> 
                        <tr> 
                            <td><a href="<%=request.getContextPath()%>" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
                            </td> 
                            <td colspan="2" class="hidden-xs">Tổng tiền:  </td> 
                            <td class="hidden-xs text-center"><strong>${order.sumPrice}</strong>
                            </td> 
                            <td>

                                <a href="<%=request.getContextPath()%>/payment/all" class="btn btn-success btn-block"> <i class='fab fa-amazon-pay' style='font-size:20px;color:#155BF2'></i>Thanh toán tất cả<i class="fa fa-angle-right"></i></a>
                            </td> 
                        </tr> 
                    </tfoot> 
                </table>
            </div>
        </div>
    </c:forEach>
</section>
<jsp:include page="../include/footer.jsp"/>
