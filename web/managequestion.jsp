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

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Handlee&family=Nunito&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Flaticon Font -->
        <link href="template course_detail/lib/flaticon/font/flaticon.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="template course_detail/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="template course_detail/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="template course_detail/css/style.css" rel="stylesheet">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/dataTables.jqueryui.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <style>
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
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
            #scrollFilter{
                width:500px;
                height:700px;
                overflow-x:hidden;
                overflow-y:auto;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header2.jsp"></jsp:include>  

            <div style="display: flex">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="lecturersubject"><h2>Back to <b>Subject list</b></h2></a>
                                </div>
                                <div class="col-sm-6">
                                    <a onclick="deleteQuestion()" class="btn btn-danger" ><i class="material-icons"></i> <span>Delete Choosen Questions</span></a>
                                    <a onclick="notify()" href="#importquestion" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>IMPORT FILE QUESTIONS</span></a>
                                    <a onclick="" href="#addOneQuestion" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>ADD 1 QUESTION</span></a>
                                </div>
                            </div>
                        </div>
                        <div style="display: flex" class="row">
                            <div class="col-md-4">
                                <h1>Filter</h1>
                                <input checked onclick="getAllQuestion()" type="radio" name="course"/><span style="font-weight: bold; font-size: 15px; ">All Questions</span><br/>
                                <div id="scrollFilter">
                                <c:forEach items="${listCourse}" var="c">
                                    <input onclick="addDataCourse()" type="radio" name="course" class="course" value="${c.course_id}">
                                    <span style="font-weight: bold; font-size: 15px; ">Course ${c.course_no}: ${c.course_name}</span><br>
                                    <c:forEach items="${listChapter}" var="ch">
                                        <c:if test="${ch.course_id == c.course_id}">
                                            <input onclick="addDataChapter()" style="margin-left: 20px" type="checkbox" 
                                                   name="chapter" value="${ch.chapter_id}">&nbsp;&nbsp;&nbsp; Chapter ${ch.chapter_no}: ${ch.chapter_name}<br>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </div>

                        </div>
                        <input id="subject_id" type="hidden" value="${subject_id}"/>
                        <!--Start Table-->
                        <div class="col-md-8">
                            <table style="width: 100%" id="questiontable" class=" table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Chapter</th>
                                        <th>Content</th>
                                        <th>Option 1</th>
                                        <th>Option 2</th>
                                        <th>Option 3</th>
                                        <th>Option 4</th>
                                        <th>Answer</th>
                                        <th>Level</th>
                                        <th>Edit</th>
                                        <th>Choose</th>
                                    </tr>
                                </thead>

                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Chapter</th>
                                        <th>Content</th>
                                        <th>Option 1</th>
                                        <th>Option 2</th>
                                        <th>Option 3</th>
                                        <th>Option 4</th>
                                        <th>Answer</th>
                                        <th>Level</th>
                                        <th>Edit</th>
                                        <th>Choose</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!--End Table-->
                    </div>
                </div>
            </div>        
        </div>

        <!--Form add 1 question-->
        <div id="addOneQuestion" class="modal fade">
            <div style="max-width: 1400px" class="modal-dialog" >
                <div class="modal-content">
                    <form id="oq" action="addonequestion" method="post">
                        <input name="id" type="hidden" value="${subject_id}"/>
                        <div class="modal-header">						
                            <h4 class="modal-title">Add 1 Question to Chapter</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="row modal-body">	
                            <div class="col-md-5">
                                <h3>Choose chapter to import</h3>
                                <c:forEach items="${listCourse}" var="c">
                                    <span style="font-weight: bold; font-size: 15px; ">Course ${c.course_no}: ${c.course_name}</span><br>
                                    <c:forEach items="${listChapter}" begin="0" end="0" var="ch">
                                        <c:if test="${ch.course_id == c.course_id}">
                                            <input checked style="margin-left: 20px" type="radio" 
                                                   name="questionChapter" value="${ch.chapter_id}">&nbsp;&nbsp;&nbsp; Chapter ${ch.chapter_no}: ${ch.chapter_name}<br>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${listChapter}" begin="1" var="ch">
                                        <c:if test="${ch.course_id == c.course_id}">
                                            <input style="margin-left: 20px" type="radio" 
                                                   name="questionChapter" value="${ch.chapter_id}">&nbsp;&nbsp;&nbsp; Chapter ${ch.chapter_no}: ${ch.chapter_name}<br>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </div>  
                            <!--Question Detail-->
                            <div class="col-md-7 form-group">
                                <div class="form-group">
                                    <label>Content</label>
                                    <input id="oq-content" name="content" type="text" class="form-control" value="" required>
                                </div>
                                <div class="form-group">
                                    <label>Option 1</label>
                                    <input oninput="getValidOption()" id="oq-op1" name="op1" type="text" class="option form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Option 2</label>
                                    <input oninput="getValidOption()" id="oq-op2" name="op2" type="text" class="option form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Option 3</label>
                                    <input oninput="getValidOption()" id="oq-op3" name="op3" type="text" class="option form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Option 4</label>
                                    <input oninput="getValidOption()" id="oq-op4" name="op4" type="text" class="option form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Answer</label>
                                    <select id="answer" name="answer">
                                        <option id="select-op-0" style="display: none;" value="0">Choose option</option>
                                        <option id="select-op-1" style="display: none;" value="1">Option 1</option>
                                        <option id="select-op-2" style="display: none;" value="2">Option 2</option>
                                        <option id="select-op-3" style="display: none;" value="3">Option 3</option>
                                        <option id="select-op-4" style="display: none;" value="4">Option 4</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Level</label>
                                    <select name="level">
                                        <option selected value="1">Easy</option>
                                        <option value="2">Medium</option>
                                        <option value="3">Hard</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input id="cancelAddOneQuestion" type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input onclick="add1Question()" type="" value="ADD" class="btn btn-success">
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <!--End form add 1 question-->

        <!--form import question-->
        <div id="importquestion" class="modal fade">
            <div style="max-width: 600px" class="modal-dialog">
                <div class="modal-content">
                    <form id="fq" action="" method="post" enctype="multipart/form-data">
                        <input id="subject_id" name="id" type="hidden" value="${subject_id}"/>
                        <div class="modal-header">						
                            <h4 class="modal-title">Import Questions to Chapter</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <a href="/holalearn/download">
                            <p style="width: 100%; text-align: center" onclick="" class="btn btn-success">Click here to download Template to Import Questions</p>
                        </a>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>File Question</label>
                                <input id="questionFile" type="file" class="form-control" name="fileQuestion" required>
                            </div>
                            <c:forEach items="${listCourse}" var="c">
                                <span style="font-weight: bold; font-size: 15px; ">Course ${c.course_no}: ${c.course_name}</span><br>
                                <c:forEach items="${listChapter}" begin="0" end="0" var="ch">
                                    <c:if test="${ch.course_id == c.course_id}">
                                        <input checked style="margin-left: 20px" type="radio" 
                                               name="questionChapter" value="${ch.chapter_id}">&nbsp;&nbsp;&nbsp; Chapter ${ch.chapter_no}: ${ch.chapter_name}<br>
                                    </c:if>
                                </c:forEach>
                                <c:forEach items="${listChapter}" begin="1" var="ch">
                                    <c:if test="${ch.course_id == c.course_id}">
                                        <input style="margin-left: 20px" type="radio" 
                                               name="questionChapter" value="${ch.chapter_id}">&nbsp;&nbsp;&nbsp; Chapter ${ch.chapter_no}: ${ch.chapter_name}<br>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </div>
                        <div class="modal-footer">
                            <input id="cancelImport" type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input onclick="importQuestion()" type="" class="btn btn-success" value="IMPORT">

                        </div>
                        <div class="text-danger" id="errorRow">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Edit Modal HTML -->
        <div id="edit">

        </div>

        <!-- Edit Modal HTML -->

        <!-- Delete Modal HTML -->
        <%--<jsp:include page="footer.jsp"></jsp:include>--%>  
        <!-- Footer End -->


        <!-- Back to Top -->
        <!--<a href="#" class="btn btn-primary p-3 back-to-top"><i class="fa fa-angle-double-up"></i></a>-->


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="template course_detail/lib/easing/easing.min.js"></script>
        <script src="template course_detail/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="template course_detail/lib/isotope/isotope.pkgd.min.js"></script>
        <script src="template course_detail/lib/lightbox/js/lightbox.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

        <!-- Contact Javascript File -->

        <!-- Template Javascript -->
        <script src="template course_detail/js/main.js"></script>


        <!--JavaScript DataTable-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script src="js/listquestionbysubject.js" type="text/javascript"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.13.6/js/dataTables.jqueryui.min.js"></script>

        <script type="text/javascript">

                                let subjectId = document.getElementById("subject_id").value;
                                let course = [];
                                let chapter = [];
                                let questionData = [];
                                //value of question
                                let content = '';
                                let option1 = '';
                                let option2 = '';
                                let option3 = '';
                                let option4 = '';
                                let answer = '';
                                let question_id = '';
                                let level = '';
                                let questionDelete = [];
                                let listRowError = [];

                                $(document).ready(function () {
                                    getQuestionData();
                                    reloadQuestionToEdit();
                                });

                                //============== Get valid option
                                function getValidOption() {
                                    let op1 = document.getElementById('oq-op1');
                                    let op2 = document.getElementById('oq-op2');
                                    let op3 = document.getElementById('oq-op3');
                                    let op4 = document.getElementById('oq-op4');
                                    let select0 = document.getElementById('select-op-0');
                                    let select1 = document.getElementById('select-op-1');
                                    let select2 = document.getElementById('select-op-2');
                                    let select3 = document.getElementById('select-op-3');
                                    let select4 = document.getElementById('select-op-4');

                                    if (op1.value.length <= 0 && op2.value.length <= 0 && op3.value.length <= 0 && op4.value.length <= 0)
                                        select0.style.display = "block";
                                    else
                                        select0.style.display = "none";
                                    if (op1.value.length > 0) {
                                        select1.style.display = "block";
                                    } else {
                                        select1.style.display = "none";
                                    }
                                    if (op2.value.length > 0) {
                                        select2.style.display = "block";
                                    } else {
                                        select2.style.display = "none";
                                    }
                                    if (op3.value.length > 0) {
                                        select3.style.display = "block";
                                    } else {
                                        select3.style.display = "none";
                                    }
                                    if (op4.value.length > 0) {
                                        select4.style.display = "block";
                                    } else {
                                        select4.style.display = "none";
                                    }
                                }

                                //================================================ choose get all question
                                function getAllQuestion() {
                                    course = [];
                                    getQuestionData();
                                }

                                //================================================ declare datatable
                                var table = $('#questiontable').DataTable({
                                    scrollY: 550,
                                    data: questionData,
                                    columns: [
                                        {data: 'question_id'},
                                        {data: 'chapter_name',
                                            render: function (data) {
                                                return '<p style="font-size: 16px" >' + data + '</p>';
                                            }
                                        },
                                        {data: 'content'},
                                        {data: 'option1'},
                                        {data: 'option2'},
                                        {data: 'option3'},
                                        {data: 'option4'},
                                        {data: 'answer',
                                            render: function (data) {
                                                return '<p style=" text-align: center; font-size: 17px; ">' + data + '</p>';
                                            }
                                        },
                                        {data: 'level',
                                            render: function (data) {
                                                if (data === 1)
                                                    return '<p style="color: green;font-size: 15px;font-weight: bold;">Easy</p>';
                                                if (data === 2)
                                                    return '<p style="color: orange;font-size: 15px;font-weight: bold;">Medium</p>';
                                                if (data === 3)
                                                    return '<p style="color: red;font-size: 15px;font-weight: bold;">Hard</p>';
                                            }
                                        },
                                        {data: 'question_id',
                                            render: function (data) {
                                                return '<a href="#editquestion' + data + '" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE254;</i></a>';
                                            }
                                        },
                                        {data: 'question_id',
                                            render: function (data) {
                                                return '<input style=" width: 20px; height: 20px;" type="checkbox" name="questionId" value="' + data + '"/>';
                                            }
                                        }
                                    ]
                                });
                                //================================================ click choose course
                                function addDataCourse() {
                                    var checkCourse = document.getElementsByName('course');
                                    var temp = [];
                                    for (var i = 0; i < checkCourse.length; i++) {
                                        if (checkCourse[i].checked && !temp.includes(checkCourse[i].value)) {
                                            temp.push(checkCourse[i].value);
                                        } else {
                                            temp.splice(i, 1);
                                        }
                                    }
                                    course = temp;
                                    getQuestionData();
                                }
                                //================================================ click choose chapter
                                function addDataChapter() {
                                    var checkChapter = document.getElementsByName('chapter');
                                    var temp = [];
                                    for (var i = 0; i < checkChapter.length; i++) {
                                        if (checkChapter[i].checked && !temp.includes(checkChapter[i].value)) {
                                            temp.push(checkChapter[i].value);
                                        } else {
                                            temp.splice(i, 1);
                                        }
                                    }
                                    chapter = temp;
                                    getQuestionData();
                                }

                                //================================================ click choose question
                                function addQuestion() {
                                    var checkQuestion = document.getElementsByName('questionId');
                                    var temp = [];
                                    for (var i = 0; i < checkQuestion.length; i++) {
                                        if (checkQuestion[i].checked && !temp.includes(checkQuestion[i].value)) {
                                            temp.push(checkQuestion[i].value);
                                        } else {
                                            temp.splice(i, 1);
                                        }
                                    }
                                    questionDelete = temp;
                                }

                                //================================================ get question
                                function getQuestionData() {
                                    let data = {
                                        sid: subjectId,
                                        keyCourse: course.toString(),
                                        keyChapter: chapter.toString(),
                                        content: content, option1: option1, option2: option2, option3: option3, option4: option4,
                                        answer: answer, id: question_id, level: level
                                    };
                                    $.ajax({
                                        async: false,
                                        url: "/holalearn/questionbank",
                                        type: 'post',
                                        dataType: 'json',
                                        data: data,
                                        success: function (data) {
                                            questionData = data;
                                            table.clear().draw();
                                            table.rows.add(data).draw();
                                        }
                                    });
                                }

                                //======================================= get all modal edit question after add/import
                                function reloadQuestionToEdit() {
                                    var modal = "";
                                    var edit = document.getElementById('edit');
                                    if (questionData.length > 0) {
                                        for (var i = 0; i < questionData.length; i++) {
                                            modal += '<div id="editquestion' + questionData[i].question_id + '" class="modal fade">' +
                                                    '<div class="modal-dialog">' +
                                                    '<div class="modal-content">' +
                                                    '<form action="" method="post">' +
                                                    '<div class="modal-header">	' +
                                                    '<h4 class="modal-title">Edit Question</h4>' +
                                                    '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' +
                                                    '</div>' +
                                                    '<div class="modal-body">' +
                                                    '<div class="form-group">' +
                                                    '<label>Content</label>' +
                                                    '<input id="content' + questionData[i].question_id + '" type="text" class="form-control" value="' + questionData[i].content + '" required>' +
                                                    '</div>' +
                                                    '<div class="form-group">' +
                                                    '<label>Option 1</label>' +
                                                    '<input id="option1' + questionData[i].question_id + '" type="text" class="optionEdit' + questionData[i].question_id + ' form-control" value="' + questionData[i].option1 + '" required>' +
                                                    '</div>' +
                                                    '<div class="form-group">' +
                                                    '<label>Option 2</label>' +
                                                    '<input id="option2' + questionData[i].question_id + '" type="text" class="optionEdit' + questionData[i].question_id + ' form-control" value="' + questionData[i].option2 + '" required>' +
                                                    '</div>' +
                                                    '<div class="form-group">' +
                                                    '<label>Option 3</label>' +
                                                    '<input id="option3' + questionData[i].question_id + '" type="text" class="optionEdit' + questionData[i].question_id + ' form-control" value="' + questionData[i].option3 + '" required>' +
                                                    '</div>' +
                                                    '<div class="form-group">' +
                                                    '<label>Option 4</label>' +
                                                    '<input id="option4' + questionData[i].question_id + '" type="text" class="optionEdit' + questionData[i].question_id + ' form-control" value="' + questionData[i].option4 + '" required>' +
                                                    '</div>' +
                                                    '<div class="form-group">' +
                                                    '<label>Answer</label>' +
                                                    '<select id="answer' + questionData[i].question_id + '">' +
                                                    '<option ' + (questionData[i].answer === 1 ? 'selected' : '') + ' value="1">Option 1</option>' +
                                                    '<option ' + (questionData[i].answer === 2 ? 'selected' : '') + ' value="2">Option 2</option>' +
                                                    '<option ' + (questionData[i].answer === 3 ? 'selected' : '') + ' value="3">Option 3</option>' +
                                                    '<option ' + (questionData[i].answer === 4 ? 'selected' : '') + ' value="4">Option 4</option>' +
                                                    '</select>' +
                                                    '</div>' +
                                                    '<div class="form-group">' +
                                                    ' <label>Level</label>' +
                                                    '<select id="level' + questionData[i].question_id + '">' +
                                                    '<option ' + (questionData[i].level === 1 ? 'selected' : '') + ' value="1">Easy</option>' +
                                                    '<option ' + (questionData[i].level === 2 ? 'selected' : '') + ' value="2">Medium</option>' +
                                                    '<option ' + (questionData[i].level === 3 ? 'selected' : '') + ' value="3">Hard</option>' +
                                                    '</select>' +
                                                    '</div>' +
                                                    '</div>' +
                                                    '<div class="modal-footer">' +
                                                    '<input id="btnEditQuestion' + questionData[i].question_id + '" type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">' +
                                                    '<input onclick="editQuestion(' + questionData[i].question_id + ')" type="button" class="btn btn-success" value="SAVE">' +
                                                    '</div>' +
                                                    '</form>' +
                                                    '</div>' +
                                                    '</div>' +
                                                    '</div>';
                                        }
                                        edit.innerHTML = modal;
                                    }
                                }



                                //============================== Edit question
                                function editQuestion(id) {
                                    question_id = id;
                                    content = document.getElementById('content' + id).value;
                                    option1 = document.getElementById('option1' + id).value;
                                    option2 = document.getElementById('option2' + id).value;
                                    option3 = document.getElementById('option3' + id).value;
                                    option4 = document.getElementById('option4' + id).value;
                                    answer = document.getElementById('answer' + id).value;
                                    level = document.getElementById('level' + id).value;
                                    var op = document.getElementsByClassName('optionEdit' + id);
                                    var numberOfOption = 0;
                                    for (var i = 0; i < op.length; i++) {
                                        if (op[i].value !== null && op[i].value.trim() !== '') {
                                            console.log(op[i].value);
                                            numberOfOption++;
                                        }
                                    }
                                    console.log(numberOfOption);
                                    if (content === '' || numberOfOption < 2) {
                                        toastr.error('Content must be not empty and have at least 2 options', 'ERROR');
                                    } else {
                                        var btn = document.getElementById('btnEditQuestion' + id);
                                        btn.click();
                                        toastr.success('This question has been updated successfully', 'DONE', {timeOut: 5000});
                                        getQuestionData();
                                    }

                                }

                                //================================ import question by excel
                                function importQuestion() {
                                    var beforeImport = questionData.length;
                                    var afterImport = questionData.length;

                                    var formData = new FormData($('#fq')[0]);
                                    $.ajax({
                                        async: false,
                                        url: "/holalearn/importquestion",
                                        type: 'POST',
                                        dataType: 'json',
                                        data: formData,
                                        processData: false,
                                        contentType: false,
                                        success: function (data) {
                                            listRowError = data;
                                            getQuestionData();
                                            afterImport = questionData.length;
                                            console.log(data);

                                        }
                                    });
                                    var button = document.getElementById('cancelImport');
                                    var file = document.getElementById('questionFile').value;
                                    reloadQuestionToEdit();
                                    if (file !== '' && beforeImport !== afterImport && listRowError.length === 0) {
                                        button.click();
                                        var f = document.getElementById("fq");
                                        f.reset();
                                        toastr.success('Import questions successfully', 'DONE', {timeOut: 5000});
                                    } else if (file === null || file.trim() === '') {
                                        toastr.error('Please choose a excel file', 'ERROR');
                                    } else if (beforeImport === afterImport) {
                                        toastr.error('Please check the validate of question(s)', 'ERROR');
                                        let errMessage = "Error row in excel File: \n";
                                        for (var e of listRowError) {
                                            errMessage += "ROW " + e + "\n";
                                        }
                                        alert(errMessage);
                                        let err = document.getElementById('errorRow');
                                        err.innerHTML = "<p>ERROR ROWS IN EXCEL FILE:</p>";
                                        for (var e of listRowError) {
                                            err.innerHTML += 'ROW ' + e + ". <br/>";
                                        }
                                    }

                                }

                                //================================ delete question
                                function deleteQuestion() {
                                    addQuestion();
                                    console.log(questionDelete);
                                    if (questionDelete === null || questionDelete.length === 0) {
                                        toastr.error('Please choose at least one question to delete', 'ERROR');
                                        return;
                                    }
                                    if (confirm('Do you want to delete question(s)')) {
                                        let data = {
                                            questionId: questionDelete.toString()
                                        };
                                        $.ajax({
                                            async: false,
                                            url: "/holalearn/importquestion",
                                            type: 'GET',
                                            dataType: 'json',
                                            data: data,
                                            success: function () {
                                                getQuestionData();
                                                toastr.success('Question(s) deleted successfully', 'DONE', {timeOut: 5000});
                                                reloadQuestionToEdit();
                                            }
                                        });
                                    }
                                }

                                function notify() {
                                    alert('you must download and fill in the template format to import the question'.toUpperCase());
                                }

                                //========================================== download template to import question
                                function downloadTemplate() {
                                    $.ajax({
                                        async: false,
                                        url: "/holalearn/download",
                                        type: 'GET',
                                        dataType: 'json',
                                        success: function () {
                                            console.log('hihi');
                                        }
                                    });
                                }

                                //========================================== add one question
                                function add1Question() {
                                    var content = document.getElementById('oq-content').value.trim();
                                    var op1 = document.getElementById('oq-op1').value.trim();
                                    var op2 = document.getElementById('oq-op2').value.trim();
                                    var op3 = document.getElementById('oq-op3').value.trim();
                                    var op4 = document.getElementById('oq-op4').value.trim();
                                    var op = document.getElementsByClassName('option');
                                    var answer = document.getElementById('answer').value;
                                    var numberOfOption = 0;
                                    for (var i = 0; i < op.length; i++) {
                                        if (op[i].value !== null && op[i].value.trim() !== '') {
                                            console.log("option:  " + op[i].value);
                                            numberOfOption++;
                                        }
                                    }
                                    console.log(answer);
                                    if (content !== '' && numberOfOption > 1 && answer > 0) {
                                        var formData = new FormData($('#oq')[0]);
                                        $.ajax({
                                            async: false,
                                            url: "/holalearn/importquestion",
                                            type: 'put',
                                            dataType: 'json',
                                            data: formData,
                                            processData: false,
                                            contentType: false,
                                            success: function () {
                                                getQuestionData();
                                                reloadQuestionToEdit();
                                            }
                                        });
                                        var btn = document.getElementById('cancelAddOneQuestion');
                                        btn.click();
                                        var f = document.getElementById('oq');
                                        f.reset();
                                        toastr.success('Question has been added successfully', 'DONE', {timeOut: 5000});

                                    } else {
                                        toastr.error('Content must be not empty and have at least 2 options', 'ERROR');
                                        if (answer === '0')
                                            toastr.error('Please choose the answer', 'ERROR');
                                    }
                                }


        </script>

    </body>

</html>
