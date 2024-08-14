<%-- 
    Document   : courselist
    Created on : Sep 18, 2023, 3:45:17 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Courses | Education</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="template course_detail/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="template course_detail/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="template course_detail/assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="template course_detail/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="template course_detail/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="template course_detail/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="template course_detail/assets/css/color/color-1.css">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
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
    </head>

    <body id="bg">
        <jsp:include page="header.jsp"></jsp:include>  
            <div class="page-wraper">
                <div id="loading-icon-bx"></div>
                <!-- Content -->
                <div class="page-content bg-white">
                    <!-- inner page banner -->
                    <div class="page-banner ovbl-light" style="background-image: url('https://images.pexels.com/photos/4709289/pexels-photo-4709289.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')">
                        <div class="container">
                            <div class="page-banner-entry">
                                <h1 class="text-white">Courses Details</h1>
                            </div>
                        </div>
                    </div>
                    <!-- Breadcrumb row -->

                    <div class="course-buy-now text-left">
                        <a href="subjectdetail?category_id=${category_id}&subject_id=${subject.subject_id}" class="btn radius-xl text-uppercase mt-2 ml-2">Back to Course List</a>
                </div>
                <!-- Breadcrumb row END -->
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- About Us -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row d-flex flex-row-reverse">
                                <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                    <div class="course-detail-bx">

                                        <div class="course-buy-now text-center">
                                            <a href="#" class="disabled btn radius-xl text-uppercase">Available Course</a>
                                        </div>
                                        <hr>
                                        <div class="course-buy-now text-center">
                                            <img src="data:image/jpeg;base64,${course.image}"alt="" style="border-radius: 50%; max-width: 100px; max-height: 100px;" /> 
                                        </div>                                        
                                        <div class="teacher-bx">
                                            <div class="teacher-info">
                                                <div class="teacher-thumb">
                                                    <img src="data:image/jpeg;base64,${account.avatar}" alt=""/>
                                                </div>
                                                <div class="teacher-name">
                                                    <h5>${account.fullname}</h5>
                                                    <span>Teacher</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="cours-more-info">
                                            <div class="review">
                                                <span>Rate</span> ${course.rate_course}⭐

                                                <ul class="cours-star">
                                                    <!-- Render full stars -->
                                                    <c:forEach begin="1" end="${Math.floor(course.rate_course)}" varStatus="loop">
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        </c:forEach>

                                                    <!-- Render half star if needed for the 5th star -->
                                                    <c:if test="${course.rate_course > Math.floor(course.rate_course) && course.rate_course < Math.floor(course.rate_course) + 1}">
                                                        <li class="active halfstar"><i class="fa fa-star-half"></i></li>
                                                        </c:if>

                                                    <!-- Render inactive stars -->
                                                    <c:forEach begin="${Math.ceil(course.rate_course) + 1}" end="5" varStatus="loop">
                                                        <li><i class="fa fa-star"></i></li>
                                                        </c:forEach>
                                                </ul>
                                            </div>
                                            <div class="price categories">
                                                <span>Categories</span>
                                                <h5 class="text-primary">${course.category_name}</h5>
                                            </div>
                                        </div>
                                        <div class="course-info-list scroll-page">
                                            <ul class="navbar">
                                                <li><a class="nav-link" href="#overview"><i class="ti-zip"></i>Overview</a></li>
                                                <li><a class="nav-link" href="#curriculum"><i class="ti-bookmark-alt"></i>Curriculum</a></li>
                                                <li><a class="nav-link" href="#instructor"><i class="ti-user"></i>Instructor</a></li>
                                                <li><a class="nav-link" href="#reviews"><i class="ti-star"></i>Rate</a></li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-9 col-md-8 col-sm-12">
                                    <div class="courses-post">
                                        <div class="ttr-post-media media-effect">
                                            <a href="#"><img src="assets/images/blog/default/thum1.jpg" alt=""></a>
                                        </div>
                                        <div class="ttr-post-info">
                                            <div class="ttr-post-title ">
                                                <h2 class="post-title">${course.course_name}</h2>
                                            </div>
                                            <span class="course-buy-now text-center">
                                                <a href="overview?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}" class=" btn radius-xl text-uppercase">Let's Study!</a>
                                            </span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="courese-overview" id="overview">
                                        <h4>Overview</h4>
                                        <div class="row">
                                            <div class="col-md-12 col-lg-4">
                                                <ul class="course-features">
                                                    <li><i class="ti-bookmark-alt"></i> <span class="label">Major</span> <span class="value">${course.category_name}</span></li>
                                                    <li><i class="ti-book"></i> <span class="label">Subject</span> <span class="value">${subject.subject_name}</span></li>
                                                    <li><i class="ti-pencil"></i> <span class="label">Lecturer</span> <span class="value">${subject.lecturer_name}</span></li>
                                                    <li><i class="ti-file"></i> <span class="label">Course No</span> <span class="value">${course.course_no}</span></li>
                                                    <li><i class="ti-files"></i> <span class="label">Chapter</span> <span class="value">${course.chapter_num}</span></li>
                                                    <li><i class="ti-notepad"></i> <span class="label">Lesson</span> <span class="value">${course.lesson_num}</span></li>
                                                    <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                    <li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">${subject.sold}</span></li>
                                                    <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-12 col-lg-8">
                                                <h5 class="m-b5">💡 Course Description</h5>

                                                <p>${course.description}</p>
                                                <h5 class="m-b5">✔ Learning Outcomes</h5>
                                                <ul class="list-checked primary">
                                                    <li>Over 37 lectures and 55.5 hours of content!</li>
                                                    <li>LIVE PROJECT End to End Software Testing Training Included.</li>
                                                    <li>Learn Software Testing and Automation basics from a professional trainer from your own desk.</li>
                                                    <li>Information packed practical training starting from basics to advanced testing techniques.</li>
                                                    <li>Best suitable for beginners to advanced level users and who learn faster when demonstrated.</li>
                                                    <li>Course content designed by considering current software testing technology and the job market.</li>
                                                    <li>Practical assignments at the end of every session.</li>
                                                    <li>Practical learning experience with live project work and examples.cv</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="m-b30" id="curriculum">
                                        <h4>Curriculum</h4>
                                        <ul class="curriculum-list">
                                            <c:forEach items="${requestScope.listChapter}" var="listchapter">
                                                <li>
                                                    <h5>Chapter ${listchapter.chapter_no} : ${listchapter.chapter_name}</h5>
                                                    <ul>

                                                        <c:forEach items="${requestScope.listLesson}" var="listlesson">
                                                            <c:if test="${listlesson.chapter_id == listchapter.chapter_id}">
                                                                <li>
                                                                    <div class="curriculum-list-box">
                                                                        <span>Lesson ${listlesson.lesson_no}.</span> ${listlesson.lesson_name}
                                                                    </div>
                                                                    <span>120 minutes</span>
                                                                </li>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:forEach items="${requestScope.listQuiz}" var="listquiz">
                                                            <c:if test="${listquiz.chapter_id == listchapter.chapter_id}">
                                                                <li>
                                                                    <div class="curriculum-list-box">
                                                                        <span>Quiz.</span> ${listquiz.name}
                                                                    </div>
                                                                    <span>120 minutes</span>
                                                                </li>
                                                            </c:if>
                                                        </c:forEach>


                                                    </ul>
                                                </li>
                                            </c:forEach>
                                        </ul>

                                    </div>
                                    <hr>
                                    <div class="" id="instructor">
                                        <h4>Instructor</h4>
                                        <div class="instructor-bx">
                                            <div class="instructor-author">
                                                <img src="data:image/jpeg;base64,${course.image}" alt="">
                                            </div>
                                            <div class="instructor-info">
                                                <h6>${account.fullname}</h6>
                                                <span>Lecturer</span>
                                                <h6><i class="fa fa-google-plus"></i> /${account.email}</h6>
                                                <span><i class="fa fa-phone"></i>  /${account.phone}</span>
                                                <ul class="list-inline m-tb10">
                                                    <li><a href="#" class="btn sharp-sm facebook"><i class="fa fa-facebook"></i></a></li>
                                                    <li><a href="#" class="btn sharp-sm twitter"><i class="fa fa-twitter"></i></a></li>
                                                    <li><a href="#" class="btn sharp-sm linkedin"><i class="fa fa-google-plus"></i></a></li>
                                                    <li><a href="#" class="btn sharp-sm google-plus"><i class="fa fa-phone"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="" id="reviews">
                                        <h4>Rate</h4>

                                        <div class="review-bx">
                                            <div class="all-review">
                                                <h2 class="rating-type">${course.rate_course}⭐</h2>
                                                <ul class="cours-star">
                                                    <!-- Render full stars -->
                                                    <c:forEach begin="1" end="${Math.floor(course.rate_course)}" varStatus="loop">
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        </c:forEach>

                                                    <!-- Render half star if needed for the 5th star -->
                                                    <c:if test="${course.rate_course > Math.floor(course.rate_course) && course.rate_course < Math.floor(course.rate_course) + 1}">
                                                        <li class="active halfstar"><i class="fa fa-star-half"></i></li>
                                                        </c:if>

                                                    <!-- Render inactive stars -->
                                                    <c:forEach begin="${Math.ceil(course.rate_course) + 1}" end="5" varStatus="loop">
                                                        <li><i class="fa fa-star"></i></li>
                                                        </c:forEach>
                                                </ul>
                                                <span>Rate</span>
                                            </div>


                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- contact area END -->

                    </div>
                </div>
                <!-- Content END-->
            </div>

            <button class="back-to-top fa fa-chevron-up" ></button>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>  
        <!-- External JavaScripts -->
        <script src="template course_detail/assets/js/jquery.min.js"></script>
        <script src="template course_detail/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="template course_detail/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="template course_detail/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="template course_detail/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="template course_detail/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="template course_detail/assets/vendors/counter/waypoints-min.js"></script>
        <script src="template course_detail/assets/vendors/counter/counterup.min.js"></script>
        <script src="template course_detail/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="template course_detail/assets/vendors/masonry/masonry.js"></script>
        <script src="template course_detail/assets/vendors/masonry/filter.js"></script>
        <script src="template course_detail/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="template course_detail/assets/js/jquery.scroller.js"></script>
        <script src="template course_detail/assets/js/functions.js"></script>
        <script src="template course_detail/assets/js/contact.js"></script>
        <script src="template course_detail/assets/vendors/switcher/switcher.js"></script>
    </body>

</html>
