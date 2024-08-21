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
        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="template course_detail/assets/css/shortcodes/shortcodes.css">
        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="template course_detail/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="template course_detail/assets/css/color/color-1.css">

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
                    <hr>
                    <div class="content-block">
                        <!-- About Us -->
                        <div class="section-area section-sp1">
                            <div class="container">
                                <div class="row d-flex flex-row-reverse">
                                    <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                        <div class="course-detail-bx">

                                            <div class="course-info-list scroll-page">
                                                <ul class="navbar">
                                                    <li><a class="nav-link" href="#overview"><i class="ti-zip"></i>Overview</a></li>
                                                    <li><a class="nav-link" href="#curriculum"><i class="ti-bookmark-alt"></i>Curriculum</a></li>

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


                                                    </ul>
                                                </li>
                                            </c:forEach>
                                        </ul>

                                    </div>



                                </div>
                            </div>
                        </div>
                        <!-- contact area END -->

                    </div>
                </div>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
            <script src="template learningenvironment/script.js"></script>



    </body>

</html>
