<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Document   : createbook
    Created on : Dec 10, 2020, 6:47:46 AM
    Author     : baoph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Create Book Page</title>
        <!-- Mobile Specific Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Font-->
        <link rel="stylesheet" type="text/css" href="design/admin/css/opensans-font.css">
        <link rel="stylesheet" type="text/css" href="design/admin/fonts/line-awesome/css/line-awesome.min.css">
        <!-- Main Style Css -->
        <link rel="stylesheet" href="design/admin/css/style.css"/>
        <link rel="stylesheet" href="design/admin/bootstrap/css/bootstrap.min.css"/>
    </head>
    <body class="form-v7">
        <jsp:include page="header.jsp"/>
        <c:if test="${sessionScope.ADMIN == null}">
            <c:if test="${empty sessionScope.ADMIN}">
                <c:redirect url="HomeController"/>
            </c:if>
        </c:if>
        <div class="page-content">
            <div class="form-v7-content">
                <div class="form-left">
                    <img src="design/admin/images/form-v7.jpg" alt="form">
                    <p class="text-1">Create Book</p>
                </div>
                <form class="form-detail" action="MainController" method="post" id="myform">
                    <div class="form-row">
                        <label for="bookname">Book name</label>
                        <input type="text" name="txtBookName" id="bookname" class="input-text" required minlength="5" maxlength="50">
                    </div>
                    <div class="form-row">
                        <label for="bookprice">Book Price</label>
                        <input type="text" name="txtBookPrice" id="bookprice" class="input-text" required maxlength="9">
                    </div>
                    <div class="form-row">
                        <label for="bookquantity">Book Quantity</label>
                        <input type="number" name="txtBookQuantity" id="bookquantity" class="input-text" required maxlength="10000">
                    </div>
                    <div class="form-row">
                        <label for="bookDate">Create Date</label>
                        <input type="date" name="txtCreateDate" id="bookDate" required>
                    </div>
                    <div class="form-row">
                        <label for="customFileInput">Image</label>
                        <div class="custom-file">
                            <input name="image" type="file" class="custom-file-input" id="customFileInput"
                                   aria-describedby="customFileInput" required>
                            <label class="custom-file-label" for="customFileInput">Select file</label>
                        </div>
                    </div>
                    <div class="form-row-last">
                        <input type="submit" name="btnAction" class="register" value="Create">
                    </div>
                    <div style="margin-left: 45px" class="form-row">
                        <h4 style="color: #85ff6c"><c:out value="${requestScope.MESSAGE}"/></h4>
                    </div>
                </form>
            </div>
        </div>

        <script>
            document.querySelector('.custom-file-input').addEventListener('change', function (e) {
                var name = document.getElementById("customFileInput").files[0].name;
                var nextSibling = e.target.nextElementSibling
                nextSibling.innerText = name
            })
        </script>
    </body>
</html>
