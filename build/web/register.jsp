<%-- 
    Document   : register
    Created on : Oct 5, 2020, 2:35:34 PM
    Author     : baoph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="design/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="design/css/style.css">
</head>
<body>
<div class="limiter">
    <div class="main">
        <!-- Sign up form -->
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Sign up</h2>
                    <form action="MainController" method="POST" class="register-form" id="register-form">
                        <div class="form-group">
                            <label for="ID"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="txtUserID" id="ID" placeholder="Your UserID" value="${param.txtUserID}" required minlength="5" maxlength="50" />
                            <small style="text-align: center; color: #ff4c51">${requestScope.ERROR.errorUserID}</small>
                        </div>
                        <div class="form-group">
                            <label for="address"><i class="zmdi zmdi-arrow-split"></i></label>
                            <input type="text" name="txtAddress" id="address" placeholder="Your Address" value="${param.txtAddress}" required maxlength="100"/>
                        </div>
                        <div class="form-group">
                            <label for="phone"><i class="zmdi zmdi-phone"></i></label>
                            <input type="text" name="txtPhone" id="phone" placeholder="Your Phone Number" pattern="[0]{1}[0-9]{9}" value="${param.txtPhone}" required/>
                        </div>
                        <div class="form-group">
                            <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="txtName" id="name" placeholder="Your Name" value="${param.txtName}" required minlength="2" maxlength="50" title="Name must be between 2 and 50 characters"/>
                        </div>
                        <div class="form-group">
                            <label for="email"><i class="zmdi zmdi-email"></i></label>
                            <input type="email" name="txtEmail" id="email" placeholder="Your Email" value="${param.txtEmail}" required maxlength="50"/>
                        </div>
                        <div class="form-group">
                            <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="txtPass" id="pass" placeholder="Password" required/>
                        </div>
                        <div class="form-group">
                            <label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="password" name="txtRePass" id="re_pass" placeholder="Repeat your password" required/>
                            <small style="text-align: center; color: #ff4c51">${requestScope.ERROR.confirm}</small>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="btnAction" id="signup" class="form-submit" value="Register"/>
                        </div>
                    </form>
                </div>
                <div class="signup-image">
                    <figure><img src="design/images/signup-image.jpg" alt="sing up image"></figure>
                    <a href="login.html" class="signup-image-link">I am already member</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script src="design/vendor/jquery/jquery.min.js"></script>
<script src="design/js/main.js"></script>
</body>
</html>