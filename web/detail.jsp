<%--
    Document   : detail
    Created on : Dec 14, 2020, 7:56:29 AM
    Author     : baoph
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Update Book Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
    <body class="goto-here">
    <c:if test="${sessionScope.ADMIN == null}">
        <c:if test="${empty sessionScope.ADMIN}">
            <c:redirect url="HomeController"/>
        </c:if>
    </c:if>
        <jsp:include page="header.jsp"/>
        <form action="MainController" method="post" onsubmit="return confirm('Are you sure want to update')">
            <c:forEach var="book" items="${requestScope.LIST_ID}">
                <section class="ftco-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 mb-5 ftco-animate">
                                <a href="images/product-1.jpg" class="image-popup"><img src="design/book/design/images/${book.bookImage}" class="img-fluid" alt="Book Image"></a>
                            </div>
                            <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                                <h3><input style="border: none" type="text" name="txtBookName" value="${book.bookName}" required></h3>
                                <div class="rating d-flex">
                                    <p class="text-left mr-4">
                                        <a href="#" class="mr-2">5.0</a>
                                        <a href="#"><span class="ion-ios-star-outline"></span></a>
                                        <a href="#"><span class="ion-ios-star-outline"></span></a>
                                        <a href="#"><span class="ion-ios-star-outline"></span></a>
                                        <a href="#"><span class="ion-ios-star-outline"></span></a>
                                        <a href="#"><span class="ion-ios-star-outline"></span></a>
                                    </p>
                                    <p class="text-left mr-4">
                                        <a href="#" class="mr-2" style="color: #000;">100 <span style="color: #bbb;">Rating</span></a>
                                    </p>
                                    <p class="text-left">
                                        <a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">Sold</span></a>
                                    </p>
                                </div>
                                <p class="price"><span><input style="border: none" type="text" name="txtBookPrice" value="${book.bookPrice}" required></span></p>
                                <div class="row mt-4">
                                    <div class="col-md-6">
                                        <div class="form-group d-flex">
                                            <div class="select-wrap">
                                                <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                <select required name="slcStatus" class="form-control">
                                                    <option selected>True</option>
                                                    <option>False</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="input-group col-md-6 d-flex mb-3">
                                        <span class="input-group-btn mr-2">
                                            <button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
                                                <i class="ion-ios-remove"></i>
                                            </button>
                                        </span>
                                        <input type="text" id="quantity" name="txtBookQuantity" class="form-control input-number" value="1" min="1" max="100">
                                        <span class="input-group-btn ml-2">
                                            <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                                <i class="ion-ios-add"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-md-12">
                                        Create Date: <input type="date" name="txtCreateDate" value="${book.createDate}" required><br>
                                    </div>
                                    <br>
                                    <div class="w-100"></div>
                                    <div class="custom-file">
                                        <input name="txtImage" type="file" class="custom-file-input" id="customFileInput" aria-describedby="customFileInput" required>
                                        <label class="custom-file-label" for="customFileInput">Select file</label>
                                    </div>
                                    <div class="col-md-12">
                                        <p style="color: #000;">${book.bookQuantity} available</p>
                                    </div>
                                </div>
                                <input type="hidden" name="txtBookID" value="${book.bookID}">
                                <p><input name="btnAction" type="submit" class="btn btn-black py-3 px-5" value="Update"/></p>
                                <p><a onclick="return confirm('Are you sure to delete this book?')" href="MainController?btnAction=Delete&txtID=${book.bookID}" class="btn btn-black2 py-3 px-5">Delete</a></p>
                            </div>
                        </div>
                    </div>
                </section>
            </c:forEach>
        </form>

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        <script>
            document.querySelector('.custom-file-input').addEventListener('change', function (e) {
                var name = document.getElementById("customFileInput").files[0].name;
                var nextSibling = e.target.nextElementSibling
                nextSibling.innerText = name
            })
        </script>

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

                var quantity = 0;
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