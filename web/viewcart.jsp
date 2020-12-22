<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Document   : viewcart
    Created on : Dec 15, 2020, 3:35:24 PM
    Author     : baoph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
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
    <body>
        <c:if test="${sessionScope.ADMIN != null}">
            <c:if test="${not empty sessionScope.ADMIN}">
                <c:redirect url="HomeController"/>
            </c:if>
        </c:if>
        <jsp:include page="header.jsp"/>
        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th>Book name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="text-center">
                                        <c:if test="${sessionScope.CART == null}">
                                            <c:if test="${empty sessionScope.CART}">
                                        <h1>There nothing in cart</h1>
                                    </c:if>
                                </c:if>
                                </tr>
                                <%--                            <c:set var="cart" value="${sessionScope.CART}"/>--%>
                                <c:if test="${sessionScope.CART != null}">
                                    <c:if test="${not empty sessionScope.CART}">
                                        <c:forEach var="book" items="${sessionScope.CART.cart.values()}">
                                            <tr class="text-center">

                                                <td class="product-remove"><a href="MainController?btnAction=DeleteCart&txtID=${book.getBookID()}"><span class="ion-ios-close"></span></a></td>

                                                <td class="image-prod"><div class="img" style="background-image:url(design/book/design/images/${book.getBookImage()});"></div></td>

                                                <td class="product-name">
                                                    <h3>${book.getBookName()}</h3>
                                                </td>

                                                <td class="price">${book.getBookPrice()}</td>
                                            <form action="MainController" method="post">
                                                <td class="quantity">
                                                    <div class="input-group mb-3">
                                                        <input type="number" name="txtCartQuantity" class="quantity form-control input-number" value="${book.getCartQuantity()}" min="1" max="100">
                                                    </div>
                                                </td>

                                                <td class="total">${book.getTotal()}</td>

                                                <td>
                                                    <input type="hidden" name="txtID" value="${book.getBookID()}"/>
                                                    <p><input name="btnAction" type="submit" class="btn btn-black py-3 px-5" value="Update_Cart"/></p>
                                                </td>
                                            </form>
                                            </tr><!-- END TR-->
                                        </c:forEach>
                                    </c:if>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <form action="MainController" method="post">
                    <div class="row justify-content-end">
                        <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                            <c:if test="${sessionScope.GOOGLE != null}">
                                <c:if test="${not empty sessionScope.GOOGLE}">
                                    <div class="cart-total mb-3">
                                        <h3>Your information</h3>
                                        <p>Please enter your information here</p>
                                        <form action="#" class="info">
                                            <div class="form-group">
                                                <label for="address">Address</label>
                                                <input name="googleAddress" id="address" type="text" class="form-control text-left px-3" placeholder="Enter your address" required maxlength="100">
                                            </div>
                                            <div class="form-group">
                                                <label for="phone">Phone Number</label>
                                                <input name="googlePhone" id="phone" type="text" class="form-control text-left px-3" placeholder="Enter Your Phone Number" pattern="[0]{1}[0-9]{9}" required>
                                                <input type="hidden" name="googleEmail" value="${sessionScope.GOOGLE.googleEmail}">
                                                <input type="hidden" name="googleName" value="${sessionScope.GOOGLE.googleName}">
                                            </div>
                                        </form>
                                    </div>
                                </c:if>
                            </c:if>
                        </div>
                        <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                            <div class="cart-total mb-3">
                                <h3>Cart Totals</h3>
                                <p class="d-flex">
                                    <span>Subtotal</span>
                                    <span>${sessionScope.TOTAL}VND</span>
                                </p>
                                <hr>
                                <p class="d-flex total-price">
                                    <span>Total</span>
                                    <span>${sessionScope.TOTAL}VND</span>
                                </p>
                            </div>
                            <p><input type="submit" name="btnAction" value="CheckOut" class="btn btn-primary py-3 px-4"></p>
                        </div>
                    </div>
                </form>
            </div>
        </section>

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

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

        <script>
            $(document).ready(function () {

                var quantitiy = 0;
                $('.quantity-right-plus').click(function (e) {

                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($('#quantity').val());

                    // If is not undefined

                    $('#quantity').val(quantity + 1);


                    // Increment

                });

                $('.quantity-left-minus').click(function (e) {
                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($('#quantity').val());

                    // If is not undefined

                    // Increment
                    if (quantity > 0) {
                        $('#quantity').val(quantity - 1);
                    }
                });

            });
        </script>

    </body>
</html>
