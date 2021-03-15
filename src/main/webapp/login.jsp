<%-- 
    Document   : login
    Created on : Dec 10, 2020, 4:42:39 PM
    Author     : Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
            <div class="container">

                <!-- Outer Row -->
                <div>

                </div>
                <div class="row justify-content-center">

                    <div class="col-xl-10 col-lg-12 col-md-9">

                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <div class="card-body p-0">
                                <!-- Nested Row within Card Body -->
                                <div class="row">
                                    <div class="col-lg-6 d-none d-lg-block bg-login-image">
                                        <img width="475px" src="<%= request.getContextPath()%>/assets/images/about-img.jpg" />
                                </div>
                                <div class="col-lg-6">
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
                                            <h1 class="h4 text-gray-900 mb-4">Welcome to Freshshop!</h1>
                                        </div>
                                        <form id='form-login' class="user" method="POST">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user" name="emailLogin" id="emailLogin" aria-describedby="emailHelp" placeholder="Email" required>
                                                <div id="nameError"></div>
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control form-control-user" name="passwordLogin" id="passwordLogin" placeholder="Mật khẩu" required>
                                                <div id="passwordError"></div>
                                            </div>
                                            <div class="form-group">
                                            </div>
                                            <input type="submit" value="Đăng Nhập"/>
                                            <hr>
                                        </form>

                                        <div class="text-center">
                                            <a class="small" href="<%=request.getContextPath()%>/register">Đăng kí!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
