<%-- 
    Document   : register
    Created on : Dec 12, 2020, 8:58:59 PM
    Author     : Thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"/>
    <body>
        <c:out value="${sessionScope.notification}"></c:out>
        <div class="container">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register-image">
                            <img width="475px" height="413.18px" class="mt-4 ml-4" src="<%= request.getContextPath()%>/assets/images/about-img.jpg" />
                        </div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <c:if test="${requestScope.notification != null}">
                                    <c:if test="${requestScope.notificationType == 1}">
                                        <section style="font-size: 13px" class="aa alert alert-success"><c:out value="${requestScope.notification}"></c:out></section> 
                                    </c:if>
                                    <c:if test="${requestScope.notificationType == 2}">
                                        <section style="font-size: 13px" class="aa alert alert-danger"><c:out value="${requestScope.notification}"></c:out></section> 
                                    </c:if>
                                </c:if>
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Đăng kí tài khoản</h1>
                                </div>
                                <div>
                                </div>
                                <form id="form-register" method="POST">
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <div class="error" style="font-size: 13px; color: red" id="nameError"></div>
                                            <input required value="${requestScope.registeraccount.fullname}" type="text" class="form-control form-control-user" name="fullname" id="name"
                                                   placeholder="Họ và tên">
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="error" style="font-size: 13px; color: red" id="phoneError"></div>
                                            <input required value="${requestScope.registeraccount.phone}" type="text" class="form-control form-control-user" name="phone" id="phone"
                                                   placeholder="SĐT">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="error" style="font-size: 13px; color: red" id="emailError"></div>
                                        <input value="${requestScope.registeraccount.email}" type="email" class="form-control form-control-user" name="email" id="email"
                                               placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <div class="error" style="font-size: 13px; color: red" id="emailError"></div>
                                        <input required value="${requestScope.registeraccount.address}" type="text" class="form-control form-control-user" name="address" id="address"
                                               placeholder="Address">
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <div class="error" style="font-size: 13px; color: red" id="passwordError"></div>
                                            <input required type="password" class="form-control form-control-user" name="password"
                                                   id="password" placeholder="Mật khẩu">
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="error text-danger" style="font-size: 13px; color: red" id="confimPasswordError"></div>
                                            <input required type="password" class="form-control form-control-user" name="confirmPassword"
                                                   id="confirmpassword" placeholder="Xác nhận mật khẩu">

                                        </div>
                                    </div>
                                    <input type="submit" id="submitregister" value="Đăng Ký" />
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="<%=request.getContextPath()%>/login">Đã có tài khoản? Đăng nhập!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
