<%-- 
    Document   : homepage
    Created on : Dec 9, 2020, 3:46:19 PM
    Author     : baoph
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
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
    </head>
    <body class="goto-here" onload="alert();">
        <c:if test="${requestScope.Message != null}">
            <c:if test="${not empty requestScope.Message}">
                <script>
                    function alert() {
                        alert("${requestScope.Message}");
                    }
                </script>
            </c:if>
        </c:if>
        <c:if test="${requestScope.Message == null}">
            <c:if test="${empty requestScope.Message}">
                <script>
                    function alert() {
                        alert("nothing");
                    }
                </script>
            </c:if>
        </c:if>
        <jsp:include page="header.jsp"/>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10 mb-5 text-center">
                        <ul>
                            <form action="MainController" method="POST" class="form-inline md-form mr-auto mb-4">
                                <input class="form-control mr-sm-2" type="text" name="txtSearch" value="${param.txtSearch}"
                                       aria-label="Search"/>
                                <input name="btnAction" class="btn aqua-gradient btn-rounded btn-sm my-0" type="submit" value="Search"/>
                            </form>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <c:if test="${requestScope.LIST_BOOK != null}">
                        <c:if test="${not empty requestScope.LIST_BOOK}">
                            <c:forEach var="book" items="${requestScope.LIST_BOOK}">
                                <div class="col-md-6 col-lg-3 ftco-animate">
                                    <div class="product">
                                        <a href="#" class="img-prod"><img class="img-fluid"
                                                                          src="design/book/design/images/${book.bookImage}"
                                                                          alt="Book Image">
                                            <div class="overlay"></div>
                                        </a>
                                        <div class="text py-3 pb-4 px-3 text-center">
                                            <h3 style="font-weight: bold"><a href="">${book.bookName}</a></h3>
                                            <p style="color: #f55353">${book.createDate}</p>
                                            <div class="d-flex">
                                                <div class="pricing">
                                                    <p class="price"><span>${book.bookPrice} VND</span></p>

                                                </div>
                                            </div>
                                            <form action="MainController" method="POST">
                                                <div class="bottom-area d-flex px-3">

                                                    <div class="m-auto d-flex">

                                                        <!--<input type="hidden" name="txtID" value=""/>-->
                                                        <!--<input type="hidden" name="txtCategory" value=""/>-->
                                                        <c:if test="${sessionScope.ADMIN != null}">
                                                            <c:if test="${not empty sessionScope.ADMIN}">
                                                                <a href="MainController?btnAction=Detail&txtID=${book.bookID}"
                                                                   class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                                    <span><i class="ion-ios-menu"></i></span>
                                                                </a>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${sessionScope.ADMIN == null}">
                                                            <c:if test="${empty sessionScope.ADMIN}">
                                                                <a href="MainController?btnAction=AddToCart&txtID=${book.bookID}"
                                                                   class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                                    <span><i class="ion-ios-cart"></i></span>
                                                                </a>
                                                            </c:if>
                                                        </c:if>
                                                        <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                                            <span><i class="ion-ios-heart"></i></span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </section>
        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen">
            <svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00"/>
            </svg>
        </div>

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
        <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>--%>
        <%--<script src="design/book/design/js/google-map.js"></script>--%>
        <script src="design/book/design/js/main.js"></script>
    </body>
</html>
