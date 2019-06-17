<%-- 
    Document   : gioi-hang
    Created on : May 31, 2019, 10:49:47 AM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="utility.FormatMoney"%>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/main-left-top.jsp"/>

<main class=" row" id="notNullProduct">
    <h2 class="text-center col-sm-12">Giỏ hàng của bạn (${order.getOrderDestailsList().size()} sản phẩm)</h2>
    <div class="container"> 
        
        <table id="cart" class="table table-hover table-condensed"> 
            <thead> 
                <tr> 
                    <th style="width:70%">Tên sản phẩm</th> 
                    <th style="width:15%">Giá</th> 
                    <th style="width:10%">Số lượng</th> 
                    <th style="width:30%" class="text-center">Thành tiền</th> 
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
                                <p>${orderDestails.product.description}</p> 
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

                        <a href="<%=request.getContextPath()%>/cart/paymentAll" class="btn btn-success btn-block"> <i class='fab fa-amazon-pay' style='font-size:20px;color:#155BF2'></i>Thanh toán tất cả<i class="fa fa-angle-right"></i></a>
                    </td> 
                </tr> 
            </tfoot> 
        </table>
    </div>
</main>
<main id="nullProduct">
    <h2 class="text-center">Bạn chưa mua được gì hả?<br> Nhấn vào <a href="<%=request.getContextPath()%>">tôi</a> để chon sản phẩm nè!</h2>
    <div class="form-cart row">
        <div class="col-md-4"></div>
        <form class="form-inline col-md-4" action="search">
            <input class="form-control mr-md-2 text-center" name="searchValue" type="text" placeholder="Tìm kiếm...">
            <button class="btn btn-success" type="submit">Tìm kiếm</button>
        </form>
    </div>
</main>
<jsp:include page="include/footer.jsp"/>
