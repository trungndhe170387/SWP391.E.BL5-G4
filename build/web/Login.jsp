

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <style>
            .container {
                max-width: 100%;
                max-height: 100%;
            }
        </style>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> SWP391.E.BL5.G4 | Login</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
        <link rel="stylesheet" href="assets/css/gijgo.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/animated-headline.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <script>
            function closeMessage() {
                document.querySelector('.success-message').style.display = 'none';
            }
        </script>
        <style>
            .close-button {
                background-color: #f44336; /* Red background color */
                color: white; /* White text color */
                border: none; /* Remove borders */
                padding: 5px 10px; /* Add some padding */
                font-size: 14px; /* Set font size */
                cursor: pointer; /* Add a pointer cursor on hover */
                border-radius: 3px; /* Optional: Add some border radius */
            }

            .close-button:hover {
                background-color: #d32f2f; /* Darker red on hover */
            }
        </style>
    </head>
    <body >

        <!-- ? Preloader Start -->
        <div id="preloader-active">
            <div class="preloader d-flex align-items-center justify-content-center">
                <div class="preloader-inner position-relative">
                    <div class="preloader-circle"></div>
                    <div class="preloader-img pere-text">
                        <img src="assets/img/logo/loder.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- Preloader Start-->



        <main class="login-body" data-vide-bg="assets/img/login-bg.mp4">
            <!-- Login Admin -->
            <form class="form-default" action="login" method="GET">

                <div class="login-form">
                    <% 
String successMessage = (String) request.getSession().getAttribute("successMessage");
if (successMessage != null) { 
                    %>
                    <div class="success-message" style="color:white;">
                        <%= successMessage %>
                        <button onclick="closeMessage()">X</button>
                    </div>
                    <% } %>
                    <!-- logo-login -->
                    <div class="logo-login">
                        <a href="index.html"><img src="assets/img/logo/loder.png" alt=""></a>
                    </div>
                    <h2>Login Here</h2>
                    <div class="form-input">
                        <label for="name">Username</label>
                        <input required  type="text" value="${cookie.cuser.value}" name="user" placeholder="Username">
                    </div>
                    <div class="form-input">
                        <label for="name">Password</label>
                        <input required type="password" value="${cookie.cpass.value}" name="pass" placeholder="Password">
                    </div>
                    <div class="form-input pt-30">
                        <input type="submit" name="submit" value="LOGIN">
                    </div>

                    <p style="color: white;"><input style=" display: inline-block" type="checkbox" name="remember" value="on" ${cookie.crem != null ?'checked':''} />Remember me</p>
                    <div>
                        <h3 class="text-danger">${mess}</h3>
                    </div>

                    <div style="background: green" class="form-input pt-30">
                        <a href="https://accounts.google.com/o/oauth2/auth/oauthchooseaccount?scope=email profile&redirect_uri=http%3A%2F%2Flocalhost%3A9999%2FSWP391.E.BL5-G4%2Flogin&response_type=code&client_id=782277117461-o1v2psh7r1luphl71loo5bt2u0hq2svv.apps.googleusercontent.com&approval_prompt=force&service=lso&o2v=1&flowName=GeneralOAuthFlow"
                           ><i class="display-flex-center zmdi zmdi-google"></i><h2 
                                style="color: white;">Login with Google</h2></a>
                    </div>

                    <div class="social-login">

                    </div>

                    <!-- Forget Password -->
                    <a href="forgetpassword.jsp" class="forget">Forget Password</a>
                    <!-- Forget Password -->
                    <a href="register" class="registration">Registration</a>
                </div>
                </div>
            </form>
            <!-- /end login form -->
        </main>


        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Video bg -->
        <script src="./assets/js/jquery.vide.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- Date Picker -->
        <script src="./assets/js/gijgo.min.js"></script>
        <!-- Nice-select, sticky -->
        <script src="./assets/js/jquery.nice-select.min.js"></script>
        <script src="./assets/js/jquery.sticky.js"></script>
        <!-- Progress -->
        <script src="./assets/js/jquery.barfiller.js"></script>

        <!-- counter , waypoint,Hover Direction -->
        <script src="./assets/js/jquery.counterup.min.js"></script>
        <script src="./assets/js/waypoints.min.js"></script>
        <script src="./assets/js/jquery.countdown.min.js"></script>
        <script src="./assets/js/hover-direction-snake.min.js"></script>

        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>


    </body>
</html>
