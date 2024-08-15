<%-- 
    Document   : courselist
    Created on : Sep 18, 2023, 3:45:17 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<link rel="stylesheet" href="template learningenvironment/style.css" />
<link href="template subject_detail/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<!-- navbar -->
<div>
    <!-- sidebar -->
    <nav class="sidebar">
        <hr>
        <div>
            <div class="logo_item">
                <i class="bx bx-menu" id="sidebarOpen"></i>
            </div>
            <div class="navbar_content">
                <i class='bx bx-sun' id="darkLight"></i>
            </div>
        </div>  
        <div class="menu_content">
            <ul class="menu_items">
                <hr>

                <span >
                    <a style="padding-left: 5px" href="overview?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}" class=" ">💡 Over View</a>
                </span>
                <hr>
                <!-- duplicate or remove this li tag if you want to add or remove navlink with submenu -->
                <!-- start -->
                <span style="padding-left: 5px">📖 Chapter Lesson</span>

                <div id="content2">

                    <c:forEach items="${requestScope.listChapter}" var="listchapter">
                        <li class="item">
                            <c:forEach items="${requestScope.listLearnerChapter}" var="learnerchapter">
                                <c:if test="${learnerchapter.chapter_id == listchapter.chapter_id && learnerchapter.learner_id == sessionScope.account.account_id && learnerchapter.status == 1}">
                                    <div href="#" class="nav_link submenu_item">

                                        <h5><i style="color: green; font-size: 20px" class="fa fa-check-circle"></i>&nbsp;&nbsp;Chapter ${listchapter.chapter_no}: ${listchapter.chapter_name}<i class="bx bx-chevron-right arrow-left"></i></h5>

                                    </div>
                                </c:if>
                                <c:if test="${learnerchapter.chapter_id == listchapter.chapter_id && learnerchapter.learner_id == sessionScope.account.account_id && learnerchapter.status != 1}">
                                    <div href="#" class="nav_link submenu_item">

                                        <h5><i class=""></i>&nbsp;&nbsp;Chapter ${listchapter.chapter_no}: ${listchapter.chapter_name}<i class="bx bx-chevron-right arrow-left"></i></h5>

                                    </div>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${requestScope.listLesson}" var="listlesson">
                                <c:if test="${listlesson.chapter_id == listchapter.chapter_id}">
                                    <ul class="menu_items submenu">
                                        <h6 > 
                                            <span style="white-space: normal;">
                                                <c:forEach items="${requestScope.listLearnerLesson}" var="learnerlesson">

                                                    <c:if test="${learnerlesson.lesson_id == listlesson.lesson_id && learnerlesson.learner_id == sessionScope.account.account_id && learnerlesson.status == 1}">

                                                        <a style="font-size: 12px" href="learning?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}&chapter_id=${listchapter.chapter_id}&lesson_id=${listlesson.lesson_id}" class="nav_link sublink">

                                                            <i style="color: green; font-size: 20px" class="fa fa-check-circle-o"></i> &nbsp;&nbsp; Lesson ${listlesson.lesson_no}:&nbsp;${listlesson.lesson_name}

                                                        </a>

                                                    </c:if>

                                                    <c:if test="${learnerlesson.lesson_id == listlesson.lesson_id && learnerlesson.learner_id == sessionScope.account.account_id && learnerlesson.status != 1}">

                                                        <a style="font-size: 12px" href="learning?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}&chapter_id=${listchapter.chapter_id}&lesson_id=${listlesson.lesson_id}" class="nav_link sublink">

                                                            Lesson ${listlesson.lesson_no}:&nbsp;${listlesson.lesson_name}

                                                        </a>

                                                    </c:if>

                                                </c:forEach></span>
                                        </h6>
                                    </ul>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${requestScope.listQuiz}" var="listquiz">
                                <c:if test="${listquiz.chapter_id == listchapter.chapter_id}">
                                    <ul class="menu_items submenu">
                                        <h6 > 
                                            <span style="white-space: normal;">
                                                <c:forEach items="${requestScope.listQuizResult}" var="quizresult">
                                                    <jsp:useBean id="q" class="dto.Quiz2DAO" scope="request"/>
                                                    <c:set var="num" value="${q.getNumberQuestionOfQuiz(quizresult.quiz_id)}"></c:set>
                                                    <c:if test="${num != 0}">
                                                        <c:if test="${quizresult.quiz_id == listquiz.quiz_id && quizresult.learner_id == sessionScope.account.account_id && quizresult.status == 1}">
                                                            <a style="font-size: 12px; color: black" href="takequiz?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}&chapter_id=${listchapter.chapter_id}&quiz_id=${quizresult.quiz_id}" class="nav_link sublink"><i style="color: green; font-size: 20px" class="fa fa-check-circle-o"></i> &nbsp; Quiz:&nbsp; ${listquiz.name}</a>

                                                        </c:if>

                                                        <c:if test="${quizresult.quiz_id == listquiz.quiz_id && quizresult.learner_id == sessionScope.account.account_id && quizresult.status != 1}">
                                                            <a style="font-size: 12px; color: black" href="takequiz?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}&chapter_id=${listchapter.chapter_id}&quiz_id=${quizresult.quiz_id}" class="nav_link sublink"><i style="color: orange; font-size: 20px" class="fa fa-question-circle"></i>&nbsp; Quiz:&nbsp; ${listquiz.name}</a>

                                                        </c:if> 
                                                    </c:if>

                                                </c:forEach>

                                            </span>
                                        </h6>
                                    </ul>
                                </c:if>
                            </c:forEach>
                        </li>
                    </c:forEach>

                </div>

                <!-- end -->
                <hr>

            </ul>

            <ul class="menu_items">
                <div class="menu_title menu_editor"></div>
                <!-- duplicate these li tag if you want to add or remove navlink only -->
                <!-- Start -->
                <c:if test="${learnercourse.status == 1 && learnercourse.learner_id == sessionScope.account.account_id}">
                    <li class="item">
                        <a href="getcoursecertificate?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}" class="nav_link">
                            <span class="navlink_icon">
                                <i class="bx bx-medal"></i>
                            </span>
                            <span class="navlink">Your Course Certificate is Ready</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${learnersubject.status == 1 && learnersubject.learner_id == sessionScope.account.account_id}">
                    <li class="item">
                        <a href="getsubjectcertificate?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}" class="nav_link">
                            <span class="navlink_icon">
                                <i class="bx bx-medal"></i>
                            </span>
                            <span class="navlink">Your Subject Certificate is Ready</span>
                        </a>
                    </li>
                </c:if>
                <li class="item">
                    <a href="rate?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}" class="nav_link">
                        <span class="navlink_icon">
                            <i class="bx bx-flag"></i>
                        </span>
                        <span class="navlink">Rate For This Course</span>
                    </a>
                </li>
                <!-- End -->



            </ul>
            <ul class="menu_items">
                <div class="menu_title menu_setting"></div>

                <li class="item">
                    <a href="coursedetail?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}" class="nav_link">
                        <span class="navlink_icon">
                            <i class="bx bx-layer"></i>
                        </span>
                        <span class="navlink">Back to Course Detail</span>
                    </a>
                </li>
            </ul>

            <!-- Sidebar Open / Close -->
            <div class="bottom_content">
                <div class="bottom expand_sidebar">
                    <span> Expand</span>
                    <i class='bx bx-log-in' ></i>
                </div>
                <div class="bottom collapse_sidebar">
                    <span> Collapse</span>
                    <i class='bx bx-log-out'></i>
                </div>
            </div>
        </div>
    </nav>
</div>
<!-- JavaScript -->


