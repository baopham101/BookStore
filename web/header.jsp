<%-- 
    Document   : header
    Created on : Oct 6, 2020, 2:50:31 PM
    Author     : baoph
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="google-signin-client_id" content="748072631332-dsm32l6ucbia6te21k66frg0aulpn518.apps.googleusercontent.com">

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="design/book/design/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="design/book/design/css/animate.css">

        <link rel="stylesheet" href="design/book/design/css/owl.carousel.min.css">
        <link rel="stylesheet" href="design/book/design/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="design/book/design/css/magnific-popup.css">

        <link rel="stylesheet" href="design/book/design/css/aos.css">
        <link rel="stylesheet" href="design/book/design/vendor/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" href="design/book/design/css/ionicons.min.css">

        <link rel="stylesheet" href="design/book/design/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="design/book/design/css/jquery.timepicker.css">


        <link rel="stylesheet" href="design/book/design/css/flaticon.css">
        <link rel="stylesheet" href="design/book/design/css/icomoon.css">
        <link rel="stylesheet" href="design/book/design/css/style.css">
        <link rel="stylesheet" href="design/book/design/css/search.css">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="HomeController">Book Store</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a href="HomeController" class="nav-link">Home</a></li>

                        <c:if test="${sessionScope.ADMIN != null}">
                            <c:if test="${not empty sessionScope.ADMIN}">
                                <li class="nav-item active dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown"
                                       aria-haspopup="true" aria-expanded="false">Admin Menu</a>
                                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                                        <a class="dropdown-item" href="createbook.jsp">Create Book</a>
                                    </div>
                                </li>
                            </c:if>
                        </c:if>
                        <c:if test="${sessionScope.ADMIN != null}">
                            <c:if test="${not empty sessionScope.ADMIN}">
                                <li class="nav-item">
                                    <a href="MainController?btnAction=Logout" class="nav-link">Log out</a>
                                </li>
                            </c:if>
                        </c:if>
                        <c:if test="${sessionScope.MEMBER != null}">
                            <c:if test="${not empty sessionScope.MEMBER}">
                                <li class="nav-item">
                                    <a href="MainController?btnAction=Logout" class="nav-link">Log out</a>
                                </li>
                            </c:if>
                        </c:if>

                        <c:if test="${sessionScope.GOOGLE != null}">
                            <c:if test="${not empty sessionScope.GOOGLE}">
                                <li class="nav-item">
                                    <a class="nav-link" href="https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/BookStore/login.jsp">Log out</a>
                                </li>
                            </c:if>
                        </c:if>

                        <c:if test="${sessionScope.ADMIN == null}">
                            <c:if test="${empty sessionScope.ADMIN}">
                                <c:if test="${sessionScope.MEMBER == null}">
                                    <c:if test="${empty sessionScope.MEMBER}">
                                        <c:if test="${sessionScope.GOOGLE == null}">
                                            <c:if test="${empty sessionScope.GOOGLE}">
                                                <li class="nav-item">
                                                    <a href="login.jsp" class="nav-link">Log in</a>
                                                </li>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                </c:if>
                            </c:if>
                        </c:if>
                        <c:if test="${sessionScope.NUM == null}">
                            <c:if test="${empty sessionScope.NUM}">
                                <li class="nav-item cta cta-colored">
                                    <a href="viewcart.jsp" class="nav-link">
                                        <span class="icon-shopping_cart"></span>[0]
                                    </a>
                                </li>
                            </c:if>
                        </c:if>

                        <c:if test="${sessionScope.NUM != null}">
                            <c:if test="${not empty sessionScope.NUM}">
                                <li class="nav-item cta cta-colored">
                                    <a href="viewcart.jsp" class="nav-link">
                                        <span class="icon-shopping_cart"></span>[${sessionScope.NUM}]
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <div class="hero-wrap hero-bread" style="background-image: url('design/book/design/images/book.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <c:if test="${sessionScope.MEMBER != null}">
                            <c:if test="${not empty sessionScope.MEMBER}">
                                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Welcome</a></span>
                                    <span style="color: #8f0101">${sessionScope.MEMBER.name}</span></p>
                                </c:if>
                            </c:if>

                        <c:if test="${sessionScope.ADMIN != null}">
                            <c:if test="${not empty sessionScope.ADMIN}">
                                <p class="breadcrumbs"><span class="mr-2"><a style="color: #ff0008" href="index.html">Welcome</a></span>
                                    <span style="color: #8f0101">${sessionScope.ADMIN.name}</span></p>
                                </c:if>
                            </c:if>

                        <c:if test="${sessionScope.GOOGLE != null}">
                            <c:if test="${not empty sessionScope.GOOGLE}">
                                <p class="breadcrumbs"><span class="mr-2"><a style="color: #ff0008" href="index.html">Welcome</a></span>
                                    <span style="color: #8f0101">${sessionScope.GOOGLE.googleName}</span></p>
                                </c:if>
                            </c:if>
                        <h1 class="mb-0 bread">Book Shop</h1>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="design/book/design/js/jquery.min.js"></script>
        <script src="design/book/design/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="design/book/design/js/popper.min.js"></script>
        <script src="design/book/design/js/bootstrap.min.js"></script>
        <script src="design/book/design/js/jquery.easing.1.3.js"></script>
        <script src="design/book/design/js/jquery.waypoints.min.js"></script>
        <script src="design/book/design/js/jquery.stellar.min.js"></script>
        <script src="design/book/design/js/owl.carousel.min.js"></script>
        <script src="design/book/design/js/jquery.magnific-popup.min.js"></script>
        <script src="design/book/design/js/aos.js"></script>
        <script src="design/book/design/js/jquery.animateNumber.min.js"></script>
        <script src="design/book/design/js/bootstrap-datepicker.js"></script>
        <script src="design/book/design/js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="design/book/design/js/google-map.js"></script>
        <script src="design/book/design/js/main.js"></script>
    </body>
</html>
