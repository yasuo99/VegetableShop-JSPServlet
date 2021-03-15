<%-- 
    Document   : cart
    Created on : Dec 10, 2020, 9:56:47 PM
    Author     : Thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
        <c:import url="nav.jsp"/>
            <!-- Start Cart  -->
            <div class="cart-box-main">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="table-main table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Images</th>
                                            <th>Product Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="total" value="${0}"/>
                                    <c:forEach var="item" items="${requestScope.cart}">
                                        <c:set var = "itemTotal" value="${item.quantity * item.product.price}"/>
                                        <tr>
                                            <td class="thumbnail-img">
                                                <a href="#">
                                                    <img class="img-fluid" src="<%=request.getContextPath()%><c:out value="${item.product.image}"></c:out>" alt="" />
                                                    </a>
                                                </td>
                                                <td class="name-pr">
                                                    <a href="#">
                                                    <c:out value="${item.product.name}"></c:out>
                                                    </a>
                                                </td>
                                                <td class="price-pr">
                                                    <p><c:out value="${item.product.price} vnđ"></c:out></p>
                                                </td>
                                                <td class="quantity-box"><input class="quantity" type="number" data-id="<c:out value="${item.product.id}"></c:out>" size="4" value="<c:out value="${item.quantity}"></c:out>" min="0" step="1" class="c-input-text qty text"></td>
                                                <td class="total-pr">
                                                        <p><c:out value="${itemTotal} vnđ"></c:out></p>
                                                </td>
                                                <td class="remove-pr">
                                                    <a href="" data-id="${item.product.id}" class="remove">
                                                    <i class="fas fa-times"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <c:set var="total" value="${total + item.product.price*item.quantity}"/>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row my-5">
                    <div class="col-lg-6 col-sm-6 offset-lg-6">
                        <div class="update-box">
                            <input value="Update Cart" type="submit" id="submit">
                        </div>
                    </div>
                </div>

                <div class="row my-5">
                    <div class="col-lg-8 col-sm-12"></div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="order-box">
                            <h3>Order summary</h3>
                            <div class="d-flex">
                                <h4>Shipping Cost</h4>
                                <div class="ml-auto font-weight-bold"> Free </div>
                            </div>
                            <hr>
                            <div class="d-flex gr-total">
                                <h5>Grand Total</h5>
                                <div class="ml-auto h5"> <c:out value="${total} vnđ"></c:out> </div>
                                </div>
                                <hr> </div>
                        </div>
                        <div class="col-12 d-flex shopping-box"><a href="<%=request.getContextPath()%>/checkout" class="ml-auto btn hvr-hover">Checkout</a> </div>
                    </div>

                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
            <script>
                $(document).ready(function () {
                    $(".remove").click(function () {
                        console.log($(this).attr("data-id"));
                        var id = $(this).attr("data-id");
                        $.ajax({
                            url: "<%=request.getContextPath()%>/cart",
                            method: "post",
                            data: {id: id, type: "delete"},
                            success: function (response) {
                            }
                        })
                    });
                    $("#submit").click(function () {
                        var data = new Array();
                        $("input").each(function () {
                            if ($(this).attr("data-id")) {
                                data.push($(this).val());
                            }
                        });
                        console.log(data);
                        $.ajax({
                            url: "<%=request.getContextPath()%>/cart",
                            method: "post",
                            data: {data: data, type: "update"},
                            success: function (res) {
                                location.reload();
                            }
                        })
                        
                    }
                    )
                })
        </script>
    </body>
</html>
