<%-- 
    Document   : newproduct
    Created on : May 30, 2019, 4:14:15 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>

<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>

<jsp:include page="../include/main-left-top.jsp"/>
<script src="<%=request.getContextPath()%>/js/crudProduct.js" type="text/javascript"></script>
<section >    
    <div id="table-newproduct">
        <input type="hidden" id="action" value="${action}"/>
        <h2 class="text-center product-title"></h2>
            <mvc:form modelAttribute="product" enctype="multipart/form-data" action="save-product" method="POST" class="row container them-sp">

            <c:if test="${action.equals('edit')}">
                <mvc:hidden path="id"/>
                <mvc:hidden path="productDestails.id"/>
            </c:if>
            <div class="col-md-4">
                <table class="table table-dark table-hover">
                    <tr>
                        <th colspan="2">
                            <p class="text-center h2">Thông tin cơ bản</p>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Tên sản phẩm</span></p>
                        </td>
                        <td>
                            <mvc:input path="productName" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Nhà cung cấp</span></p>
                        </td>
                        <td>
                            <mvc:input list="producer" path="producer.producerName" placeholder="Nhà cung cấp" />
                            <datalist id="producer">
                                <c:forEach var="producer" items="${listProducer}">
                                    <option value="${producer.producerName}"/>
                                </c:forEach>
                            </datalist>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Hãng sản xuất</span></p>
                        </td>
                        <td>
                            <mvc:input list="category" path="category.categoryName" placeholder="Hãng sản xuất" />
                            <datalist id="category">
                                <c:forEach var="category" items="${listCategory}">
                                    <option value="${category.categoryName}"/>
                                </c:forEach>
                            </datalist>
                       <%--     <mvc:select path="category.id" items="${listCategory}" itemLabel="categoryName" itemValue="id"/>
                     --%>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p><span>Mô tả</span></p>
                        </td>
                        <td>
                            <mvc:input path="description" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Giá tiền</span></p>
                        </td>
                        <td>
                            <mvc:input path="unitPrice" />
                            
                        </td>
                    </tr>

                </table>
            </div>
            <div class="col-md-4">
                <table class="table table-dark table-hover">
                    <tr>
                        <th colspan="2">
                            <p class="text-center h2">Thông tin chi tiết</p>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Màn hình</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.manhinh"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Độ phận giải màn hình</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.dophangiai"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Hệ điều hành</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.hedieuhanh"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Màu sắc</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.mau"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>CPU</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.CPU"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Bộ nhớ trong</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.bonhotrong"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Ram</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.ram"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Camera trước</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.cameratruoc"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Camera sau</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.camerasau"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Số thẻ sim</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.khecamsim" type="number" min="1"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Trọng lượng</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.trongluong" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Kích thước</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.kichthuoc" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Thời gian BH</span></p>
                        </td>
                        <td>
                            <mvc:input path="productDestails.baohanh" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-md-4" id="anh-sp">
                <table class="table table-dark table-hover">
                    <tr>
                        <th colspan="2">
                            <p class="text-center h2">Chi tiết hình ảnh</p>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Ảnh Trang chủ</span></p>
                        </td>
                        <td>
                            <input type="file" class="custom-file" name="files">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Ảnh 1</span></p>
                        </td>
                        <td>
                            <input type="file" class="custom-file" name="files">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Ảnh 2</span></p>
                        </td>
                        <td>
                            <input type="file" class="custom-file" name="files">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><span>Ảnh 3</span></p>
                        </td>
                        <td>
                            <input type="file" class="custom-file" name="files">
                        </td>
                    </tr>


                </table>
            </div>

            <input type="submit" class="btn btn-primary" value="Thêm sản phẩm" class="form-control"/>
        </mvc:form>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>