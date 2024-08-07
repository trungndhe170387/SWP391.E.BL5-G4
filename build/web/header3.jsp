<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Your Page Title</title>
        <!-- Add your stylesheets and scripts here -->
        <link rel="stylesheet" href="path/to/your/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <!-- Add other necessary links -->

        <style>
            .avatar {
                width: 70px;
                height: 70px;
                background-size: cover;
                background-position: center center;

                /*                position: absolute;
                                top: 50%;
                                left: 50%;
                                transform: translate(-50%, -50%);*/
            }
            .user-avatar {
                border-radius: 50%;
                overflow: hidden;
            }
            .star-icon {
                color: black;
                opacity: 0.5;
            }
            .image-container {
                border: 5px solid #FF99CC;
                border-radius: 50%;
                padding: 2px;
                height: 260px;
                width: 260px;
            }
            .limited-height {
                max-height: 7em; /* Đặt chiều cao tối đa tương đương 3 dòng */
                overflow: hidden; /* Ẩn phần vượt quá chiều cao tối đa */
                white-space: normal; /* Cho phép xuống dòng tự động */
            }
            .subject_card:hover{
                transform: scale(1.1);
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            }
        </style>
    </head>
    <body>
        <header>
            <!-- Navbar Start -->
            <div class="bg-light position-relative shadow">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0 px-lg-5">
                    <a href="" class="navbar-brand font-weight-bold text-secondary" style="font-size: 50px;">
                        <div class="preloader-img pere-text">
                            <img src="assets/img/logo/loder.png" alt="">
                            <span class="text-primary">Course</span>
                        </div>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav font-weight-bold mx-auto py-0">
                            <a href="home" class="nav-item nav-link active">Home</a>
                            <a href="subjectlist" class="nav-item nav-link">Subjects</a>

                            <c:if test="${sessionScope.account.role_id == 3}">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" id="lecturerManagementDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Lecturer Management</a>
                                    <ul class="submenu dropdown-menu" aria-labelledby="lecturerManagementDropdown">
                                        <li><a href="chart" class="dropdown-item">Chart</a></li>
                                        <li><a href="subjectmanagement" class="dropdown-item">Subject Management</a></li>
                                        <li><a href="lecturersubject" class="dropdown-item">Question Bank</a></li>
                                    </ul>
                                </li>
                            </c:if>

                            <li class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Blog</a>
                                <ul class="submenu dropdown-menu" aria-labelledby="makerterManagementDropdown">
                                    <li><a href="bloglist" class="dropdown-item">Blog</a></li>
                                        <c:if test="${sessionScope.account.role_id == 4}">
                                        <li><a href="blog_marketer" class="dropdown-item">Blog Edit</a></li>
                                        </c:if>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Slider</a>
                                <ul class="submenu dropdown-menu" aria-labelledby="makerterManagementDropdown">
                                    <li><a href="sliderlist" class="dropdown-item">Slider</a></li>
                                        <c:if test="${sessionScope.account.role_id == 4}">
                                        <li><a href="slider_marketer" class="dropdown-item">Slider Edit</a></li>
                                        </c:if>
                                </ul>
                            </li>
                            <c:if test="${sessionScope.account.role_id == 1}">
                                <a href="manageaccount" class="nav-item nav-link active">Admin Management</a>
                            </c:if>
                            <c:if test="${sessionScope.account.role_id == 2}">
                                <a href="mycourse" class="nav-item nav-link">My Subject</a>
                            </c:if>
                        </div>
                        <c:if test="${sessionScope.account == null}">
                            <a href="Login.jsp" class="btn btn-primary px-4">Log in</a>
                        </c:if>

                        <c:if test="${sessionScope.account != null}">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <div class="user-avatar">
                                        <div class="avatar" style="background-image: url('data:image/jpeg;base64,${sessionScope.account.avatar}')"></div>
                                    </div>
                                </a>
                                <ul class="submenu dropdown-menu" aria-labelledby="userDropdown">
                                    <li><a href="profile" class="dropdown-item">Profile</a></li>
                                    <li><a href="logout" class="dropdown-item">Log out</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <form action="buysubject" method="get">
                            <li class="button-header">
                                <c:set var="size" value="${sessionScope.size}"/>
                                <p id="bag">
                                    <img src="img/CART.png" width="50" height="50"/> 
                                    <a href="cart.jsp"> Mybag (${size}) items</a>
                                </p>
                            </li>
                        </form>
                        <div id="productExistsAlert" class="alert alert-warning" style="display: none;">
                            <span id="productExistsMessage"></span>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <script>
        var productExistsMessage = "${productExistsMessage}";
        if (productExistsMessage !== "") {
            document.getElementById("productExistsMessage").textContent = productExistsMessage;
            document.getElementById("productExistsAlert").style.display = "block";
        }
        </script>
        <!-- Navbar End -->
    </body>
</html>
