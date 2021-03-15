<%-- 
    Document   : checkout
    Created on : Dec 10, 2020, 11:51:25 PM
    Author     : Thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
        <c:import url="nav.jsp" />
        <div class="cart-box-main">
            <div class="container">
                <form method="post">
                    <div class="row">
                        <div class="col-sm-6 col-lg-6 mb-3">
                            <div class="checkout-address">
                                <div class="title-left">
                                    <h3>Billing address</h3>
                                </div>
                                <form method="post" action="" class="needs-validation" novalidate id="info-form">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="firstName">Họ và tên người nhận *</label>
                                            <input name="fullname" type="text" value="${sessionScope.account.fullname}" class="form-control" id="firstName" placeholder="" value="" required>
                                            <div class="invalid-feedback"> Valid first name is required. </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="phone">Phone *</label>
                                        <input name="phone" type="text" value="${sessionScope.account.phone}" class="form-control" id="phone" placeholder="" required>
                                        <div class="invalid-feedback"> Phone is required. </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email">Email Address *</label>
                                        <input name="email" type="email" value="${sessionScope.account.email}" class="form-control" id="email" placeholder="">
                                        <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="address">Address *</label>
                                        <input name="address" type="text" value="${sessionScope.account.address}" class="form-control" id="address" placeholder="" required>
                                        <div class="invalid-feedback"> Please enter your shipping address. </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="zip">Zip code *</label>
                                        <input name="zipcode" type="number" class="form-control" id="address" placeholder="" required>
                                        <div class="invalid-feedback"> Please enter your zipcode. </div>
                                    </div>
                                    <hr class="mb-4">
                                    <hr class="mb-4">
                                    <hr class="mb-1"> </form>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-6 mb-3">
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="shipping-method-box">
                                        <div class="title-left">
                                            <h3>Shipping Method</h3>
                                        </div>
                                        <div class="mb-4" id="shippingMethod">
                                            <div class="custom-control custom-radio">
                                                <input id="shippingOption1" name="shippingoption" value="free" class="custom-control-input" checked="checked" type="radio">
                                                <label class="custom-control-label" for="shippingOption1">Standard Delivery</label> <span class="float-right font-weight-bold">FREE</span> </div>
                                            <div class="ml-4 mb-2 small">(3-7 business days)</div>
                                            <div class="custom-control custom-radio">
                                                <input id="shippingOption2" name="shippingoption" value="10" class="custom-control-input" type="radio">
                                                <label class="custom-control-label" for="shippingOption2">Express Delivery</label> <span class="float-right font-weight-bold">$10.00</span> </div>
                                            <div class="ml-4 mb-2 small">(2-4 business days)</div>
                                            <div class="custom-control custom-radio">
                                                <input id="shippingOption3" name="shippingoption" value="20" class="custom-control-input" type="radio">
                                                <label class="custom-control-label" for="shippingOption3">Next Business day</label> <span class="float-right font-weight-bold">$20.00</span> </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-12">
                                    <div class="odr-box">
                                        <div class="title-left">
                                            <h3>Shopping cart</h3>
                                        </div>
                                        <div class="rounded p-2 bg-light">
                                            <c:set var="total" value="${0}"/>
                                            <c:forEach var="item" items="${requestScope.cart}">
                                                <c:set var="subTotal" value="${item.product.price*item.quantity}"/>
                                                <div class="media mb-2 border-bottom">
                                                    <div class="media-body"> <a href="detail.html"> <c:out value="${item.product.name}"></c:out></a>
                                                        <div class="small text-muted">Price: <c:out value="${item.product.price} vnđ"></c:out> <span class="mx-2">|</span> Qty: <c:out value="${item.quantity}"></c:out> <span class="mx-2">|</span> Subtotal: <c:out value="${subTotal} vnđ"></c:out></div>
                                                        </div>
                                                    </div>
                                                <c:set var="total" value="${total + item.product.price*item.quantity}"/>
                                            </c:forEach>                                       
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-12">
                                    <div class="order-box">
                                        <div class="title-left">
                                            <h3>Your order</h3>
                                        </div>
                                        <div class="d-flex">
                                            <div class="font-weight-bold">Product</div>
                                            <div class="ml-auto font-weight-bold">Total</div>
                                        </div>
                                        <hr class="my-1">
                                        <div class="d-flex">
                                            <h4>Sub Total</h4>
                                            <div class="ml-auto font-weight-bold"> <c:out value="${total} vnđ"></c:out> </div>
                                            </div>
                                            <hr class="my-1">
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
                                    <div class="col-12 d-flex shopping-box"> <input type="submit" id="checkout" class="ml-auto btn hvr-hover" value="Đặt hàng"></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- End Cart -->
            <script>
                $(document).ready(function () {
                    $("input[name=shippingoption]").click(function () {
                        console.log($(this).val());
                    });
                    $("#checkout").click(function () {
                        $("#info-form").submit();
                    });
                });
            </script>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
