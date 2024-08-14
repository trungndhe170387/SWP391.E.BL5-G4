<%-- 
    Document   : questionbank
    Created on : Sep 28, 2023, 12:02:41 AM
    Author     : HoangAnh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Courses | Education</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<link rel="manifest" href="site.webmanifest">-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
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
        <link href="assets/css/paging.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <style>
            #pages li.goPrevious, li.goNext{
                color: #333;
                padding: 0px 5px;
                cursor: pointer;
            }
            #pages li.goPrevious:hover, li.goNext:hover{
                background-color: #CFC;
            }
            #pages .pageInfo{
                padding: 0px 5px;
                border: 0px;
            }
        </style>

    </head>

    <body>
        

        <main>
            <!--? slider Area Start-->
            <!--            <section class="slider-area slider-area2">
                            <div class="slider-active">
                                 Single Slider 
                                <div class="single-slider slider-height2">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xl-8 col-lg-11 col-md-12">
                                                <div class="hero__caption hero__caption2">
                                                    <h1 data-animation="bounceIn" data-delay="0.2s">Our courses</h1>
                                                     breadcrumb Start
                                                    <nav aria-label="breadcrumb">
                                                        <ol class="breadcrumb">
                                                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                                            <li class="breadcrumb-item"><a href="#">Services</a></li> 
                                                        </ol>
                                                    </nav>
                                                     breadcrumb End 
                                                </div>
                                            </div>
                                        </div>
                                    </div>          
                                </div>
                            </div>
                        </section>-->
            <!-- Courses area start -->
            <div class="courses-area section-padding40 fix" id="paging">
                <div class="container list" id="rows">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-8">
                            <div class="section-tittle text-center mb-55">
                                <h2>Question Bank</h2>
                                <input style="text-align: center" type="text" name="txtSearch" placeholder="SEARCH SUBJECTS" class="txtSearch"/>
                            </div>
                        </div>
                    </div>
                    <!--List subject in question bank-->
                    <div class="row paging " id="list-product">

                    </div>
                    <ul style="display: flex; margin-bottom: 10px" id="pages">
                        <li class="pageInfo">Page 1 of 6</li>
                        <div style="display: flex; margin-left: 30px">
                            <li class="goPrevious">&lsaquo;&lsaquo; Previous</li>
                            <li>
                                <input type="text" class="currentPage" id="currentPage" value="" style="
                                       width: 40px;
                                       height: 25px;
                                       text-align: center;
                                       margin: 0px 30px;
                                       ">
                            </li>
                            <li class="goNext">Next &rsaquo;&rsaquo;</li>
                        </div>
                    </ul>
                </div>
            </div>
            <!-- Courses area End -->
        </main>

        <!-- Scroll Up -->
        <div id="back-top" >
            <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
        </div>

        <!-- JS here -->
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

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
        <script src="assets/js/main.js" type="text/javascript"></script>
        <script src="js/questionbank.js" type="text/javascript"></script>
    </body>
</html>
