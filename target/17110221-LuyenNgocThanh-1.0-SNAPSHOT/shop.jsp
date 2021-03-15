<%-- 
    Document   : shop
    Created on : Dec 10, 2020, 10:35:16 PM
    Author     : Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
        <c:import url="nav.jsp"/>
            <c:set var="cart" value="${requestScope.cart}" scope="request"/>
        <!-- Start Shop Page  -->
        <div class="shop-box-inner">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                        <div class="right-product-box">
                            <div class="product-categorie-box">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                        <div class="row">
                                            
                                            <c:forEach var="product" items="${requestScope.products}">
                                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                    <div class="products-single fix">
                                                        <div class="box-img-hover">
                                                            <div class="type-lb">
                                                                <p class="sale">Sale</p>
                                                            </div>
                                                            <img src="<%=request.getContextPath()%><c:out value="${product.image}"></c:out>" class="img-fluid" alt="Image">
                                                                <div class="mask-icon">
                                                                    <ul>
                                                                        <li><a href="<%=request.getContextPath()%>/shop-detail?id=${product.id}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                </ul>
                                                                <a class="cart" href="#" data-id="<c:out value="${product.id}"></c:out>">Add to Cart</a>
                                                            </div>
                                                        </div>
                                                        <div class="why-text">
                                                            <h4><c:out value="${product.name}"></c:out></h4>
                                                            <h5> <c:out value="${product.price} vnđ"></c:out></h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                        <div class="product-categori">
                            <div class="search-product">
                                <form action="#">
                                    <input class="form-control" placeholder="Search here..." type="text">
                                    <button type="submit"> <i class="fa fa-search"></i> </button>
                                </form>
                            </div>
                            <div class="filter-sidebar-left">
                                <div class="title-left">
                                    <h3>Categories</h3>
                                </div>
                                <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                    <div class="list-group-collapse sub-men">
                                        <a class="list-group-item list-group-item-action" href="#sub-men1" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men1">Fruits & Drinks <small class="text-muted">(100)</small>
                                        </a>
                                        <div class="collapse show" id="sub-men1" data-parent="#list-group-men">
                                            <div class="list-group">
                                                <a href="#" class="list-group-item list-group-item-action active">Fruits 1 <small class="text-muted">(50)</small></a>
                                                <a href="#" class="list-group-item list-group-item-action">Fruits 2 <small class="text-muted">(10)</small></a>
                                                <a href="#" class="list-group-item list-group-item-action">Fruits 3 <small class="text-muted">(10)</small></a>
                                                <a href="#" class="list-group-item list-group-item-action">Fruits 4 <small class="text-muted">(10)</small></a>
                                                <a href="#" class="list-group-item list-group-item-action">Fruits 5 <small class="text-muted">(20)</small></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-collapse sub-men">
                                        <a class="list-group-item list-group-item-action" href="#sub-men2" data-toggle="collapse" aria-expanded="false" aria-controls="sub-men2">Vegetables 
                                            <small class="text-muted">(50)</small>
                                        </a>
                                        <div class="collapse" id="sub-men2" data-parent="#list-group-men">
                                            <div class="list-group">
                                                <a href="#" class="list-group-item list-group-item-action">Vegetables 1 <small class="text-muted">(10)</small></a>
                                                <a href="#" class="list-group-item list-group-item-action">Vegetables 2 <small class="text-muted">(20)</small></a>
                                                <a href="#" class="list-group-item list-group-item-action">Vegetables 3 <small class="text-muted">(20)</small></a>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#" class="list-group-item list-group-item-action"> Grocery  <small class="text-muted">(150) </small></a>
                                    <a href="#" class="list-group-item list-group-item-action"> Grocery <small class="text-muted">(11)</small></a>
                                    <a href="#" class="list-group-item list-group-item-action"> Grocery <small class="text-muted">(22)</small></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function(){
                $(".cart").click(function(){
                    console.log('dkm');
                    var id = $(this).attr("data-id");
                    $.ajax({
                        url: "<%=request.getContextPath()%>/shop-detail?product_id="+id + "&quantity=1",
                        method: "post",
                        success: function(res){
                            location.reload();
                        }
                    })
                    
                })
            })
        </script>
        <!-- End Shop Page -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
