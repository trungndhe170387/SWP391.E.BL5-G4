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
        <link rel="stylesheet" href="template learningenvironment/style.css" />
        <link href="template subject_detail/css/style.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Bootstrap CSS -->
       
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
                <div class="content" id="content">
                    <hr>
                    <div class="ttr-post-title ">
                        <h2 class="post-title">Lesson ${lesson.lesson_no}. ${lesson.lesson_name}</h2>
                </div>
                <hr>
                <h3 style="font-size: 24px; color: #333;">A. Video Lesson <i class="fa fa-youtube-play fa-fw"></i></h3>
                <hr>
                <div class="row">
                    <div style="position: relative; padding-bottom: 56.25%; height: 0;">

                        <iframe width="1000" height="400" src="${lesson.video}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    </div>
                </div>
                <div >
                    <a href="/holalearn/downloadlearningpdf?filename=${lesson.document}" 
                       style="background:#333; color:#fff; padding:10px 20px; text-decoration:none; border-radius:4px;"> <i style="margin-right:5px;" class="fa fa-file-pdf-o"></i>
                        Download PDF </a>
                </div>

                <hr>

                <div class="row column">
                    <h3 style="font-size: 24px; color: #333;">B. Document Lesson <i class="fa fa-file fa-fw"></i></h3>
                </div>
                <hr>
                <div class="row">
                    <div class="large-8 columns" style="border-right: 1px solid #E3E5E8;">

                        <article>

                            <div class="row">
                                <div class="large-6 columns">

                                </div>
                                <div class="large-6 columns">
                                    <h5><a href="#">Lesson ${lesson.lesson_no}. ${lesson.lesson_name} </a></h5>
                                    <p>
                                        <span><i class="fi-torso">🖋 ${account.fullname} &nbsp;&nbsp;</i></span>
                                        <span><i class="fi-calendar"> ${subject.created_date} &nbsp;&nbsp;</i></span>

                                    </p>
                                    <p>🔖&nbsp; ${lesson.description}</p>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
                <form action="done" method="get">
                    <input type="hidden" name="subject_id" value="${subject.subject_id}">
                    <input type="hidden" name="course_id" value="${course.course_id}">
                    <input type="hidden" name="chapter_id" value="${chapter_id}">
                    <input type="hidden" name="lesson_id" value="${lesson.lesson_id}">
                    <input type="hidden" name="category_id" value="${category_id}">
                    <div style="padding: 100px 0;">
                        <button class="btn btn-sm btn-primary pull-right" type="submit"><i class="fa fa-check fa-fw"></i>Mark As Done</button>

                    </div>
                </form>
                <hr>               
                <div class="row column">
                    <h4 style="font-size: 24px; color: #333;">Comment</h4>
                </div>
                <div class="container bootdey">
                    <div class="col-md-12 bootstrap snippets">
                        <form action="" id="add-comment-form">
                            <input type="hidden" id="lesson_id" name="lesson_id" value="${lesson.lesson_id}">
                            <input type="hidden" id="account_id" name="account_id" value="${sessionScope.account.account_id}">
                            <div class="panel">
                                <div class="panel-body">
                                    <textarea class="form-control" id="lesson_comment"  rows="2" placeholder="What are you thinking?"></textarea>
                                    <div class="mar-top clearfix">
                                        <button class="btn btn-sm btn-primary pull-right" type="submit"><i class="fa fa-pencil fa-fw"></i> Share</button>
                                        <a class="btn btn-trans btn-icon fa fa-video-camera add-tooltip" href="#"></a>
                                        <a class="btn btn-trans btn-icon fa fa-camera add-tooltip" href="#"></a>
                                        <a class="btn btn-trans btn-icon fa fa-file add-tooltip" href="#"></a>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class=""  style="float:left">
                            <div class="">
                                <div class="media-block">
                                    <div id="listcomment">


                                    </div>
                                </div>
                            </div>
                            <button style="margin-bottom: 50px;" id="showmore" class="btn btn-sm btn-primary pull-left mx-4" type="submit"><i class="fa-fw"></i> Show More</button>

                            <button style="margin-bottom: 50px;" id="showless" class="btn btn-sm btn-primary pull-left" type="submit"><i class="fa-fw"></i> Show Less</button>

                        </div>
                    </div>
                    <input type="hidden" class="totalcmt" id="totalcmt" value="${totalofcmt}">    
                    <div id="reportPopup" class="popup modal fade" tabindex="-1" role="dialog" >
                        <div class="modal-dialog">
                            <div class="modal-content mx-auto w-100">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Chọn lý do báo cáo</h4>
                                    <button type="button" class="close" id="close-button" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>
                                            <input type="radio" name="reportReason"  value="Nội dung rác hoặc nội dung bạn không mong muốn"> 
                                            <span style="display: inline-block; margin-right: 10px;">Nội dung rác hoặc nội dung bạn không mong muốn</span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            <input type="radio" name="reportReason"  value="Tài liệu khiêu dâm hoặc phim khiêu dâm"> 
                                            <span style="display: inline-block; margin-right: 10px;">Tài liệu khiêu dâm hoặc phim khiêu dâm</span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            <input type="radio" name="reportReason"  value="Xâm hại trẻ em"> 
                                            <span style="display: inline-block; margin-right: 10px;">Xâm hại trẻ em</span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            <input type="radio" name="reportReason" value="Lời nói căm thù hoặc hình ảnh bạo lực"> 
                                            <span style="display: inline-block; margin-right: 10px;">Lời nói căm thù hoặc hình ảnh bạo lực</span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            <input type="radio" name="reportReason"  value="Nội dung quảng bá chủ nghĩa khủng bố"> 
                                            <span style="display: inline-block; margin-right: 10px;">Nội dung quảng bá chủ nghĩa khủng bố</span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            <input type="radio" name="reportReason"  value="Nội dung quấy rối hoặc bắt nạt"> 
                                            <span style="display: inline-block; margin-right: 10px;">Nội dung quấy rối hoặc bắt nạt</span>
                                        </label>
                                    </div>
                                    <div class "form-group">
                                        <label>
                                            <input type="radio" name="reportReason"  value="Tự tử hoặc tự gây thương tích"> 
                                            <span style="display: inline-block; margin-right: 10px;">Tự tử hoặc tự gây thương tích</span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            <input type="radio" name="reportReason"  value="Thông tin sai lệch"> 
                                            <span style="display: inline-block; margin-right: 10px;">Thông tin sai lệch</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" id="cancel-button" value="Cancel">
                                    <input type="submit" class="btn btn-success" value="Submit" id="submitReport">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
            <hr>
        </div>
        <script src="template learningenvironment/script.js"></script>
        <script src="assets/js/comment.js"></script>        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>




    </body>

</html>
