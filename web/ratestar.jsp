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
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="template learningenvironment/style.css" />
        <!-- Customized Bootstrap Stylesheet -->
        <link href="template subject_detail/css/style.css" rel="stylesheet">
        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- All PLUGINS CSS ============================================= -->
        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="template course_detail/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="template course_detail/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="template course_detail/assets/css/color/color-1.css">
        <link rel="stylesheet" href="template certificate/rate.css">
        
         <!-- Popper.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>

    <body>

        <jsp:include page="header3.jsp"></jsp:include> 

            <div class="container">
                <!-- Sidebar -->
            <jsp:include page="sidebarlearning.jsp"></jsp:include> 
                <!-- Sidebar -->
                <!-- Content -->



                <div class="content">
                    <div id="rate-container" class="rate-container">
                        <h4>Your Rate</h4>
                        <div class="review-bx">
                            <form id="ratingForm" method="post" action="rate">
                                <div id="rate" class="rate">
                                    <div data-score="0" class="star"></div>
                                    <div data-score="1" class="star"></div>
                                    <div data-score="2" class="star"></div>
                                    <div data-score="3" class="star"></div>
                                    <div data-score="4" class="star"></div>
                                    <div data-score="5" class="star"></div>
                                </div>
                                <div class="result">
                                    Rating: <span id="result"></span>
                                </div>
                                <input type="hidden" name="rating" id="ratingInput" >
                                <input type="hidden" name="course_id" value="${course.course_id}">
                            <input type="hidden" name="learner_id" value="${sessionScope.account.account_id}">
                            <input type="hidden" name="subject_id" value="${subject_id}">
                            <input type="hidden" name="category_id" value="${category_id}">
                        </form>
                    </div>
                </div>
                <hr>



                <div class="" id="reviews">
                    <h2>Rate for ${course.course_name}</h2>
                    <div class="review-bx">
                        <hr>
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
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>

        <script src="template learningenvironment/script.js"></script>
        <script src="template certificate/rate.js"></script>



    </body>

</html>
