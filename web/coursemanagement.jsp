<%-- 
    Document   : course_detai
    Created on : Sep 19, 2023, 1:31:08 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Courses | Education</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>


        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Handlee&family=Nunito&display=swap" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Flaticon Font -->
        <link href="template course_detail/lib/flaticon/font/flaticon.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="template course_detail/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="template course_detail/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="template course_detail/css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">


        <style>
            .error {
                color: red;
                display: none;
                font-size: 20px;
            }
            #subjecttable{
                width: 100%;
            }
            #editSub{
                cursor: pointer;
            }
            #addSub{
                cursor: pointer;
            }
            #deleteSub{
                cursor: pointer;
            }
            .arrow-button {
                background: none; /* Xóa màu nền */
                color: #3498db; /* Màu chữ mặc định */
                border: none;
                padding: 5px 10px; /* Giảm kích thước padding để làm cho nút nhỏ hơn */
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px; /* Giảm kích thước font */
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px;
            }

            /* Tùy chỉnh biểu tượng mũi tên */
            .arrow-button i {
                font-size: 18px; /* Giảm kích thước biểu tượng */
                vertical-align: middle;
                margin-right: 5px; /* Khoảng cách giữa biểu tượng và văn bản */
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            /* Biểu tượng và liên kết trong droplist */
            .dropdown-toggle {
                cursor: pointer;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                right: 0; /* Điều chỉnh vị trí sang bên trái */
            }

            .dropdown-content a {
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                color: #333;
            }

            .dropdown-content a:hover {
                background-color: #ddd;
            }

            /* Hiển thị droplist khi hover */
            .dropdown:hover .dropdown-content {
                display: block;
            }

            .showHideColumn{
                cursor: pointer;
                color: blue
            }
            .description-truncated {
                cursor: pointer;
            }
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }

            body {
                background: #232323;
            }

            .accordion{
                margin: 40px 0;
            }
            .accordion .item {
                border: none;
                margin-bottom: 50px;
                background: none;
            }
            .t-p{
                color: rgb(193, 206, 216);
                padding: 40px 30px 0px 30px;
                width: 100%;
            }
            .accordion .item .item-header h2 button.btn.btn-link {
                background: #333435;
                color: white;
                border-radius: 0px;
                font-family: 'Poppins';
                font-size: 24px;
                font-weight: 400;
                line-height: 2.5;
                text-decoration: none;
            }
            .accordion .item .item-header {
                border-bottom: none;
                background: transparent;
                padding: 0px;
                margin: 2px;
            }

            .accordion .item .item-header h2 button {
                color: white;
                font-size: 20px;
                padding: 15px;
                display: block;
                width: 100%;
                text-align: left;
            }

            .accordion .item .item-header h2 i {
                float: right;
                font-size: 30px;
                color: #eca300;
                background-color: black;
                width: 60px;
                height: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 5px;
            }

            button.btn.btn-link.collapsed i {
                transform: rotate(0deg);
            }

            button.btn.btn-link i {
                transform: rotate(180deg);
                transition: 0.5s;
            }

            .submenu {
                background-color: #f8f9fa;
                padding: 10px;
                border-radius: 5px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
                width: 100%;
            }

            .submenu-item {
                /* Đặt độ rộng bằng độ rộng của thẻ có class "item-header" */
                width: 100%;
                padding: 15px 10px;
                text-decoration: none;
                color: #333;
                font-size: 20px;
            }

            .submenu-item:hover {
                background-color: #e9ecef;
            }

            .fullscreen-modal {
                background: rgba(0, 0, 0, 0.5); /* Độ mờ nền khi modal hiển thị */
            }

            .modal-fullscreen {
                max-width: 100%;
                width: 100%;
                height: 100%;
                margin: 0;
            }

            /* CSS cho tab menu */
            .nav-tabs {
                background-color: #333;
            }

            .nav-tabs .nav-item {
                margin-bottom: 0;
            }

            .nav-link {
                color: #fff; /* Màu chữ trên tab */
            }

            .nav-link.active {
                background-color: #3590AB; /* Thay đổi màu nền khi tab được chọn */
                color: #FFFFFC; /* Thay đổi màu chữ khi tab được chọn */
            }
            .modal-body{
                background-color: #EFDEE6;
            }
            .modal-header{
                background-color: #2DB6D8;
            }
            .tab-content{
                margin-top: 50px;
                font-size: 15px;
            }
            .form-group{
                margin: 50px;
            }
            /* Customize the appearance of the list items */
            .custom-nav-item {
                background-color: #f0f0f0; /* Màu nền */
                border-radius: 10px; /* Góc bo tròn */
                margin-bottom: 10px; /* Khoảng cách giữa các mục */
                padding: 10px; /* Khoảng cách bên trong mục */
                font-size: 20px; /* Kích thước chữ */
                text-align: center; /* Canh giữa nội dung trong mục */
                background-color: black;
            }

            /* Hover effect (when you hover over the list items) */
            .custom-nav-item:hover {
                background-color: aqua; /* Màu nền khi di chuột qua */
            }
            .custom-nav-item.active{
                background-color: #D769E2; /* Màu nền */
                color: #fff; /* Màu chữ */
            }


        </style>
    </head>

    <body>
        <jsp:include page="header2.jsp"></jsp:include>  

            <div class="row" style="height: 100%">
                <div class="table-responsive col-md-7">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-md-6">
                                    <h2>${subject_name}</h2>
                            </div>
                            <div class="col-md-6">
                                <a href="subjectmanagement" class="btn btn-success" ><i class="material-icons"></i> <span>View Subject List</span></a>						
                            </div>
                        </div>
                    </div>
                    <div style="padding: 5px; padding-bottom: 20px; font-size: 17px">
                        <button id="addCourse" class="btn btn-success" data-toggle="modal"><i class="material-icons">add</i> <span>Course</span></button>
                        <button id="editCourse" class="btn btn-warning" data-toggle="modal" style="display: none"><i class="material-icons">edit</i> <span>Course</span></button>
                        <button id="deleteCourse" class="btn btn-danger" data-toggle="modal" style="display: none"><i class="material-icons">delete</i> <span>Course</span></button>
                        <button id="addChapter" class="btn btn-success" data-toggle="modal" style="display: none"><i class="material-icons">add</i> <span>Chapter</span></button>
                    </div>

                    <!--Table-->
                    <table class="table table-striped table-hover" id="coursetable">
                        <thead>
                            <tr>
                                <th>course_id</th>
                                <th>course_no</th>
                                <th>course_name</th>
                                <th>image</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr>
                                <th>course_id</th>
                                <th>course_no</th>
                                <th>course_name</th>
                                <th>image</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>   

            <div class="col-md-5 container" style="display: none" id="chapterlist">
                <div class="accordion" id="accordionExample">

                </div>
            </div> 
        </div>


        <!--Edit Course Modal-->
        <div id="editCourseModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="managecourse" method="post" id="editCourseForm" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Course</h4>
                            <button type="button" class="close" data-dismiss="modal" id="edit_close-button" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Course No.</label>
                                <input name="course_no" type="number" class="form-control" required disabled>
                            </div>
                            <div class="form-group">
                                <label>Course Name</label>
                                <input name="course_name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="inputGroupFile">Image</label>
                                <div class="input-group mb-3">
                                    <input type="file" name="image" class="form-control" id="inputGroupFile" required>
                                    <img id="edit_image" alt="Image" style="width: 100%; height: auto"/>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" id="edit_cancel-button" value="Cancel">
                            <input type="submit" class="btn btn-info update_subject" value="Save" id="edit_course_button">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Delete Course Modal-->
        <div id="deleteCourseModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="managecourse" id="deleteCourseForm" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Course</h4>
                            <button type="button" class="close" id="delete_close-button" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p style="font-size: 20px">Are you sure you want to delete this course?</p>
                            <p style="font-size: 15px" class="text-warning">This action cannot be undone.</p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" id="delete_cancel-button"  value="Cancel">
                            <input type="submit" class="btn btn-danger" id="delete_course_button" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Add Course Modal -->
        <div id="addCourseModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
            <div class="modal-dialog">
                <div class="modal-content mx-auto w-100">
                    <form action="managecourse" id="addCourseForm" method="post" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Course</h4>
                            <button type="button" class="close" id="add_close-button" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Course No.</label>
                                <input name="course_no" type="number" class="form-control" required disabled>
                            </div>
                            <div class="form-group">
                                <label>Course Name</label>
                                <input name="course_name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="inputGroupFile">Image</label>
                                <div class="input-group mb-3">
                                    <input type="file" name="image" class="form-control" id="inputGroupFile" required>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" id="add_cancel-button" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add" id="add_course_button">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--Add Chapter Model-->
        <div id="addChapterModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
            <div class="modal-dialog">
                <div class="modal-content mx-auto w-100">
                    <form action="managechapter" id="addChapterForm" method="post" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Chapter</h4>
                            <button type="button" class="close" id="add_chapter_close-button" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Chapter No.</label>
                                <input name="chapter_no" type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Chapter Name</label>
                                <input name="chapter_name" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" id="add_chapter_cancel-button" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add" id="add_chapter_button">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div id="manageChapterLessonModal" class="modal fade fullscreen-modal" tabindex="-1" role="dialog" aria-labelledby="manageModalLabel">
            <div class="modal-dialog modal-fullscreen" role="document">
                <div class="modal-content">
                    <div class="modal-header text-white">						
                        <h4 class="modal-title">Manage Chapter and Lesson</h4>
                        <button type="button" class="close" id="manage_chapterlesson_close-button" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <!-- Tab Menu -->
                        <ul class="nav nav-tabs" id="myTabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="chapter-tab" data-toggle="tab" href="#chapter" role="tab" aria-controls="chapter" aria-selected="true">Chapter</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="lesson-tab" data-toggle="tab" href="#lesson" role="tab" aria-controls="lesson" aria-selected="false">Lesson</a>
                            </li>
                        </ul>

                        <!-- Tab Content -->
                        <div class="tab-content" id="myTabContent">
                            <!-- Tab for Chapter -->
                            <div class="tab-pane fade show active" id="chapter" role="tabpanel" aria-labelledby="chapter-tab">
                                <form action="managechapter" id="updateChapterForm" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label>Chapter No.</label>
                                        <input name="chapter_no" type="number" class="form-control form-control-lg" required readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Chapter Name</label>
                                        <input name="chapter_name" type="text" class="form-control form-control-lg" required readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Number question of the quiz</label>
                                        <select name="numQuestion" class="form-select" required>
                                            <option value="0">0</option>
                                            <option value="10">10</option>
                                            <option value="20">20</option>
                                            <option value="25">25</option>
                                        </select>
                                        <span id="numberQuesError" class="error" style="display: none"></span>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-danger btn-lg" value="Delete" id="delete_chapter_button">
                                        <input type="button" class="btn btn-success btn-lg" value="Update" id="update_chapter_button">
                                        <input type="button" class="btn btn-primary btn-lg" value="Reset" id="reset_chapter_button" style="display: none">
                                        <input type="submit" class="btn btn-success btn-lg" value="Save" id="save_update_chapter_button" style="display: none">
                                    </div>
                                </form>
                            </div>

                            <!-- Tab for Lesson -->
                            <div class="tab-pane fade" id="lesson" role="tabpanel" aria-labelledby="lesson-tab">
                                <div class="row">
                                    <!-- Navigation for Lessons (Vertical) -->
                                    <div class="col-md-4">
                                        <ul class="nav flex-column" id="lessonListNav">
                                        </ul>
                                        <button id="addLesson" class="btn btn-success"><i class="material-icons">add</i> <span>Lesson</span></button>
                                    </div>
                                    <!-- Form for Selected Lesson (Right Side) -->
                                    <div class="col-md-8" id="showUpLessonForm" style="display: none">
                                        <form id="lessonForm" method="post" enctype="multipart/form-data">
                                            <div class="form-row">
                                                <div class="col-md-4">
                                                    <div class="form-group" id="showAddLessonNo">
                                                        <label>Lesson No.</label>
                                                        <input name="add_lesson_no" type="number" class="form-control form-control-lg" required>
                                                    </div>
                                                    <div class="form-group" id="showUpdateLessonNo">
                                                        <label>Lesson No.</label>
                                                        <select name="update_lesson_no" id="updateLessonNo" class="form-control form-control-lg">
                                                            <option value="" selected>Select number of Lesson</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <label>Lesson Name</label>
                                                        <input name="lesson_name" type="text" class="form-control form-control-lg" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea name="description" rows="7" class="form-control" required></textarea>  
                                            </div>  
                                            <div class="form-row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="inputType">Type</label>
                                                        <select name="type" id="inputType" class="form-control">
                                                            <option value="" selected>Choose your lesson's type</option>
                                                            <option value="video">Video</option>
                                                            <option value="document">Document</option>
                                                            <option value="both">Document & Video</option>
                                                        </select>
                                                    </div> 
                                                </div>
                                                <div class="col-md-4" id="video" style="display: none">
                                                    <div class="form-group">
                                                        <label for="inputVideo">Video</label>
                                                        <div class="input-group mb-3">
                                                            <input type="text" name="video" class="form-control" id="inputVideo" placeholder="Paste Your URL">
                                                        </div>
                                                        <div id="videoPreview" style="display: none">
                                                            <iframe id="selectedVideo" width="200" height="112.5" src="" frameborder="0" allowfullscreen></iframe>
                                                        </div>
                                                    </div> 
                                                </div>
                                                <div class="col-md-4" id="document" style="display: none">
                                                    <div class="form-group">
                                                        <label for="inputDocument">Document</label>
                                                        <div class="input-group mb-3">
                                                            <input type="file" name="document" class="form-control" id="inputDocument">
                                                        </div>
                                                        <input type="text" id="fileDisplay" readonly style="display: none">
                                                    </div> 
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-danger btn-lg" value="Delete" id="delete_lesson_button">
                                                <input type="button" class="btn btn-success btn-lg" value="Update" id="update_lesson_button">
                                                <input type="submit" class="btn btn-success btn-lg" value="Add" id="add_lesson_button" style="display: none">
                                                <input type="button" class="btn btn-primary btn-lg" value="Reset" id="reset_lesson_button" style="display: none">
                                                <input type="submit" class="btn btn-success btn-lg" value="Save" id="save_update_lesson_button" style="display: none">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Image modal-->
        <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="descriptionModalLabel">Image</h5>
                    </div>
                    <div class="modal-body">
                        <img id="show-image" alt="Image" style="width: 100%; height: auto"/>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer End -->
        <%--<jsp:include page="footer.jsp"></jsp:include>--%>  




        <!-- JavaScript Libraries -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="template course_detail/lib/easing/easing.min.js"></script>
        <script src="template course_detail/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="template course_detail/lib/isotope/isotope.pkgd.min.js"></script>
        <script src="template course_detail/lib/lightbox/js/lightbox.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="template course_detail/mail/jqBootstrapValidation.min.js"></script>
        <script src="template course_detail/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="template course_detail/js/main.js"></script>

        <!--CRUD on DataTable & Handle Exception-->
        <script type="text/javascript">
            $(document).ready(function () {
                //Display datatable code
                var dataTableInstance = $("#coursetable").DataTable({
                    ajax: {
                        url: '/holalearn/managecourse',
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            dataTableInstance.clear().rows.add(response).draw();
                        }
                    },
                    scrollY: 700,
                    scrollX: false,
                    columns: [
                        {data: 'course_id'},
                        {data: 'course_no'
                        },
                        {data: 'course_name'
                        },
                        {data: 'image',
                            sortable: false,
                            searchable: false,
                            render: function (image) {
                                if (!image || image === null) {
                                    return 'N/A';
                                } else {
                                    return  '<div style="width: 200px; height: 200px; overflow: hidden;" class="image-detail" data-image="' + image + '">' +
                                            '<img src="data:image/jpeg;base64,' + image + '" alt="Image" style="width: 100%; height: 100%; border-radius: 5px; object-fit: cover"/> </div>';
                                }
                            }
                        }
                    ]
                });

                $('#updateChapterForm select[name=numQuestion]').on('change', function () {
                    var selectedNumberQuestion = $(this).val();
                    $.ajax({
                        url: '/holalearn/managechapter?action=changeNumQues&numQuestion=' + selectedNumberQuestion + '&chapter_id=' + selected_chapter_id,
                        type: 'GET',
                        dataType: 'json'
                    }).done(function (response) {
                        var message = JSON.parse(response.message);
                        if (message !== null) {
                            $('#numberQuesError').text(message).show();
                            $('#save_update_chapter_button').attr('disabled', 'disabled');
                        } else {
                            $('#numberQuesError').hide();
                            $('#save_update_chapter_button').removeAttr('disabled');
                        }
                    });
                });

                function isFormDataEmpty(formData, fieldsToIgnore) {
                    for (var pair of formData.entries()) {
                        var fieldName = pair[0];
                        var value = pair[1];

                        if (fieldsToIgnore.includes(fieldName)) {
                            continue;
                        }
                        if (typeof value === 'string' && value.trim() === '') {
                            return true;
                        }
                        if (value instanceof File && !value.name) {
                            return true;
                        }
                        if (value instanceof Blob && !value.size) {
                            return true;
                        }
                        if (value instanceof HTMLSelectElement && value.selectedIndex === -1) {
                            return true;
                        }
                    }
                    return false;
                }
                function isFormDataEmptyWithoutImg(formData) {
                    for (var pair of formData.entries()) {
                        var value = pair[1];
                        if (typeof value === 'string' && value.trim() === '') {
                            return true;
                        }
                        if (value instanceof HTMLSelectElement && value.selectedIndex === -1) {
                            return true;
                        }
                    }
                    return false;
                }
                $('#addLesson').click(function () {
                    $('#lessonForm')[0].reset();
                    $('.lesson-link').each(function () {
                        $(this).parent().removeClass('active');
                    });
                    var numberLesson = listLesson.filter(function (less) {
                        return less.chapter_id === selected_chapter_id;
                    }).length + 1;
                    $('#lessonForm input[name="add_lesson_no"]').val(numberLesson).attr('readonly', 'readonly');
                    $('#showAddLessonNo').show();
                    $('#showUpdateLessonNo').hide();
                    $('#lessonForm input[name="update_lesson_no"]').attr('readonly', 'readonly');
                    $('#lessonForm input[name="lesson_name"]').removeAttr('readonly');
                    $('#lessonForm textarea[name="description"]').removeAttr('readonly');
                    $('#lessonForm select[name="type"]').removeAttr('disabled');
                    $('#lessonForm input[name="video"]').removeAttr('readonly');
                    $('#lessonForm input[name="document"]').removeAttr('disabled');
                    $('#videoPreview').css('display', 'none');
                    $('#lessonForm textarea[name="description"]').text('');
                    $('#save_update_lesson_button, #reset_lesson_button, \n\
                     #update_lesson_button, #delete_lesson_button, #video, #document').hide();
                    $('#showUpLessonForm, #add_lesson_button').show();
                });
                $('#inputType').change(function () {
                    var value = $(this).val();
                    if (value === 'video') {
                        $('#inputDocument').val(null);
                    } else if (value === 'document') {
                        $('#inputVideo').val(null);
                        $('#videoPreview').css('display', 'none');
                    } else if (value === '') {
                        $('#inputDocument, #inputVideo').val(null);
                    }
                });
                $('#add_lesson_button').click(function (e) {
                    e.preventDefault();
                    var formData = new FormData($('#lessonForm')[0]);
                    var ignoreFields = ['update_lesson_no'];
                    var type = $('#inputType').val();
                    if (type === 'video') {
                        ignoreFields.push('document');
                    } else if (type === 'document') {
                        ignoreFields.push('video');
                    }
                    var isEmpty = isFormDataEmpty(formData, ignoreFields);
                    if (isEmpty) {
                        showWarningMessage('Please enter complete information in the fields', 'Warning');
                        return;
                    } else {
                        $.ajax({
                            url: '/holalearn/managelesson?chapter_id=' + selected_chapter_id,
                            type: 'POST',
                            data: formData,
                            dataType: 'json',
                            processData: false,
                            contentType: false
                        }).done(function (response) {
                            var status = JSON.parse(response.status);
                            if (status === 'Success') {
                                var insertedLesson = JSON.parse(response.insertedLesson);
                                console.log(insertedLesson);
                                listLesson.push(insertedLesson);
                                LoadListLesson(listLesson);
                                showSuccessMessage("Added lesson successfully", "Successfull");
                                LoadChapterLessons(listChapter, listLesson);
                                $('#showUpLessonForm').hide();
//                                $('#lessonForm').reset();
                            } else {
                                showErrorMessage("The lesson has not been added", "Failed");
                            }
                        });
                    }
                });

                $('#update_lesson_button').click(function () {
                    $('#lessonForm select[name="update_lesson_no"]').removeAttr('disabled');
                    $('#lessonForm input[name="lesson_name"]').removeAttr('readonly');
                    $('#lessonForm textarea[name="description"]').removeAttr('readonly');
                    $('#lessonForm select[name="type"]').removeAttr('disabled');
                    $('#lessonForm input[name="video"]').removeAttr('readonly');
                    $('#lessonForm input[name="document"]').removeAttr('disabled');
                    $('#delete_lesson_button, #update_lesson_button').hide();
                    $('#save_update_lesson_button, #reset_lesson_button').show();
                });
                function loadUpdateLessonNo(lessList) {
                    lessList.sort((a, b) => a.lesson_no - b.lesson_no);
                    var filteredLessons = lessList.filter(function (lesson) {
                        return lesson.chapter_id === selected_chapter_id;
                    });
                    var length = filteredLessons.length;
                    var options = '';
                    for (var i = 1; i <= length; i++) {
                        options += '<option value="' + i + '">' + i + '</option>';
                    }
                    $('#updateLessonNo').html(options);
                }
                $('#inputVideo').on('change', function () {
                    var inputVideo = $(this).val();
                    var videoPreview = $('#videoPreview');
                    var selectedVideo = $('#selectedVideo');

                    if (inputVideo || inputVideo !== '') {
                        // Kiểm tra xem đường dẫn có phải là đường dẫn YouTube hay không
                        videoPreview.css('display', 'block');
                        selectedVideo.attr('src', inputVideo);
                    } else {
                        videoPreview.css('display', 'none');
                        selectedVideo.attr('src', '');
                    }
                });
                function checkHasVideo() {
                    var inputVideo = $('#inputVideo').val();
                    var videoPreview = $('#videoPreview');
                    var selectedVideo = $('#selectedVideo');
                    if (inputVideo || inputVideo !== '') {
                        videoPreview.css('display', 'block');
                        selectedVideo.attr('src', inputVideo);
                    } else {
                        selectedVideo.attr('src', '');
                        videoPreview.css('display', 'none');
                    }
                }
                var currentPage;
                var selectedRow = null;
                var rowData = null;
                var listChapter = [];
                var listLesson = [];
                dataTableInstance.on('click', '.image-detail', function () {
                    var image = $(this).attr('data-image');
                    $('#show-image').attr('src', 'data:image/jpeg;base64,' + image);
                    $('#imageModal').modal('show');
                });
                $('#coursetable tbody').on('click', 'tr', function () {
                    if (selectedRow === this) {
                        // Nếu hàng đã được chọn trước đó, bỏ chọn nó
                        $(this).removeClass('selected');
                        selectedRow = null;
                        rowData = null;
                        $('#deleteCourse, #addChapter, #editCourse, #chapterlist').hide();
                        $('#addCourse').show();
                    } else {
                        // Nếu hàng chưa được chọn, chọn nó và bỏ chọn hàng trước (nếu có)
                        if (selectedRow) {
                            $(selectedRow).removeClass('selected');
                        }
                        $(this).addClass('selected');
                        selectedRow = this;
                        rowData = dataTableInstance.rows(this).data().toArray()[0];
                        $.ajax({
                            url: '/holalearn/chapterlesson?course_id=' + rowData.course_id,
                            type: 'GET',
                            dataType: 'json'
                        }).done(function (response) {
                            listChapter = JSON.parse(response.listChapter);
                            listLesson = JSON.parse(response.listLesson);
                            LoadChapterLessons(listChapter, listLesson);
                            $('#chapterlist').show();
                        });
                        $('#deleteCourse, #addChapter, #editCourse').show();
                        $('#addCourse').hide();
                    }
                    ;
                });
                function LoadListLesson(lessList) {
                    lessList.sort((a, b) => a.lesson_no - b.lesson_no);
                    var lessonItems = lessList
                            .filter(function (lesson) {
                                return lesson.chapter_id === selected_chapter_id;
                            })
                            .map(function (lesson) {
                                return '<li class="nav-item custom-nav-item">' +
                                        '<div class="nav-link lesson-link" data-lesson-id="' + lesson.lesson_id + '">Lesson ' + lesson.lesson_no + ': ' + lesson.lesson_name + '</div>' +
                                        '</li>';
                            });
                    var lessonContent = lessonItems.join('');
                    $('#lessonListNav').html(lessonContent);
                }
                function LoadChapterLessons(chapList, lessList) {
                    chapList.sort((a, b) => a.chapter_no - b.chapter_no);
                    lessList.sort((a, b) => {
                        if (a.chapter_id === b.chapter_id) {
                            return a.lesson_no - b.lesson_no;
                        }
                        return a.chapter_id - b.chapter_id;
                    });
                    var listItem = chapList.map(function (chap) {
                        var chapterContent = lessList
                                .filter(function (lesson) {
                                    return lesson.chapter_id === chap.chapter_id;
                                })
                                .map(function (lesson) {
                                    return '<div class="submenu-item">' +
                                            'Lesson ' + lesson.lesson_no + ': ' + lesson.lesson_name +
                                            '</div>';
                                })
                                .join('');
                        return '<div class="item">' +
                                '<div class="item-header row" id="heading' + chap.chapter_no + '">' +
                                '<h2 class="mb-0 col-md-10">' +
                                '<button class="btn btn-link chapter_name" type="button" data-toggle="collapse"' +
                                'data-target="#collapse' + chap.chapter_no + '" aria-expanded="true" aria-controls="collapse' + chap.chapter_no + '">' +
                                'Chapter ' + chap.chapter_no + ': ' + chap.chapter_name +
                                '<i class="fa fa-angle-down"></i>' +
                                '</button>' +
                                '</h2>' +
                                '<button class="btn btn-primary col-md-2" data-id="' + chap.chapter_id + '" id="chapterlesson_detail">Custom Button</button>' +
                                '</div>' +
                                '<div id="collapse' + chap.chapter_no + '" class="collapse" aria-labelledby="heading' + chap.chapter_no + '"' +
                                'data-parent="#accordionExample">' +
                                '<div class="t-p">' +
                                '<div class="submenu">' +
                                chapterContent +
                                '</div></div></div></div>';
                    }).join('');
                    $('#accordionExample').html(listItem);
                }
                $('#updateChapterForm input[name="chapter_no"]').on('input', function () {
                    var chapter_no = $(this).val();
                    var lengthListChapter = listChapter.length;
                    if (chapter_no <= 0 || chapter_no > lengthListChapter) {
                        $(this).val('');
                    }
                });
                var selected_chapter_id = null;
                var numOfQues = null;
                $('#accordionExample').on('click', '#chapterlesson_detail', function () {
                    selected_chapter_id = $(this).data('id');
                    $.ajax({
                        url: '/holalearn/managechapter?chapter_id=' + selected_chapter_id + '&action=getNumberQues',
                        type: 'GET',
                        dataType: 'json'
                    }).done(function (response) {
                        numOfQues = response.numOfQues;
                        $('#updateChapterForm select[name="numQuestion"]').val(numOfQues);
                    });
                    var selectedChapter = listChapter.filter(function (chap) {
                        return chap.chapter_id === selected_chapter_id;
                    });
                    $('#updateChapterForm input[name="chapter_no"]').val(selectedChapter[0].chapter_no);
                    $('#updateChapterForm input[name="chapter_name"]').val(selectedChapter[0].chapter_name);
                    $('#updateChapterForm input[name="chapter_no"]').attr('readonly', 'readonly');
                    $('#updateChapterForm select[name="numQuestion"]').attr('disabled', 'disabled');
                    $('#updateChapterForm input[name="chapter_name"]').attr('readonly', 'readonly');
                    $('#delete_chapter_button, #update_chapter_button').show();
                    $('#save_update_chapter_button, #reset_chapter_button, #numberQuesError').hide();
                    LoadListLesson(listLesson);
                    $('#manageChapterLessonModal').modal('show');
                });
                $('#manage_chapterlesson_close-button').on('click', function () {
                    $('#lessonForm')[0].reset();
                    $('#showUpLessonForm').hide();
                    $('#manageChapterLessonModal').modal('hide');
                });
                $('#delete_chapter_button').click(function (e) {
                    e.preventDefault();
                    var confirmation = window.confirm("Are you sure you want to delete this chapter?");
                    if (confirmation) {
                        $.ajax({
                            url: '/holalearn/managechapter?chapter_id=' + selected_chapter_id,
                            type: 'DELETE',
                            dataType: 'json'
                        }).done(function (response) {
                            var status = JSON.parse(response.status);
                            if (status === 'Success') {
                                showSuccessMessage("Delete chapter successfully", "Successfull");
                                listChapter = listChapter.filter(function (chap) {
                                    return chap.chapter_id !== selected_chapter_id;
                                });
                                $('#manageChapterLessonModal').modal('hide');
                                LoadChapterLessons(listChapter, listLesson);
                            } else {
                                showErrorMessage("The chapter has not been deleted", "Failed");
                            }
                        });
                    }
                });
                $('#reset_chapter_button').click(function () {
                    var selectedChapter = listChapter.filter(function (chap) {
                        return chap.chapter_id === selected_chapter_id;
                    });
                    $('#updateChapterForm input[name="chapter_no"]').val(selectedChapter[0].chapter_no);
                    $('#updateChapterForm select[name="numQuestion"]').val(numOfQues);
                    $('#updateChapterForm input[name="chapter_name"]').val(selectedChapter[0].chapter_name);
                    $('#save_update_chapter_button').removeAttr('disabled');
                    $('#numberQuesError').text('').hide();
                });
                $('#update_chapter_button').on('click', function () {
                    $('#updateChapterForm input[name="chapter_no"]').removeAttr('readonly');
                    $('#updateChapterForm input[name="chapter_name"]').removeAttr('readonly');
                    $('#updateChapterForm select[name="numQuestion"]').removeAttr('disabled');
                    $('#delete_chapter_button, #update_chapter_button').hide();
                    $('#save_update_chapter_button, #reset_chapter_button').show();
                });
                $('#save_update_chapter_button').on('click', function (e) {
                    e.preventDefault();
                    var formData = new FormData($('#updateChapterForm')[0]);
                    formData.append('chapter_id', selected_chapter_id);
                    var ignoreFiels = [];
                    var isEmpty = isFormDataEmpty(formData, ignoreFiels);
                    if (isEmpty) {
                        showWarningMessage('Please enter complete information in the fields', 'Warning');
                    } else {
                        $.ajax({
                            url: '/holalearn/managechapter',
                            type: 'PUT',
                            dataType: 'json',
                            data: formData,
                            processData: false,
                            contentType: false
                        }).done(function (response) {
                            var status = JSON.parse(response.status);
                            if (status === 'Success') {
                                var updatedChapter = JSON.parse(response.updatedChapter);
                                $('#updateChapterForm input[name="chapter_name"]').val(updatedChapter.chapter_name);
                                $('#updateChapterForm input[name="chapter_no"]').val(updatedChapter.chapter_no);
                                var selected = $('#updateChapterForm select[name="numQuestion"]').val();
                                $('#updateChapterForm select[name="numQuestion"]').val(selected);
                                $('#updateChapterForm input[name="chapter_no"]').attr('readonly', 'readonly');
                                $('#updateChapterForm input[name="chapter_name"]').attr('readonly', 'readonly');
                                $('#updateChapterForm select[name="numQuestion"]').attr('disabled', 'disabled');
                                $('#delete_chapter_button, #update_chapter_button').show();
                                $('#save_update_chapter_button, #reset_chapter_button, #numberQuesError').hide();
                                showSuccessMessage("Updated chapter successfully", "Successfull");
                                listChapter = listChapter.map(function (chap) {
                                    if (chap.chapter_id === selected_chapter_id) {
                                        return updatedChapter;
                                    }
                                    return chap;
                                });
                                LoadChapterLessons(listChapter, listLesson);
                            } else {
                                showErrorMessage("The chapter has not been updated", "Failed");
                            }
                        });
                    }
                });
                $('#editCourse').on('click', function () {
                    $('#editCourseForm input[name="course_no"]').val(rowData.course_no);
                    $('#editCourseForm input[name="course_name"]').val(rowData.course_name);
                    $('#edit_image').attr('src', 'data:image/jpeg;base64,' + rowData.image);
                    $('#editCourseModal').modal('show');
                });
                $('#edit_course_button').click(function (e) {
                    e.preventDefault();
                    currentPage = dataTableInstance.page();
                    var formData = new FormData($('#editCourseForm')[0]);
                    var isEmpty = isFormDataEmptyWithoutImg(formData);
                    if (isEmpty) {
                        showWarningMessage('Please enter complete information in the fields', 'Warning');
                        return;
                    } else {
                        $.ajax({
                            url: '/holalearn/managecourse?course_id=' + rowData.course_id,
                            type: 'PUT',
                            dataType: 'json',
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function (response) {
                                var status = response.status;
                                if (status === 'Update successful') {
                                    showSuccessMessage('Successfully updated course', 'Successfull');
                                } else {
                                    showErrorMessage('Course update failed', 'Failed');
                                }
                                dataTableInstance.ajax.reload(function () {
                                    dataTableInstance.page(currentPage).draw('page');
                                });
                                $('#deleteCourse, #addChapter, #editCourse, #chapterlist').hide();
                                $('#addCourse').show();
                                $('#editCourseModal').modal('hide');
                            }
                        });
                    }
                });
                $('#deleteCourse').click(function () {
                    $('#deleteCourseModal').modal('show');
                });
                $('#delete_course_button').click(function (e) {
                    e.preventDefault();
                    currentPage = dataTableInstance.page();
                    $.ajax({
                        url: '/holalearn/managecourse?course_id=' + rowData.course_id,
                        type: 'delete',
                        dataType: 'json',
                        success: function (response) {
                            var status = response.status;
                            if (status === "Successfull") {
                                showSuccessMessage('Successfully deleted the course', 'Successfull');
                                dataTableInstance.ajax.reload(function () {
                                    dataTableInstance.page(currentPage).draw('page');
                                });
                                $('#deleteCourse, #addChapter, #editCourse, #chapterlist').hide();
                                $('#addCourse').show();
                                $('#deleteCourseModal').modal('hide');
                            } else {
                                showErrorMessage("The course cannot be deleted", 'Failed');
                            }
                        }
                    });
                });
                $('#addChapter').click(function () {
                    $('#addChapterForm')[0].reset();
                    $('#addChapterForm input[name="chapter_no"]').val(listChapter.length + 1);
                    $('#addChapterModal').modal('show');
                });
                $('#addChapterForm input[name="chapter_no"]').on('input', function () {
                    var value = parseInt($(this).val());
                    if (value === listChapter.length + 1) {
                        return;
                    } else {
                        $(this).val('');
                    }
                });
                $('#add_chapter_button').click(function (e) {
                    e.preventDefault();
                    var formData = new FormData($('#addChapterForm')[0]);
                    formData.append('course_id', rowData.course_id);
                    var ignoreFields = [];
                    var isEmpty = isFormDataEmpty(formData, ignoreFields);
                    if (isEmpty) {
                        showWarningMessage('Please enter complete information in the fields', 'Warning');
                    } else {
                        $.ajax({
                            url: '/holalearn/managechapter',
                            type: 'POST',
                            dataType: 'json',
                            data: formData,
                            processData: false,
                            contentType: false
                        }).done(function (response) {
                            var status = JSON.parse(response.status);
                            if (status === 'Success') {
                                var insertedChapter = JSON.parse(response.insertedChapter);
                                listChapter.push(insertedChapter);
                                LoadChapterLessons(listChapter, listLesson);
                                showSuccessMessage("Added chapter successfully", "Successfull");
                                $('#addChapterModal').modal('hide');
                            } else {
                                showErrorMessage("The chapter has not been added", "Failed");
                            }
                        });
                    }
                });
                var MaxCourseNo = -1;
                $('#editCourseForm input[name="course_no"]').on('input', function () {
                    var value = parseInt($(this).val());
                    if (value >= 1 && value <= MaxCourseNo) {
                        $(this).val(value);
                    } else {
                        $(this).val('');
                    }
                });
                $('#addCourse').click(function () {
                    $('#addCourseForm')[0].reset();
                    var data = dataTableInstance.rows().data();
                    if(data.length === 0){
                        MaxCourseNo = 0;
                    }
                    data.each(function (value) {
                        var courseNo = value.course_no;
                        console.log(courseNo);
                        console.log(MaxCourseNo);
                        if (courseNo > MaxCourseNo) {
                            MaxCourseNo = courseNo;
                        }
                        console.log(MaxCourseNo);
                    });
                    $('#addCourseForm input[name="course_no"]').val(MaxCourseNo + 1);
                    $('#addCourseModal').modal('show');
                });
                $('#addCourseForm input[name="course_no"]').on('input', function () {
                    var value = parseInt($(this).val());
                    if (value !== MaxCourseNo + 1) {
                        $(this).val('');
                    } else {
                        return;
                    }
                });
                $('#add_course_button').click(function (e) {
                    e.preventDefault();
                    currentPage = dataTableInstance.page();
                    var formData = new FormData($('#addCourseForm')[0]);
                    var ignoreFields = [];
                    var isEmpty = isFormDataEmpty(formData, ignoreFields);
                    if (isEmpty) {
                        showWarningMessage('Please enter complete information in the fields', 'Warning');
                    } else {
                        $.ajax({
                            url: '/holalearn/managecourse',
                            type: 'POST',
                            dataType: 'json',
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function (response) {
                                var status = response.status;
                                console.log(status);
                                if (status === 'Thanh Cong') {
                                    showSuccessMessage("Added course successfully", "Successfull");
                                } else {
                                    showErrorMessage("The course has not been added", "Failed");
                                }
                                dataTableInstance.ajax.reload(function () {
                                    dataTableInstance.page(currentPage).draw('page');
                                });
                                $('#addCourseModal').modal('hide');
                                $('#addCourseForm')[0].reset();
                            }
                        });
                    }
                });
                $('#lessonListNav').on('click', '.lesson-link', function () {

                    var parent = $(this).parent();
                    if (parent.hasClass('active')) {
                        parent.fadeTo(100, 0.2, function () {
                            parent.removeClass("active");
                            $('#showUpLessonForm').hide();
                            parent.fadeTo(100, 1);
                        });
                    } else {
                        $('.lesson-link').each(function () {
                            $(this).parent().removeClass('active');
                        });
                        parent.fadeTo(100, 0.2, function () {
                            loadUpdateLessonNo(listLesson);
                            fillLessonInfo($(this), listLesson);
                            checkHasVideo();
                            $('#showAddLessonNo').hide();
                            $('#showUpdateLessonNo').show();
                            $('#lessonForm input[name="add_lesson_no"]').attr('readonly', 'readonly');
                            $('#lessonForm select[name="update_lesson_no"]').attr('disabled', 'disabled');
                            $('#lessonForm input[name="lesson_name"]').attr('readonly', 'readonly');
                            $('#lessonForm textarea[name="description"]').attr('readonly', 'readonly');
                            $('#lessonForm select[name="type"]').attr('disabled', 'disabled');
                            $('#lessonForm input[name="video"]').attr('readonly', 'readonly');
                            $('#lessonForm input[name="document"]').prop('disabled', true);
                            $('#add_lesson_button, #save_update_lesson_button, #reset_lesson_button').hide();
                            $('#showUpLessonForm, #update_lesson_button, #delete_lesson_button').show();
                            parent.addClass("active");
                            parent.fadeTo(100, 1);
                        });
                    }
                });
                $('#inputDocument').change(function () {
                    $('#fileDisplay').hide();
                });
                $('#save_update_lesson_button').click(function (e) {
                    e.preventDefault();
                    var formData = new FormData($('#lessonForm')[0]);
                    formData.append('lesson_id', selected_lesson_id);
                    var ignoreFields = ['add_lesson_no'];
                    var type = $('#inputType').val();
                    if (type === 'video') {
                        ignoreFields.push('document');
                    } else if (type === 'document') {
                        ignoreFields.push('video');
                    } else if (type === 'both') {
                        ignoreFields.push('document');
                        formData.append('documentpath', selectedLesson[0].document);
                    }
                    var isEmpty = isFormDataEmpty(formData, ignoreFields);
                    if (isEmpty) {
                        showWarningMessage('Please enter complete information in the fields', 'Warning');
                        return;
                    } else {
                        $.ajax({
                            url: '/holalearn/managelesson',
                            type: 'PUT',
                            data: formData,
                            dataType: 'json',
                            processData: false,
                            contentType: false
                        }).done(function (response) {
                            var status = JSON.parse(response.status);
                            if (status === 'Success') {
                                var updatedLesson = JSON.parse(response.updatedLesson);
                                console.log(updatedLesson);
                                listLesson = listLesson.map(function (les) {
                                    if (les.lesson_id === selected_lesson_id) {
                                        return updatedLesson;
                                    }
                                    return les;
                                });
                                LoadListLesson(listLesson);
                                LoadChapterLessons(listChapter, listLesson);
                                $('#update_lesson_button, #delete_lesson_button').show();
                                $('#save_update_lesson_button, #reset_lesson_button').hide();
                                $('#lessonForm input[name="lesson_no"]').attr('readonly', 'readonly');
                                $('#lessonForm input[name="lesson_name"]').attr('readonly', 'readonly');
                                $('#lessonForm textarea[name="description"]').attr('readonly', 'readonly');
                                $('#lessonForm select[name="type"]').attr('disabled', 'disabled');
                                $('#lessonForm input[name="video"]').attr('readonly', 'readonly');
                                $('#lessonForm input[name="document"]').prop('disabled', true);
                                $('#add_lesson_button, #save_update_lesson_button, #reset_lesson_button, #showUpLessonForm, #fileDisplay').hide();
                                $('#update_lesson_button, #delete_lesson_button').show();
                                showSuccessMessage("Updated lesson successfully", "Successfull");
                            } else {
                                showErrorMessage("The lesson has not been updated", "Failed");
                            }
                        });
                    }
                });
                $('#delete_lesson_button').click(function (e) {
                    e.preventDefault();
                    var confirmation = window.confirm("Are you sure you want to delete this lesson?");
                    if (confirmation) {
                        $.ajax({
                            url: '/holalearn/managelesson?lesson_id=' + selected_lesson_id,
                            type: 'DELETE',
                            dataType: 'json'
                        }).done(function (response) {
                            var status = JSON.parse(response.status);
                            console.log(status);
                            if (status === 'Successfull') {
                                showSuccessMessage("Delete lesson successfully", "Successfull");
                                listLesson = listLesson.filter(function (lesson) {
                                    return lesson.lesson_id !== selected_lesson_id;
                                });
                                $('#showUpLessonForm').hide();
                                LoadListLesson(listLesson);
                                LoadChapterLessons(listChapter, listLesson);
                                selected_lesson_id = null;
                            } else {
                                showErrorMessage("The lesson has not been deleted", "Failed");
                            }
                        });
                    }
                });
                var selected_lesson_id;
                var selectedLesson = [];
                function fillLessonInfo(param, lesList) {
                    selected_lesson_id = param.children().data('lesson-id');
                    selectedLesson = lesList.filter(function (les) {
                        return  selected_lesson_id === les.lesson_id;
                    });
                    $('input[name="add_lesson_no"]').val(selectedLesson[0].lesson_no);
                    $('select[name="update_lesson_no"]').val(selectedLesson[0].lesson_no);
                    $('input[name="lesson_name"]').val(selectedLesson[0].lesson_name);
                    $('textarea[name="description"]').text(selectedLesson[0].description);
                    $('input[name="video"]').val(selectedLesson[0].video);
                    var filePath = selectedLesson[0].document;
                    if (filePath) {
                        var pathParts = filePath.split("/");
                        var fileName = pathParts[pathParts.length - 1];
                    }
                    $('#fileDisplay').val(fileName);
                    if (selectedLesson[0].video && selectedLesson[0].document) {
                        $('select[name="type"]').val('both');
                        $('#video, #document, #fileDisplay').show();
                    } else if (!selectedLesson[0].video && selectedLesson[0].document) {
                        $('select[name="type"]').val('document');
                        $('#document, #fileDisplay').show();
                        $('#video').hide();
                    } else if (selectedLesson[0].video && !selectedLesson[0].document) {
                        $('select[name="type"]').val('video');
                        $('#document').hide();
                        $('#video').show();
                    } else {
                        $('select[name="type"]').val('');
                        $('#video, #document, #fileDisplay').hide();
                    }
                }
                $('#reset_lesson_button').click(function () {
                    var selectedLesson = listLesson.filter(function (les) {
                        return  selected_lesson_id === les.lesson_id;
                    });
                    $('select[name="update_lesson_no"]').val(selectedLesson[0].lesson_no);
                    $('input[name="lesson_name"]').val(selectedLesson[0].lesson_name);
                    $('textarea[name="description"]').val(selectedLesson[0].description);
                    $('input[name="video"]').val(selectedLesson[0].video);
                    checkHasVideo();
                    var filePath = selectedLesson[0].document;
                    if (filePath) {
                        var pathParts = filePath.split("/");
                        var fileName = pathParts[pathParts.length - 1];
                    }
                    $('#fileDisplay').val(fileName);
                    if (selectedLesson[0].video && selectedLesson[0].document) {
                        $('select[name="type"]').val('both');
                        $('#video, #document, #fileDisplay').show();
                    } else if (!selectedLesson[0].video && selectedLesson[0].document) {
                        $('select[name="type"]').val('document');
                        $('#document, #fileDisplay').show();
                        $('#video').hide();
                    } else if (selectedLesson[0].video && !selectedLesson[0].document) {
                        $('select[name="type"]').val('video');
                        $('#document').hide();
                        $('#video').show();
                    } else {
                        $('select[name="type"]').val('');
                        $('#video, #document, #fileDisplay').hide();
                    }
                });
                $('#inputType').change(function () {
                    var value = $(this).val();
                    if (value === 'both') {
                        $('#inputVideo, #inputDocument').val('');
                        $('#video, #document').show();
                        $('#fileDisplay').val('');
                        $('#videoPreview').hide();
                    } else if (value === 'video') {
                        $('#inputVideo, #inputDocument').val('');
                        checkHasVideo();
                        $('#video').show();
                        $('#document').hide();
                        $('#fileDisplay').val('');
                        $('#videoPreview').hide();
                    } else if (value === 'document') {
                        $('#inputVideo, #inputDocument').val('');
                        $('#document').show();
                        $('#video').hide();
                        $('#fileDisplay').val('');
                        $('#videoPreview').hide();
                    } else {
                        $('#video, #document').hide();
                        $('#fileDisplay').val('');
                        $('#videoPreview').hide();
                    }
                });
                $('#edit_cancel-button').click(function () {
                    $('#editCourseModal').modal('hide');
                });
                $('#edit_close-button').click(function () {
                    $('#editCourseModal').modal('hide');
                });
                $('#add_cancel-button').click(function () {
                    $('#addCourseModal').modal('hide');
                });
                $('#add_close-button').click(function () {
                    $('#addCourseModal').modal('hide');
                });
                $('#add_chapter_cancel-button').click(function () {
                    $('#addChapterModal').modal('hide');
                });
                $('#add_chapter_close-button').click(function () {
                    $('#addChapterModal').modal('hide');
                });
                $('#delete_cancel-button').click(function () {
                    $('#deleteCourseModal').modal('hide');
                });
                $('#delete_close-button').click(function () {
                    $('#deleteCourseModal').modal('hide');
                });
                function showSuccessMessage(message, title) {
                    toastr.success(message, title, {showMethod: 'slideDown',
                        hideMethod: 'slideUp'});
                }
                function showErrorMessage(message, title) {
                    toastr.error(message, title, {showMethod: 'slideDown',
                        hideMethod: 'slideUp'});
                }
                function showWarningMessage(message, title) {
                    toastr.warning(message, title, {showMethod: 'slideDown',
                        hideMethod: 'slideUp'});
                }
                toastr.options = {
                    preventDuplicates: true,
                    closeButton: true, // Hiển thị nút đóng thông báo
                    progressBar: true, // Hiển thị thanh tiến trình
                    positionClass: "toast-top-right", // Vị trí hiển thị thông báo
                    timeOut: 2500 // Thời gian tự động ẩn thông báo (2.5 giây)
                };
            });
        </script>
    </body>

</html>
