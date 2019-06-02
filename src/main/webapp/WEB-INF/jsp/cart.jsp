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
            <tbody>
                <tr> 
                    <td data-th="Product"> 
                        <div class="row"> 
                            <div class="col-sm-2 hidden-xs"><img src="<%=request.getContextPath()%>/image/iPhone/8-plus-gold_13_2.jpg" alt="Sản phẩm 1" class="img-responsive" width="100">
                            </div> 
                            <div class="col-sm-10"> 
                                <h4 class="nomargin">iPhone 8</h4> 
                                <p>iPhone 8 64Gb – Thành viên tiếp theo của dòng siêu phẩm iPhone đã trình làng với những nâng cấp “nhẹ nhàng” so với sản phẩm tiền nhiệm.</p> 
                            </div> 
                        </div> 
                    </td> 
                    <td data-th="Price">200.000 đ</td> 
                    <td data-th="Quantity"><input class="form-control text-center" value="1" type="number">
                    </td> 
                    <td data-th="Subtotal" class="text-center">200.000 đ</td> 
                    <td class="actions" data-th="">
                        <button class="btn btn-info btn-sm"><i class="fa fa-edit"></i>
                        </button> 
                        <button class="btn btn-danger btn-sm"><i class="fa fa-trash"></i>
                        </button>
                    </td> 
                </tr> 
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
                        <td data-th="Price">${orderDestails.product.unitPrice}&nbsp;đ</td> 
                        <td data-th="Quantity"><input class="form-control text-center" value="${orderDestails.quantity}" type="number">
                        </td> 
                        <td data-th="Subtotal" class="text-center" >200.000 đ</td> 
                        <td class="actions" data-th="">
                            <button class="btn btn-info btn-sm"><i class="fa fa-edit"></i>
                            </button> 
                            <button class="btn btn-danger btn-sm"><i class="fa fa-trash"></i>
                            </button>
                        </td> 
                    </tr>
                </c:forEach>
            <script>
                
                </script>

            </tbody><tfoot> 
                <tr class="visible-xs"> 
                    <td class="text-center"><strong>Tổng 200.000 đ</strong>
                    </td> 
                </tr> 
                <tr> 
                    <td><a href="<%=request.getContextPath()%>" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
                    </td> 
                    <td colspan="2" class="hidden-xs"> </td> 
                    <td class="hidden-xs text-center"><strong>Tổng tiền 500.000 đ</strong>
                    </td> 
                    <td><a href="http://hocwebgiare.com/" class="btn btn-success btn-block">Thanh toán <i class="fa fa-angle-right"></i></a>
                    </td> 
                </tr> 
            </tfoot> 
        </table>
    </div>
</main>
<jsp:include page="include/footer.jsp"/>
