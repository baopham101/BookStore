<%-- 
    Document   : login
    Created on : Dec 16, 2020, 8:25:30 AM
    Author     : baoph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login</title>
        <meta name="google-signin-client_id" content="748072631332-dsm32l6ucbia6te21k66frg0aulpn518.apps.googleusercontent.com">

        <!-- Font Icon -->
        <link rel="stylesheet" href="design/fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="design/css/style.css">
    </head>
    <body>
        <div class="limiter">
            <div class="main">
                <!-- Sing in  Form -->
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="design/images/signin-image.jpg" alt="sing up image"></figure>
                            <a href="register.jsp" class="signup-image-link">Create an account</a>
                            <a href="HomeController" class="signup-image-link">Shopping</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Login</h2>
                            <form action="MainController" method="POST" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="txtUserID" id="your_name" placeholder="UserID" required/>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="txtPassword" id="your_pass" placeholder="Password" required/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="btnAction" id="signin" class="form-submit" value="Login"/>
                                </div>
                            </form>
                            <p style="text-align: center; color: #ff585a"> ${requestScope.MESSAGE}</p>
                            <div class="social-login">
                                <span class="social-label">Or login with</span>
                                <ul class="socials">
                                    <div class="g-signin2" data-onsuccess="onSignIn"></div>
                                    <%--                                    <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- JS -->
        <script>
            function onSignIn(googleUser) {
                var profile = googleUser.getBasicProfile();
                console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                console.log('Name: ' + profile.getName());
                console.log('Image URL: ' + profile.getImageUrl());
                console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
                console.log('id_token: ' + googleUser.getAuthResponse().id_token);
                var redirectUrl = 'LoginController';
                //using jquery to post data dynamically
                var form = $('<form action="' + redirectUrl + '" method="post">' +
                        '<input type="text" name="id_token" value="' +
                        googleUser.getAuthResponse().id_token + '" />' +
                        '<input type="text" name="googleName" value="' +
                        profile.getName() + '" />' +
                        '<input type="text" name="googleEmail" value="' +
                        profile.getEmail() + '" />' +
                        '</form>');
                $('body').append(form);
                form.submit();
            }
        </script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="design/vendor/jquery/jquery.min.js"></script>
        <script src="design/js/main.js"></script>
    </body>
</html>
