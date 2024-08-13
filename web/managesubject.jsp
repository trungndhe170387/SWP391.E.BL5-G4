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
        </style>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();
                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    </head>

    <body>
                <jsp:include page="header2.jsp"></jsp:include>  


        <div>
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Subject</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <button id="addSub" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Subject</span></button>
                                <a href="viewsubjectlist" class="btn btn-success" ><i class="material-icons"></i> <span>View Subject List</span></a>						
                            </div>
                        </div>
                    </div>
                    <div style="padding: 5px; padding-bottom: 20px; font-size: 17px">
                        <b>Show / Hide Columns:</b>
                        <a class="showHideColumn" data-columnindex="0">subject_id</a> / 
                        <a class="showHideColumn" data-columnindex="1">subject_name</a> /
                        <a class="showHideColumn" data-columnindex="2">description</a> /
                        <a class="showHideColumn" data-columnindex="3">price</a> /
                        <a class="showHideColumn" data-columnindex="4">discount</a> / 
                        <a class="showHideColumn" data-columnindex="5">sold</a> / 
                        <a class="showHideColumn" data-columnindex="6">created_date</a> / 
                        <a class="showHideColumn" data-columnindex="7">updated_date</a> / 
                        <a class="showHideColumn" data-columnindex="8">image</a>
                    </div>

                    <!--Table-->
                    <table class="table table-striped table-hover" id="subjecttable">
                        <thead>
                            <tr>
                                <th>subject_id</th>
                                <th>subject_name</th>
                                <th>description</th>
                                <th>price</th>
                                <th>discount</th>
                                <th>sold</th>
                                <th>created_date</th>
                                <th>updated_date</th>
                                <th>image</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr>
                                <th>subject_id</th>
                                <th>subject_name</th>
                                <th>description</th>
                                <th>price</th>
                                <th>discount</th>
                                <th>sold</th>
                                <th>created_date</th>
                                <th>updated_date</th>
                                <th>image</th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>

                </div>
            </div>        
        </div>

        <!--Edit Modal-->
        <div id="editSubjectModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="managesubject" method="post" id="editSubjectForm" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Subject</h4>
                            <button type="button" class="close" data-dismiss="modal" id="edit_close-button" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Subject Name</label>
                                <input name="subject_name" type="text" class="form-control" placeholder="" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" data-index="edit" rows="4" cols="50" class="form-control"  placeholder="" required>${s.description}</textarea>  
                            </div>
                            <div class="form-group">
                                <label for="inputGroupFile">Image</label>
                                <div class="input-group mb-3">
                                    <input type="file" name="image" class="form-control" id="inputGroupFile">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>Price</label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">$</span>
                                            <input type="number" value="" name="price" placeholder="" class="form-control price-validate" required min="0">
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label>Discount</label>
                                        <div class="input-group">
                                            <input type="number" class="form-control discount-validate" value="" placeholder="" name="discount" required min="0" max="100">
                                            <span class="input-group-text">%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <jsp:useBean id="cate" class="dto.CategoryDAO" scope="request"/>
                            <div class="form-group">
                                <label>Category_ID</label>
                                <select name="category_id" class="form-select" required>
                                    <option value="">Choose Category</option>
                                    <c:forEach items="${cate.allCategory}" var="c">
                                        <option value="${c.category_id}" ${(s.category_id == c.category_id)? "selected" : ""}>${c.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <input type="hidden" name="subject_id" value=""/>
                            <input type="hidden" name="method" value="update"/>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" id="edit_cancel-button" value="Cancel">
                            <input type="submit" class="btn btn-info update_subject" value="Save" id="edit_subject_button">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Delete Modal-->
        <div id="deleteSubjectModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="managesubject" id="deleteSubjectForm" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Subject</h4>
                            <button type="button" class="close" id="delete_close-button" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p style="font-size: 20px">Are you sure you want to delete this subject?</p>
                            <p style="font-size: 15px" class="text-warning">This action cannot be undone.</p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" id="delete_cancel-button"  value="Cancel">
                            <input type="submit" class="btn btn-danger" id="delete_subject_button" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Add Modal -->
        <div id="addSubjectModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
            <div class="modal-dialog">
                <div class="modal-content mx-auto w-100">
                    <form action="managesubject" id="addSubjectForm" method="post" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Subject</h4>
                            <button type="button" class="close" id="add_close-button" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Subject Name</label>
                                <input name="subject_name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" data-index="add" rows="4" cols="50" class="form-control"  placeholder="" required></textarea>  
                            </div>
                            <div class="form-group">
                                <label for="inputGroupFile">Image</label>
                                <div class="input-group mb-3">
                                    <input type="file" name="image" class="form-control" id="inputGroupFile" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>Price</label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">$</span>
                                            <input type="number" name="price" class="form-control price-validate" required min="0">
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label>Discount</label>
                                        <div class="input-group">
                                            <input type="number" class="form-control discount-validate" name="discount" required min="0" max="100">
                                            <span class="input-group-text">%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Category_ID</label>
                                <select name="category_id" class="form-select" required>
                                    <option value="">Choose Category</option>
                                    <c:forEach items="${cate.allCategory}" var="c">
                                        <option value="${c.category_id}">${c.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <input type="hidden" name="method" value="add"/>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" id="add_cancel-button" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add" id="add_subject_button">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Description modal-->                
        <div class="modal fade" id="descriptionModal" tabindex="-1" role="dialog" aria-labelledby="descriptionModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="descriptionModalLabel">Description</h5>
                    </div>
                    <div class="modal-body">
                        <div id="descriptionContent" style="font-size: 20px"></div>
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
        <jsp:include page="footer.jsp"></jsp:include>  


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary p-3 back-to-top"><i class="fa fa-angle-double-up"></i></a>


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
                var dataTableInstance = $("#subjecttable").DataTable({
                    ajax: {
                        url: '/holalearn/managesubject',
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            // var list_subject = JSON.parse(response.list);
                            dataTableInstance.clear().rows.add(response).draw();
                        }
                        //dataSrc: function (response) {
                        //   var jsonData = JSON.parse(response.list);
                        //     return jsonData;
                        // }
                    },
                    columns: [
                        {data: 'subject_id'},
                        {data: 'subject_name'},
                        {data: 'description',
                            sortable: false,
                            searchable: false,
                            render: function (description, type) {
                                if (type === 'display' && description.length > 50) { // Kiểm tra nếu description dài hơn 50 ký tự
                                    return '<p class="description-truncated" data-bind="' + description + '">' + description.substr(0, 50) + '...</p>';
                                } else {
                                    return description;
                                }
                            }
                        },
                        {data: 'price',
                            render: function (price) {
                                return "$" + price;
                            }
                        },
                        {data: 'discount',
                            render: function (discount) {
                                return discount + "%";
                            }
                        },
                        {data: 'sold'},
                        {data: 'created_date'},
                        {data: 'updated_date',
                            render: function (updated_date) {
                                if (!updated_date || updated_date === null) {
                                    return 'N/A';
                                } else {
                                    return updated_date;
                                }
                            }
                        },
                        {data: 'image',
                            sortable: false,
                            searchable: false,
                            render: function (image) {
                                return  '<div style="width: 200px; height: 200px; overflow: hidden;" class="image-detail" data-image="' + image + '">' +
                                        '<img src="data:image/jpeg;base64,' + image + '" alt="Image" style="width: 100%; height: 100%; border-radius: 5px; object-fit: cover"/> </div>';
                            }
                        },
                        {
                            // Thêm cột action
                            data: null,
                            sortable: false,
                            searchable: false,
                            render: function (data, type, row) {
                                return '<div class="dropdown">' +
                                        '<i class="material-icons dropdown-toggle" data-toggle="tooltip" title="Actions">&#8801;</i>' +
                                        '<div class="dropdown-content">' +
                                        '<a data-id="' + row.subject_id + '" class="edit" id="editSub" data-toggle="modal">' +
                                        ' <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i> Edit </a>' +
                                        '<a data-id="' + row.subject_id + '" classs="delete" id="deleteSub" data-toggle="modal">' +
                                        '<i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i> Delete </a>' +
                                        '<a href="coursemanagement?subject_id=' + row.subject_id + '&subject_name=' + row.subject_name + '"><i class="material-icons" data-toggle="tooltip" title="Right Arrow">&#xE315;</i> Add Course</a>' +
                                        '</div></div>';
                            }
                        }
                    ]
                });

                function isFormDataEmpty(formData) {
                    for (var pair of formData.entries()) {
                        var value = pair[1];
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

                $('.discount-validate').on('input', function () {
                    var inputvalue = parseFloat($(this).val());

                    if (inputvalue < 0) {
                        $(this).val(0);
                    }
                    if (inputvalue > 100) {
                        $(this).val(100);
                    }
                });

                $('.price-validate').on('input', function () {
                    var inputvalue = parseFloat($(this).val());

                    if (inputvalue < 0) {
                        $(this).val(0);
                    }
                });

                var currentPage;

                $('.showHideColumn').on('click', function () {
                    var tableColumn = dataTableInstance.column($(this).attr('data-columnindex'));
                    tableColumn.visible(!tableColumn.visible());
                });

                dataTableInstance.on('click', '.description-truncated', function () {
                    var description = $(this).attr('data-bind');
                    $('#descriptionContent').html(description);
                    $('#descriptionModal').modal('show');
                });

                dataTableInstance.on('click', '.image-detail', function () {
                    var image = $(this).attr('data-image');
                    $('#show-image').attr('src', 'data:image/jpeg;base64,' + image);
                    $('#imageModal').modal('show');
                });

                dataTableInstance.on('click', '#editSub', function () {
                    $('#editSubjectModal').modal('show');
                    var subject_id = $(this).attr('data-id');
                    var method = 'getSubjectBySubjectId';
                    console.log(subject_id);
                    datas = {
                        method: method,
                        subject_id: subject_id
                    };
                    $.ajax({
                        url: '/holalearn/managesubject',
                        type: 'POST',
                        dataType: 'json',
                        data: datas,
                        success: function (response) {
                            var sub = JSON.parse(response.subject);
                            $('input[name="subject_name"]').val(sub.subject_name);
                            $('textarea[name="description"][data-index="edit"]').text(sub.description);
                            $('input[name="price"]').val(sub.price);
                            $('input[name="discount"]').val(sub.discount);
                            $('select[name="category_id"]').val(sub.category_id);
                            $('input[name="subject_id"]').val(sub.subject_id);
                        }
                    });
                });

                $('#edit_subject_button').click(function (e) {
                    e.preventDefault();
                    currentPage = dataTableInstance.page();
                    console.log(currentPage);
                    var formData = new FormData($('#editSubjectForm')[0]);
                    var isEmpty = isFormDataEmptyWithoutImg(formData);
                    if (isEmpty) {
                        showWarningMessage('Xin hay nhap day du thong tin', 'Warning');
                        return;
                    } else {
                        $.ajax({
                            url: '/holalearn/managesubject',
                            type: 'POST',
                            dataType: 'json',
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function (response) {
                                showSuccessMessage('Chinh sua thanh cong', 'Sucess');
                                dataTableInstance.ajax.reload(function () {
                                    dataTableInstance.page(currentPage).draw('page');
                                });
                                $('#editSubjectModal').modal('hide');
                            }
                        });
                    }
                });


                var sub_id;
                dataTableInstance.on('click', '#deleteSub', function () {
                    $('#deleteSubjectModal').modal('show');
                    sub_id = $(this).attr('data-id');
                });

                $('#delete_subject_button').click(function (e) {
                    e.preventDefault();
                    console.log(sub_id);
                    currentPage = dataTableInstance.page();

                    datas = {
                        method: "delete",
                        subject_id: sub_id
                    };
                    $.ajax({
                        url: '/holalearn/managesubject',
                        type: 'POST',
                        dataType: 'json',
                        data: datas
                    }).done(function (response) {
                        var status = response.status;
                        console.log(status);
                        if (status === 'Update successful') {
                            showSuccessMessage('Delete subject successfully!', 'Sucess');
                            dataTableInstance.ajax.reload(function () {
                                dataTableInstance.page(currentPage).draw('page');
                            });
                        } else {
                            showErrorMessage('Delete subject failed', 'Failed');
                        }
                        $('#deleteSubjectModal').modal('hide');
                    });
                });

                $('#addSub').click(function () {
                    $('#addSubjectForm')[0].reset();
                    $('#addSubjectModal').modal('show');
                });


                $('#add_subject_button').click(function (e) {
                    e.preventDefault();
                    currentPage = dataTableInstance.page();
                    var formData = new FormData($('#addSubjectForm')[0]);
                    var isEmpty = isFormDataEmpty(formData);
                    if (isEmpty) {
                        showWarningMessage('Xin hay nhap day du thong tin', 'Warning');
                    } else {
                        $.ajax({
                            url: '/holalearn/managesubject',
                            type: 'POST',
                            dataType: 'json',
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function (response) {
                                showSuccessMessage("Them thanh cong", "Success");
                                dataTableInstance.ajax.reload(function () {
                                    dataTableInstance.page(currentPage).draw('page');
                                });
                                $('#addSubjectModal').modal('hide');
                                $('#addSubjectForm')[0].reset();
                            }
                        });
                    }
                });

                $('#edit_cancel-button').click(function () {
                    $('#editSubjectModal').modal('hide');
                });
                $('#edit_close-button').click(function () {
                    $('#editSubjectModal').modal('hide');
                });
                $('#add_cancel-button').click(function () {
                    $('#addSubjectModal').modal('hide');
                });
                $('#add_close-button').click(function () {
                    $('#addSubjectModal').modal('hide');
                });
                $('#delete_cancel-button').click(function () {
                    $('#deleteSubjectModal').modal('hide');
                });
                $('#delete_close-button').click(function () {
                    $('#deleteSubjectModal').modal('hide');
                });

                // Hàm hiển thị thông báo thành công
                function showSuccessMessage(message, title) {
                    toastr.success(message, title, {showMethod: 'slideDown',
                        hideMethod: 'slideUp'});
                }

                // Hàm hiển thị thông báo lỗi
                function showErrorMessage(message, title) {
                    toastr.error(message, title, {showMethod: 'slideDown',
                        hideMethod: 'slideUp'});
                }

                function showWarningMessage(message, title) {
                    toastr.warning(message, title, {showMethod: 'slideDown',
                        hideMethod: 'slideUp'});
                }

                // Đặt tùy chọn cho Toastr
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
