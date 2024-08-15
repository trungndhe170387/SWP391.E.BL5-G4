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
                                <p style="font-size: 50px">Filter</p>
                                <p style="font-size: 40px">Role</p>
                                <div style="margin-left: 20px">
                                <c:forEach items="${listR}" var="r">
                                    <input style="width: 20px; height: 20px" onclick="addRoleData()" type="checkbox" name="role" class="role" value="${r.role_id}">
                                    <span style="font-weight: bold; font-size: 25px; ">&nbsp;&nbsp;&nbsp; ${r.role_name}</span><br>
                                </c:forEach>

                                <p style="font-size: 40px; margin-left: -20px">Status</p>

                                <input style="width: 20px; height: 20px" onclick="addStatusData()" type="checkbox" name="status" class="status" value="1">
                                <span style="font-weight: bold; font-size: 25px; ">&nbsp;&nbsp;&nbsp; Active</span><br>
                                <input style="width: 20px; height: 20px" onclick="addStatusData()" type="checkbox" name="status" class="status" value="2">
                                <span style="font-weight: bold; font-size: 25px; ">&nbsp;&nbsp;&nbsp; Blocked</span><br>
                            </div>



                        </div>
                        <input id="subject_id" type="hidden" value="${subject_id}"/>
                        <!--Start Table-->
                        <div class="col-md-8">
                            <table style="width: 100%" id="accounttable" class=" table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Fullname</th>
                                        <th>Email</th>
                                        <th>Date of birth</th>
                                        <th>Phone</th>   
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th>Edit Role</th>
                                        <th>Action</th>


                                    </tr>
                                </thead>

                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Username</th>
                                        <th>Fullname</th>
                                        <th>Email</th>
                                        <th>Date of birth</th>
                                        <th>Phone</th>   
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th>Edit Role</th>
                                        <th>Action</th>
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
        <!--End form add 1 question-->

        <!--form import question-->


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
                                    let accountData = [];
                                    let role = [];
                                    let active = [];
                                    let aid = '';
                                    let roleEdit = '';
                                    let action = '';


                                    $(document).ready(function () {
                                        getAccountData();
                                    });

                                    function addStatusData() {
                                        var checkStatus = document.getElementsByName('status');
                                        var temp = [];
                                        for (var i = 0; i < checkStatus.length; i++) {
                                            if (checkStatus[i].checked && !temp.includes(checkStatus[i].value)) {
                                                temp.push(checkStatus[i].value);
                                            } else {
                                                temp.splice(i, 1);
                                            }
                                        }
                                        active = temp;
                                        console.log(active);
                                        getAccountData();
                                    }

                                    function addRoleData() {
                                        var checkRole = document.getElementsByName('role');
                                        var temp = [];
                                        for (var i = 0; i < checkRole.length; i++) {
                                            if (checkRole[i].checked && !temp.includes(checkRole[i].value)) {
                                                temp.push(checkRole[i].value);
                                            } else {
                                                temp.splice(i, 1);
                                            }
                                        }
                                        role = temp;
                                        console.log(role);
                                        getAccountData();
                                    }

                                    function getAccountData() {
                                        let data = {
                                            roleCheck: role.toString(),
                                            activeCheck: active.toString(),
                                            aid: aid,
                                            action: action,
                                            role: roleEdit
                                        };
                                        console.log(data);
                                        $.ajax({
                                            async: false,
                                            url: "/holalearn/manageaccount",
                                            type: 'post',
                                            dataType: 'json',
                                            data: data,
                                            success: function (data) {
                                                console.log(data);
                                                accountData = data;
                                                table.clear().draw();
                                                table.rows.add(data).draw();
                                            }
                                        });
                                    }

                                    function blockAccount(id) {
                                        if (confirm("Do you want to BLOCK this Account")) {
                                            aid = id.toString();
                                            action = "block";
                                            getAccountData();
                                        }
                                    }

                                    function activeAccount(id) {
                                        if (confirm("Do you want to ACTIVE this Account")) {
                                            aid = id.toString();
                                            action = "active";
                                            getAccountData();
                                        }
                                    }

                                    function editRole(id) {
                                        roleEdit = document.getElementById('role' + id).value;
                                        action = 'edit';
                                        aid = id;
                                        getAccountData();
                                    }


                                    var table = $('#accounttable').DataTable({
                                        scrollY: 550,
                                        data: accountData,
                                        columns: [
                                            {data: 'username'},
                                            {data: 'fullname'},
                                            {data: 'email'},
                                            {data: 'dob'},
                                            {data: 'phone'},
                                            {data: 'roleName'},
                                            {data: 'active',
                                                render: function (data) {
                                                    if (data === 1) {
                                                        return '<p style="color: green;font-size: 15px;font-weight: bold;">ACTIVE</p>';
                                                    }
                                                    if (data === 2) {
                                                        return '<p style="color: red;font-size: 15px;font-weight: bold;">BLOCKED</p>';
                                                    }
                                                }
                                            },
                                            {data: null,
                                                render: function (data) {
                                                    return '<select onchange="editRole(' + data.account_id + ')" id="role' + data.account_id + '">' +
                                                            '<option ' + (data.role_id === 2 ? 'selected' : '') + ' value="2">Learner</option>' +
                                                            '<option ' + (data.role_id === 3 ? 'selected' : '') + ' value="3">Lecturer</option>' +
                                                            '<option ' + (data.role_id === 4 ? 'selected' : '') + ' value="4">Marketer</option>' +
                                                            '' +
                                                            '</select>';
                                                }
                                            },
                                            {data: null,
                                                render: function (data) {
                                                    if (data.active === 2) {
                                                        return '<button onclick = "activeAccount(' + data.account_id + ')" style="color: green;font-size: 15px;font-weight: bold;">ACTIVE</button>';
                                                    }
                                                    if (data.active === 1) {
                                                        return '<button onclick = "blockAccount(' + data.account_id + ')" style="color: red;font-size: 15px;font-weight: bold;">BLOCKED</button>';
                                                    }
                                                }
                                            }

                                        ]
                                    });

        </script>   

    </body>

</html>
