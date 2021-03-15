<%-- 
    Document   : adminaccount
    Created on : Dec 22, 2020, 1:14:05 PM
    Author     : Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="adminheader.jsp"></jsp:include>
        <body id="page-top">

            <!-- Page Wrapper -->
            <div id="wrapper">

                <!-- Sidebar -->
            <jsp:include page="adminsidenav.jsp"></jsp:include>
                <!-- End of Sidebar -->

                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">

                    <c:import url="adminnav.jsp"></c:import>

                        <!-- Begin Page Content -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <h1 class="h3 mb-2 text-gray-800">Danh sách tài khoản</h1>
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4 mt-4">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Họ và tên</th>
                                                    <th>Email</th>
                                                    <th>SĐT</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Vai trò</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="account" items="${requestScope.accounts}">
                                                <tr>
                                                    <td><c:out value="${account.id}"></c:out></td>
                                                    <td><c:out value="${account.fullname}"></c:out></td>
                                                    <td><c:out value="${account.email}"></c:out></td>
                                                    <td><c:out value="${account.phone}"></c:out></td>
                                                    <td><c:out value="${account.address}"></c:out></td>
                                                    <td><c:out value="${account.role}"></c:out></td>
                                                        <td>
                                                        <c:if test="${account.isLocked == false}">
                                                            <a data-id="${account.id}" href="#lockModal" data-toggle="modal" class="btn btn-danger lockBtn"><i class="fa fa-lock"></i></a>
                                                            </c:if>
                                                            <c:if test="${account.isLocked == true}">
                                                            <a data-id="${account.id}" href="#unlockModal" data-toggle="modal" class="btn btn-success unlockBtn"><i class="fa fa-lock-open"></i></a>
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
                <div id="unlockModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form method="POST">
                                <div class="modal-header">
                                    <h4 class="modal-title">Mở khóa tài khoản</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body mx-auto">
                                    <input hidden type="text" name="type" value="unlock"/>
                                    <input hidden type="number" name="accountId" id="unlockId"/>
                                    <p>Bạn có chắc muốn mở khóa tài khỏa này</p>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Trở về">
                                    <input type="submit" class="btn btn-success" value="Xác nhận">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="lockModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form method="POST">
                                <div class="modal-header">
                                    <h4 class="modal-title">Khóa tài khoản</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body mx-auto">
                                    <input hidden type="text" name="type" value="lock"/>
                                    <input hidden type="number" name="accountId" id="lockId"/>
                                    <p>Bạn có chắc muốn khóa tài khoản này</p>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Trở về">
                                    <input type="submit" class="btn btn-danger" value="Xác nhận">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="<%=request.getContextPath()%>/logout">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<%=request.getContextPath()%>/adminassets/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/adminassets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<%=request.getContextPath()%>/adminassets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="<%=request.getContextPath()%>/adminassets/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="<%=request.getContextPath()%>/adminassets/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/adminassets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="<%=request.getContextPath()%>/adminassets/js/demo/datatables-demo.js"></script>
<script>
    $(document).ready(function () {
        $(".unlockBtn").click(function () {
            $("#unlockId").val($(this).attr("data-id"));
        });
        $(".lockBtn").click(function () {
            $("#lockId").val($(this).attr("data-id"));
        });
    });
</script>
</body>

</html>

