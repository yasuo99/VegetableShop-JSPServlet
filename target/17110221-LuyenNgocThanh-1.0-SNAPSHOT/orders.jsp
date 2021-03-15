<%-- 
    Document   : orders
    Created on : Dec 12, 2020, 2:23:27 PM
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
                                        <th>Ngày đặt</th>
                                        <th>Tên người nhận</th>
                                        <th>SĐT</th>
                                        <th>Địa chỉ</th>
                                        <th>Tổng tiền</th>
                                        <th>Trạng thái</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${requestScope.orders}">
                                        <tr>
                                            <td >
                                                <c:out value="${order.orderDate}"></c:out>
                                                </td>
                                                <td class="name-pr">
                                                <c:out value="${order.fullname}"></c:out>
                                                </td>
                                                <td class="quantity-box"><c:out value="${order.phone}"></c:out></td>
                                                <td class="add-pr">
                                                <c:out value="${order.address}"></c:out>
                                                </td>
                                                <td class="remove-pr">
                                                <c:out value="${order.total}"></c:out>
                                                </td>
                                                <td>
                                                <c:out value="${order.status}"></c:out>
                                                </td>
                                                <td>
                                                    <a class="btn btn-primary" href="<%= request.getContextPath()%>/order-detail?id=${order.id}">Chi tiết</a>
                                                <c:if test="${order.status == 'new'}">
                                                    <button data-id="${order.id}" class="btn btn-danger deleteBtn">Xóa</button>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Order -->
        <jsp:include page="footer.jsp"></jsp:include>
            <script>
                $(document).ready(function () {
                    $(".deleteBtn").click(function () {
                        $.ajax({
                            url: '<%=request.getContextPath()%>/orders',
                            method: 'post',
                            data: {id: $(this).attr('data-id')},
                            success: function (response) {
                                location.reload();
                            }
                        });
                    });
                });
        </script>
    </body>
</html>
