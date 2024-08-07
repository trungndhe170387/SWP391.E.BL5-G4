<%-- 
    Document   : header
    Created on : Aug 7, 2024, 3:40:14 AM
    Author     : Nguyễn Quang Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                max-height: 7em; 
                overflow: hidden; 
                white-space: normal; 
            }
            .subject_card:hover{
                transform: scale(1.1);
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            }
        </style>
    </head>
    <body>
        <div class="header-area header-transparent">
            <div class="main-header ">
                <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!--Logo--> 
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="home"><img src="web/img/logo.png" alt=""></a>
                                </div>
                            </div>


                            <div class="col-xl-10 col-lg-10">
                                <div class="menu-wrapper d-flex align-items-center justify-content-end">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav>
                                            <ul id="navigation">                                                                                          
                                                <li class="active" ><a href="home">Home</a></li>
                                                <li><a href="subjectlist">Subject</a></li>
                                                <li><a href="bloglist">Blog</a></li>
                                                <!-- Cart -->
                                                <li class="button-header">
                                                    <div style="display: flex;justify-content: center;align-items: end;padding-top: " id="bag">
                                                        <div>
                                                            <img src="img/CART.png" style="height: 50px"alt=""/>
                                                        </div>
                                                        <div >
                                                            <a style="height: 15px" href="cart">(${size})</a>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
