<%-- 
    Document   : orderdetail
    Created on : Dec 12, 2020, 2:39:53 PM
    Author     : Thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
        <c:import url="nav.jsp"/>
        <!-- Start Order  -->
        <div class="wishlist-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-main table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Hình</th>
                                        <th>Tên sp</th>
                                        <th>Giá </th>
                                        <th>Số lượng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="total" value="${0}"/>
                                    <c:forEach var="item" items="${requestScope.orderitems}">
                                        <c:set var="total" value="${total + item.product.price * item.quantity}"/>
                                        <tr>
                                            <td class="thumbnail-img">
                                                <a href="<%=request.getContextPath()%>/shop-detail?id=${item.product.id}">
                                                    <img class="img-fluid" src="<%=request.getContextPath()%>${item.product.image}" alt="" />
                                                </a>
                                            </td>
                                            <td class="name-pr">
                                                <a href="#">
                                                    <c:out value="${item.product.name}"></c:out>
                                                    </a>
                                                </td>
                                                <td class="price-pr">
                                                <c:out value="${item.product.price}"></c:out>
                                                </td>
                                                <td class="quantity-box"> <c:out value="${item.quantity}"></c:out></td>
                                            </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <hr/>
                            <div class="row">
                                <div class="offset-md-6">
                                    <p>Tổng giá trị đơn hàng: <c:out value="${total}"></c:out></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Order -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
