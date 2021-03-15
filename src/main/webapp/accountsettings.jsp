<%-- 
    Document   : accountsettings
    Created on : Dec 20, 2020, 4:58:46 PM
    Author     : Thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
        <c:import url="nav.jsp"/>
        <div class="wrapper" id="settings">
            <div class="container mt-4">
                <h2>Cập nhật thông tin tài khoản</h2>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-6">
                        <c:if test="${requestScope.Error != null}">
                            <section style="font-size: 13px" class="aa alert alert-danger">Có lỗi xảy ra</section> 
                        </c:if>
                        <form method="post">
                            <div class="form-group row">
                                <div class="col-3">Họ và tên</div>
                                <div class="col-5"><input class="form-control" name="fullname" placeholder="Họ và tên" value=""/></div>
                            </div>
                            <div class="form-group row">
                                <div class="col-3">Số điện thoại</div>
                                <div class="col-5"><input class="form-control" name="phone" placeholder="SĐT" value=""/></div>
                            </div>
                            <div class="form-group row">
                                <div class="col-3">Địa chỉ</div>
                                <div class="col-5"><input class="form-control" name="address" placeholder="Địa chỉ" value=""/></div>
                            </div>
                            <div class="offset-lg-5 offset-md-5 offset-5">
                                <input type="submit" value="Lưu" class="btn btn-primary"/>
                            </div>

                        </form>
                    </div>
                    <div class="col-lg-6 col-md-6 col-6">
                        <div class="form-inline">
                            <div class="col-3">Họ và tên :</div>
                            <div class="col-5"><c:out value="${sessionScope.account.fullname}"></c:out></div>
                            </div>
                            <div class="form-inline">
                                <div class="col-3">SĐT :</div>
                                <div class="col-5"><c:out value="${sessionScope.account.phone}"></c:out></div>
                            </div>
                            <div class="form-inline">
                                <div class="col-3">Email :</div>
                                <div class="col-5"><c:out value="${sessionScope.account.email}"></c:out></div>
                            </div>
                            <div class="form-inline">
                                <div class="col-3">Địa chỉ :</div>
                                <div class="col-5"><c:out value="${sessionScope.account.address}"></c:out></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a id="amen" href="amen"></a>
        <jsp:include page="footer.jsp"></jsp:include>
        <<script>
//            $(document).ready(function () {
//                $(function () {
//                    $(document).scrollTop($("#settings").offset().top);
//                });
//            });
        </script>
    </body>
</html>
