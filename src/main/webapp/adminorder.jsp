<%-- 
    Document   : adminorder
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

                    <c:import url="adminnav.jsp"></c:import>

                        <!-- Begin Page Content -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <h1 class="h3 mb-2 text-gray-800">Danh sách đơn hàng</h1>
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4 mt-4">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Tên người nhận</th>
                                                    <th>SĐT</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Trạng thái</th>
                                                    <th>Tổng tiền</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="order" items="${requestScope.orders}">
                                                <tr>
                                                    <td><c:out value="${order.id}"></c:out></td>
                                                    <td><c:out value="${order.orderDate}"></c:out></td>
                                                    <td><c:out value="${order.fullname}"></c:out></td>
                                                    <td><c:out value="${order.phone}"></c:out></td>
                                                    <td><c:out value="${order.address}"></c:out></td>
                                                    <td><c:out value="${order.status}"></c:out></td>
                                                    <td><c:out value="${order.total} đ"></c:out></td>
                                                        <td>
                                                            <a data-id="${order.id}" href="#detailModal" data-toggle="modal" class="btn btn-primary detailBtn"><i class="fa fa-bars"></i></a>
                                                            <c:if test="${order.status == 'new'}">
                                                            <a data-id="${order.id}" href="#approveModal" data-toggle="modal" class="btn btn-success approveBtn"><i class="fa fa-check"></i></a>
                                                            <a data-id="${order.id}" href="#declineModal" data-toggle="modal" class="btn btn-danger declineBtn"><i class="fa fa-trash"></i></a>
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
                <div id="detailModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Chi tiết đơn hàng</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body mx-auto">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Hình ảnh</th>
                                            <th scope="col">Tên sản phẩm</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Tạm tính</th>
                                        </tr>
                                    </thead>
                                    <tbody id="detailTbody">

                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Xác nhận">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="approveModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form method="POST">
                                <div class="modal-header">
                                    <h4 class="modal-title">Xác nhận đơn hàng</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body mx-auto">
                                    <input hidden type="text" name="type" value="approved"/>
                                    <input hidden type="number" name="orderId" id="approvedId"/>
                                    <p>Bạn có chắc muốn xác nhận đơn hàng này </p>
                                    <h5 class="text-warning"><small>Không thể hoàn tác.</small></h5>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Trở về">
                                    <input type="submit" class="btn btn-success" value="Xác nhận">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="declineModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form method="POST">
                                <div class="modal-header">
                                    <h4 class="modal-title">Hủy đơn hàng</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body mx-auto">
                                    <input hidden type="text" name="type" value="declined"/>
                                    <input hidden type="number" name="orderId" id="declinedId"/>
                                    <p>Bạn có chắc muốn hủy đơn hàng này</p>
                                    <h5 class="text-warning"><small>Không thể hoàn tác.</small></h5>
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
            <div class="modal-body">Bạn có chắc chắn đăng xuất ?</div>
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
        $(".approveBtn").click(function () {
            $("#approvedId").val($(this).attr("data-id"));
        });
        $(".declineBtn").click(function () {
            $("#declinedId").val($(this).attr("data-id"));
        });
        $(".detailBtn").click(function () {
            $.ajax({
                url: "<%=request.getContextPath()%>/order-detail",
                method: "GET",
                data: {id: $(this).attr("data-id")},
                dataType: 'json',
                success: (function (response) {
                    console.log(response);
                    $("#detailTbody").html("");
                    response.forEach(function (item, index){
                        $("#detailTbody").append("<tr>\n\
                            <td><img width='50px' height='50px' src='" + "<%= request.getContextPath()%>/" + item.product.image + "'/></td>\n\
                            <td>" + item.product.name + "</td>\n\
                            <td>" + item.quantity + "</td>\n\
                            <td>" + item.quantity * item.product.price + "</td>\n\
                            </tr>")
                    });
                })
            })
        });
    });
</script>
</body>

</html>
