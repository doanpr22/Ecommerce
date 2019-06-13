<%-- 
    Document   : gioi-hang
    Created on : May 31, 2019, 10:49:47 AM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="include/header.jsp"/>
<main class=" row">
    <h2 class="text-left col-sm-12">Giỏ hàng của bạn (2 sản phẩm)</h2>
    <div class="container"> 
        <table id="cart" class="table table-hover table-condensed"> 
            <thead> 
                <tr> 
                    <th style="width:50%">Tên sản phẩm</th> 
                    <th style="width:10%">Giá</th> 
                    <th style="width:10%">Số lượng</th> 
                    <th style="width:20%" class="text-center">Thành tiền</th> 
                    <th style="width:10%"> </th> 
                </tr> 
            </thead> 
            <script>
                $(function (){
                    $('#quantity-cart').change(){
                        $('#sum-price').text("Thành công")
                    }
                })
            </script>
              
            <tbody>
                <c:forEach var="orderDestails" items="${order.orderDestailsList}">
                    <tr>

                        <td data-th="Product"> 
                            <div class="row"> 
                                <div class="col-sm-2 hidden-xs"><img src="<%=request.getContextPath()%>${orderDestails.product.urlImage}" alt="Sản phẩm 1" class="img-responsive" width="100">
                                </div> 
                                <div class="col-sm-10"> 
                                    <h4 class="nomargin">${orderDestails.product.productName}</h4> 
                                    <p>${orderDestails.product.description}</p> 
                                </div> 
                            </div> 
                        </td> 
                        <td data-th="Price">${orderDestails.product.unitPriceString}</td> 
                        <td data-th="Quantity"><input class="form-control text-center" id="quantity-cart" value="${orderDestails.quantity}" type="number" min="1">
                        </td> 
                        <td data-th="Subtotal" class="text-center" ><p id="sum-price">200.000 đ</p></td> 
                        <td class="actions" data-th="">
                            <a class="btn btn-danger btn-sm" id="delete-card" href="<%=request.getContextPath()%>/cart/delete?id=${orderDestails.id}"><i class="fa fa-trash"></i>
                            </a>
                            <a class="btn btn-danger btn-sm" id="delete-card" href="<%=request.getContextPath()%>/?id=${orderDestails.id}"><i class='fab fa-amazon-pay' style='font-size:20px;color:#155BF2'></i>
                            </a>
                           
                        </td> 
                    </tr>
                </c:forEach>
            </tbody><tfoot> 
                <tr> 
                    <td><a href="<%=request.getContextPath()%>" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
                    </td> 
                    <td colspan="2" class="hidden-xs"> </td> 
                    <td class="hidden-xs text-center"><strong>Tổng tiền 500.000 đ</strong>
                    </td> 
                    <td>
                        
                        <a href="" class="btn btn-success btn-block"> <i class='fab fa-amazon-pay' style='font-size:20px;color:#155BF2'></i>Thanh toán tất cả<i class="fa fa-angle-right"></i></a>
                    </td> 
                </tr> 
            </tfoot> 
        </table>
    </div>
</main>
<jsp:include page="include/footer.jsp"/>
