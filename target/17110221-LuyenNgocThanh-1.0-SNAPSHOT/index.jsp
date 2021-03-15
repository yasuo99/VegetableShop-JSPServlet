<%-- 
    Document   : index
    Created on : Dec 10, 2020, 3:20:13 PM
    Author     : Thanh
--%>

<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
        <c:import url="nav.jsp"/>
        <!-- End Slider -->

        <!-- Start Categories  -->
        <div class="categories-shop">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="shop-cat-box">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/images/categories_img_01.jpg" alt="" />
                            <a class="btn hvr-hover" href="#">Lorem ipsum dolor</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="shop-cat-box">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/images/categories_img_02.jpg" alt="" />
                            <a class="btn hvr-hover" href="#">Lorem ipsum dolor</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="shop-cat-box">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/images/categories_img_03.jpg" alt="" />
                            <a class="btn hvr-hover" href="#">Lorem ipsum dolor</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Categories -->

        <div class="box-add-products">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="offer-box-products">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/images/add-img-01.jpg" alt="" />
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="offer-box-products">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/images/add-img-02.jpg" alt="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Start Products  -->
        <div class="products-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="title-all text-center">
                            <h1>Fruits & Vegetables</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="special-menu text-center">
                            <div class="button-group filter-button-group">
                                <button class="active" data-filter="*">All</button>
                                <button data-filter=".top-featured">Top featured</button>
                                <button data-filter=".best-seller">Best seller</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row special-list">
                    <c:forEach var="item" items="${requestScope.products}">
                        <div class="col-lg-3 col-md-6 special-grid best-seller">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <div class="type-lb">
                                        <p class="sale">Sale | Best Seller</p>
                                    </div>
                                    <img src="<%=request.getContextPath()%><c:out value="${item.image}"></c:out>" class="img-fluid" alt="Image">
                                        <div class="mask-icon">
                                            <ul>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                            </ul>
                                            <a class="cart" href="#" data-id="<c:out value="${item.id}"></c:out>">Add to Cart</a>
                                        </div>
                                    </div>
                                    <div class="why-text">
                                        <h4><c:out value="${item.name}"></c:out></h4>
                                    <h5> <c:out value="${item.price} vnđ"></c:out></h5>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- End Products  -->

        <!-- Start Blog  -->
        <div class="latest-blog">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="title-all text-center">
                            <h1>latest blog</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-4 col-xl-4">
                        <div class="blog-box">
                            <div class="blog-img">
                                <img class="img-fluid" src="<%=request.getContextPath()%>/assets/images/blog-img.jpg" alt="" />
                            </div>
                            <div class="blog-content">
                                <div class="title-blog">
                                    <h3>Fusce in augue non nisi fringilla</h3>
                                    <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                                </div>
                                <ul class="option-blog">
                                    <li><a href="#"><i class="far fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#"><i class="far fa-comments"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-4">
                        <div class="blog-box">
                            <div class="blog-img">
                                <img class="img-fluid" src="<%=request.getContextPath()%>/assets/images/blog-img-01.jpg" alt="" />
                            </div>
                            <div class="blog-content">
                                <div class="title-blog">
                                    <h3>Fusce in augue non nisi fringilla</h3>
                                    <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                                </div>
                                <ul class="option-blog">
                                    <li><a href="#"><i class="far fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#"><i class="far fa-comments"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-4">
                        <div class="blog-box">
                            <div class="blog-img">
                                <img class="img-fluid" src="<%=request.getContextPath()%>/assets/images/blog-img-02.jpg" alt="" />
                            </div>
                            <div class="blog-content">
                                <div class="title-blog">
                                    <h3>Fusce in augue non nisi fringilla</h3>
                                    <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                                </div>
                                <ul class="option-blog">
                                    <li><a href="#"><i class="far fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#"><i class="far fa-comments"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Blog  -->
        <script>
            $(document).ready(function () {
                $(".cart").click(function () {
                    var id = $(this).attr("data-id");
                    $.ajax({
                        url: "<%=request.getContextPath()%>/shop-detail?product_id=" + id + "&quantity=1",
                        method: "post",
                        success: function (res) {
                            location.reload();                         
                        }
                    })
                })
            })
        </script>
        <!-- Start Footer  -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
