<%-- 
    Document   : home
    Created on : Aug 7, 2024, 3:15:40 AM
    Author     : Nguyễn Quang Minh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courses | Education</title>



        <title>JSP Page</title>
        <link rel="stylesheet" href="courses-master/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/slicknav.css">
        <link rel="stylesheet" href="courses-master/assets/css/flaticon.css">
        <link rel="stylesheet" href="courses-master/assets/css/progressbar_barfiller.css">
        <link rel="stylesheet" href="courses-master/assets/css/gijgo.css">
        <link rel="stylesheet" href="courses-master/assets/css/animate.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/animated-headline.css">
        <link rel="stylesheet" href="courses-master/assets/css/magnific-popup.css">
        <link rel="stylesheet" href="courses-master/assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/themify-icons.css">
        <link rel="stylesheet" href="courses-master/assets/css/slick.css">
        <link rel="stylesheet" href="courses-master/assets/css/nice-select.css">
        <link rel="stylesheet" href="courses-master/assets/css/style.css">
        <link rel="stylesheet" href="./css/slider.css">
        <link rel="stylesheet" href="./css/time.css">
        <style>
            #notification {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                background-color: #f8d7da;
                color: #721c24;
                padding: 10px;
                text-align: center;
            }
        </style>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <!--? slider Area Start-->
        <section class="slider-area ">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider slider-height d-flex align-items-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-6 col-lg-7 col-md-12">
                                <div class="hero__caption">
                                    <h1 data-animation="fadeInLeft" data-delay="0.2s">Welcome to<br> Learning Online Website</h1>
                                    <p data-animation="fadeInLeft" data-delay="0.4s">Build skills with courses, certificates, and degrees online from world-class universities and companies</p>

                                </div>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        </section>

        <!-- service ad -->
        <div class="services-area">
            <div class="container">
                <div class="row justify-content-sm-center">
                    <div class="col-lg-4 col-md-6 col-sm-8">
                        <div class="single-services mb-30">
                            <div class="features-icon">
                                <img src="courses-master/assets/img/icon/icon1.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <h3>60+ online courses</h3>
                                <p>Explore 60+ courses tailored to enhance your skills and knowledge.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-8">
                        <div class="single-services mb-30">
                            <div class="features-icon">
                                <img src="courses-master/assets/img/icon/icon2.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <h3>Expert instructors</h3>
                                <p>Learn from industry-leading experts with real-world experience.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-8">
                        <div class="single-services mb-30">
                            <div class="features-icon">
                                <img src="courses-master/assets/img/icon/icon3.svg" alt="">
                            </div>
                            <div class="features-caption">
                                <h3>Life time access</h3>
                                <p>Enjoy lifetime access to courses, learning at your own pace.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Courses area start -->
        <div class="game-section" >
            <h2 class="line-title" style="font-family: Roboto, sans-serif; font-size: 20px;">Season Discount</h2>

            <div class="courses-area section-padding40 fix">
                <div class="container">

                    <div class="courses-actives">
                        <!-- discount items here -->
                    </div>
                </div>
            </div>
        </div>
        
        
        
    </body>
</html>
