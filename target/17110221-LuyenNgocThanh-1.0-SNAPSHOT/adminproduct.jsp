<%-- 
    Document   : adminproduct
    Created on : Dec 11, 2020, 12:00:54 AM
    Author     : Thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                    <c:import url="adminnav.jsp" />

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Danh sách sản phẩm</h1>
                        <a class="btn btn-primary" href="#createModal" data-toggle="modal">Thêm sản phẩm <i class="fa fa-plus"></i></a>
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4 mt-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Hình ảnh</th>
                                                <th>Tên</th>
                                                <th>Giá cũ</th>
                                                <th>Giá hiện tại</th>
                                                <th>Số lượng còn lại</th>
                                                <th>Đã bán</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${requestScope.products}">
                                                <tr>
                                                    <td><img src="<%=request.getContextPath()%>${product.image}" width="80px" height="80px"/></td>
                                                    <td><c:out value="${product.name}"></c:out></td>
                                                    <td><c:out value="${product.oldPrice} đ"></c:out></td>
                                                    <td><c:out value="${product.price} đ"></c:out></td>
                                                    <td><c:out value="${product.remain} kg"></c:out></td>
                                                    <td><c:out value="${product.sold} kg"></c:out></td>
                                                        <td>
                                                            <a data-id="${product.id}" data-price="${product.price}" href="#editModal" data-toggle="modal" class="btn btn-primary editBtn">Sửa <i class="fas fa-pen"></i></a>
                                                        <a data-id="${product.id}" href="#deleteModal" data-toggle="modal" class="btn btn-danger deleteBtn">Xóa <i class="fa fa-trash"></i></a>
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
                <div id="createModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Thêm sản phẩm</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form id="createForm" method="POST">
                                    <input hidden name="type" value="create"/>
                                    <div class="form-group">
                                        <label>Tên sản phâm</label>
                                        <input id="name" type="text" class="form-control" name="name">
                                    </div>
                                    <div class="form-group">
                                        <div id="emailWarning" class="alert alert-warning alert-dismissible fade show" hidden role="alert">
                                            <strong></strong>
                                        </div>
                                        <label>Link ảnh</label>
                                        <input id="image" type="email" class="form-control" name="image" />
                                    </div>
                                    <div class="form-group">
                                        <div id="phoneWarning" class="alert alert-warning alert-dismissible fade show" hidden role="alert">
                                            <strong></strong>
                                        </div>
                                        <label>Chi tiết</label>
                                        <input id="phone" type="text" class="form-control" name="detail">
                                    </div>
                                    <div class="form-group">
                                        <label>Giá</label>
                                        <input id="price" type="number" value="0" min="0" class="form-control" name="price">
                                    </div>
                                    <div class="form-group">
                                        <label>Số lượng hiện có</label>
                                        <input id="price" type="number" value="0" min="0" class="form-control" name="remain">
                                    </div>
                                </form>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input id="createBtn" type="submit" class="btn btn-info" value="Lưu">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="editModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Sửa sản phẩm</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form id="editForm" method="POST">
                                    <input hidden name="type" value="update"/>
                                    <input hidden name="productId" id="editId"/>
                                    <div class="form-group">
                                        <label>Tên sản phâm</label>
                                        <input id="name" type="text" class="form-control" name="name">
                                    </div>
                                    <div class="form-group">
                                        <div id="emailWarning" class="alert alert-warning alert-dismissible fade show" hidden role="alert">
                                            <strong></strong>
                                        </div>
                                        <label>Link ảnh</label>
                                        <input id="image" type="email" class="form-control" name="image" />
                                    </div>
                                    <input hidden name="oldPrice" id="oldPrice"/>
                                    <div class="form-group">
                                        <div id="phoneWarning" class="alert alert-warning alert-dismissible fade show" hidden role="alert">
                                            <strong></strong>
                                        </div>
                                        <label>Chi tiết</label>
                                        <input id="phone" type="text" class="form-control" name="detail">
                                    </div>
                                    <div class="form-group">
                                        <label>Giá</label>
                                        <input id="price" type="number" value="0" min="0" class="form-control" name="price">
                                    </div>
                                    <div class="form-group">
                                        <label>Số lượng hiện có</label>
                                        <input id="price" type="number" value="0" min="0" class="form-control" name="remain">
                                    </div>
                                </form>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input id="editBtn" type="submit" class="btn btn-info" value="Lưu">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="deleteModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form method="POST">
                                <div class="modal-header">
                                    <h4 class="modal-title">Xoá sản phẩm</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body mx-auto">
                                    <input hidden type="text" name="type" value="delete"/>
                                    <input hidden type="number" name="productId" id="deleteId"/>
                                    <p>Bạn có chắc muốn xoá sản phẩm này </p>
                                    <h5 class="text-warning"><small>Không thể hoàn tác.</small></h5>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Trở về">
                                    <input type="submit" class="btn btn-danger" value="Xoá">
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
        $(".deleteBtn").click(function () {
            $("#deleteId").val($(this).attr("data-id"));
        });
        $("#createBtn").click(function () {
            $("#createForm").submit();
        });
        $("#editBtn").click(function () {
            $("#editForm").submit();
        });
        $(".editBtn").click(function () {
            $("#editId").val($(this).attr("data-id"));
            $("#oldPrice").val($(this).attr("data-price"));
        });
    });
</script>
</body>

</html>
