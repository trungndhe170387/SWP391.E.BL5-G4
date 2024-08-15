<%-- 
    Document   : courselist
    Created on : Sep 18, 2023, 3:45:17 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>


<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Courses | Education</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Handlee&family=Nunito&display=swap" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Flaticon Font -->
        <link href="template subject_detail/lib/flaticon/font/flaticon.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="template subject_detail/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="template subject_detail/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="template subject_detail/css/style.css" rel="stylesheet">

        <link rel="stylesheet" href="template certificate/certificate.css">
        <!-- Popper.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>
            .pm-certificate-container {
                width: 60%;
                margin: 0 auto;
                margin-top: 50px;
            }
            .logo {
                position: absolute;
                top: 10px; /* Điều chỉnh khoảng cách từ trên xuống */
                left: 10px; /* Điều chỉnh khoảng cách từ trái sang phải */
                width: 50px;
            }
        </style>
    </head>

    <body onload="autoClick()">

        <jsp:include page="header3.jsp"></jsp:include> 

            <main>
                <div>
                    <a href="overview?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${course.course_id}" class="btn btn-secondary mt-3"><i class="fa fa-backward"></i> Back to Learning Environment </a>
                <div id="certificate" class="pm-certificate-container">
                    <div class="pm-certificate-border">
                        <div class="pm-certificate-header">
                            <div class="pm-certificate-title cursive">
                                <h2 style="font-family: 'Pinyon Script', cursive; font-weight: bold">${course.course_name}</h2>
                            </div>
                        </div>
                        <div class="pm-certificate-body">
                            <div class="pm-certificate-block">
                                <div class="pm-certificate-name underline">
                                    <span class="pm-name-text bold">${sessionScope.account.fullname}</span>
                                </div>
                                <div class="pm-earned">
                                    <h3 class="pm-earned-text cursive">has successfully completed ${course.course_name}</h3>
                                    <span class="pm-credits-text bold sans">PD175: 1.0 Credit Hours</span>
                                </div>
                                <div class="pm-course-title">
                                    <span class="pm-earned-text cursive">while completing the training course entitled</span>

                                </div>
                            </div>
                            <div class="pm-certificate-footer">
                                <div class="pm-certified">
                                    <span class="pm-credits-text sans">Lecturer</span>
                                    <div class="pm-empty-space underline">${subject.lecturer_name}</div>
                                    <span class="bold"></span>
                                </div>
                                <div class="pm-certified">
                                    <span class="pm-credits-text sans">HolaLearn Course</span>
                                    <div class="pm-empty-space underline"></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="float: right; margin-right: 220px; margin-top: 20px">

                    <a  id="download" class="btn btn-secondary mb-2 mt-1 py-3 px-5"><i class="fa fa-download"></i>  Download as Image </a>
                    <a  id="download2" class="btn btn-secondary mb-2 mt-1 py-3 px-5"><i class="fa fa-download"></i>  Download as PDF </a>
                </div>
            </div>
            <hr>

        </main>

        <!-- JS here -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
        <script type="text/javascript">


        $(document).ready(function () {
            var element = $("#certificate");

            $("#download").on('click', function () {

                html2canvas(element, {
                    onrendered: function (canvas) {
                        var imageData = canvas.toDataURL("image/jpg");
                        var newData = imageData.replace(/^data:image\/jpg/, "data:application/octet-stream");
                        $("#download").attr("download", "image.jpg").attr("href", newData);
                    }
                });

            });
        });

        $(document).ready(function () {

            $("#download2").on('click', function () {
                var element = document.querySelector('#certificate');
                html2pdf().from(element).save();

            });
        });

        function autoClick() {
            $("#download").click();
        }

        </script>




    </body>
</html>

