<%-- 
    Document   : nav
    Created on : Dec 10, 2020, 10:00:20 PM
    Author     : Thanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.luyenngocthanh.dtos.ShoppingCart"%>
<%@page pageEncoding="UTF-8"%>
<!-- Start Main Top -->
<header class="main-header">
    <c:set var="totalCount" value="${0}"/>
    <c:forEach var="item" items="${requestScope.cart}">
        <c:set var="totalCount" value="${totalCount + 1}"/>
    </c:forEach>
    <!-- Start Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/assets/images/logo.png" class="logo" alt=""></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                    <li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>">Home</a></li>
                    <li class="dropdown">
                        <a href="<%=request.getContextPath()%>/shop" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">SHOP <i class="fa fa-shopping-cart"></i> </a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=request.getContextPath()%>/cart">Cart</a></li>
                            <li><a href="<%=request.getContextPath()%>/orders">Order</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="contact-us.html">Contact Us</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->

            <!-- Start Atribute Navigation -->
            <div class="attr-nav">
                <ul>
                    <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                    <li class="side-menu">
                        <a href="#">
                            <i class="fa fa-shopping-bag"></i>
                            <span class="badge"><c:out value="${totalCount}"></c:out></span>
                                <p>My Cart</p>
                            </a>
                        </li>
                    </ul>
                </div>
            <c:if test="${sessionScope.account != null}">
                <div class="attr-nav"><li class="dropdown">
                        <a href="<%=request.getContextPath()%>/account-settings" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Tài khoản </a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=request.getContextPath()%>/account-settings">Cài đặt tài khoản</a></li>
                            <li><a href="<%=request.getContextPath()%>/logout">Đăng xuất</a></li>
                        </ul>
                    </li></div></c:if>
                <c:if test="${sessionScope.account == null}">
                <div class="attr-nav"><li class="dropdown">
                        <a href="<%=request.getContextPath()%>/login" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Đăng nhập </a>
                    </li></div></c:if>

                <!-- End Atribute Navigation -->
            </div>
            <!-- Start Side Menu -->
            <div class="side">
                <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                <li class="cart-box">
                    <ul class="cart-list">
                    <c:set var="total" value="${0}"/>
                    <c:forEach var="item" items="${requestScope.cart}">
                        <li>
                            <a href="#" class="photo"><img src="<%=request.getContextPath()%><c:out value="${item.product.image}"></c:out>" class="cart-thumb" alt="" /></a>
                            <h6><a href="#"><c:out value="${item.product.name}"></c:out></a></h6>
                            <p><c:out value="${item.quantity}"></c:out>x - <span class="price"><c:out value="${item.product.price} vnđ"></c:out></span></p>
                            </li>
                        <c:set var="total" value="${total + item.product.price * item.quantity}" />
                    </c:forEach>
                    <li class="total">
                        <a href="<%= request.getContextPath()%>/cart" class="btn btn-default hvr-hover btn-cart">VIEW CART</a>
                        <span class="float-right"><strong>Total</strong>: <c:out value="${total} vnđ"></c:out></span>
                        </li>
                    </ul>
                </li>
            </div>
            <!-- End Side Menu -->
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <form method="post" action="<%= request.getContextPath() %>/shop">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search" name="search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </form>

        </div>
    </div>
    <!-- End Top Search -->

    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-center">
                <img src="<%=request.getContextPath()%>/assets/images/banner-01.jpg" alt="">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="m-b-20"><strong>Welcome To <br> Freshshop</strong></h1>
                        <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                        <p><a class="btn hvr-hover" href="<%=request.getContextPath()%>/shop">Shop New</a></p>
                    </div>
                </div>
            </div>
        </li>
        <li class="text-center">
            <img src="<%=request.getContextPath()%>/assets/images/banner-02.jpg" alt="">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="m-b-20"><strong>Welcome To <br> Freshshop</strong></h1>
                        <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                        <p><a class="btn hvr-hover" href="<%=request.getContextPath()%>/shop">Shop New</a></p>
                    </div>
                </div>
            </div>
        </li>
        <li class="text-center">
            <img src="<%=request.getContextPath()%>/assets/images/banner-03.jpg" alt="">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="m-b-20"><strong>Welcome To <br> Freshshop</strong></h1>
                        <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                        <p><a class="btn hvr-hover" href="<%=request.getContextPath()%>/shop">Shop New</a></p>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <div class="slides-navigation">
        <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
        <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
    </div>
</div>
