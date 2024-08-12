<%-- 
    Document   : blog
    Created on : Sep 18, 2023, 10:59:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>HoLaLearn | Sliders</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <link type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
        <!-- CSS here -->



        <!-- Customized Bootstrap Stylesheet -->
        <link href="template course_detail/css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
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
        <jsp:include page="header3.jsp"></jsp:include>  

            <!-- Header End -->
            <div>
                <!--? slider Area Start-->
                <section class="slider-area slider-area2">
                    <div class="slider-active">
                        <!-- Single Slider -->
                        <div class="single-slider slider-height2">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-8 col-lg-11 col-md-12">
                                        <div class="hero__caption hero__caption2">
                                            <h1 data-animation="bounceIn" data-delay="0.2s">Slider</h1>
                                            <!-- breadcrumb Start-->
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                    <li class="breadcrumb-item"><a href="sliderlist">Slider</a></li> 
                                                </ol>
                                            </nav>
                                            <!-- breadcrumb End -->
                                            <h3 style="color: red">Welcome ${sessionScope.account.fullname}</h3>
                                        <a>${requestScope.mess}</a>
                                    </div>
                                </div>
                            </div>
                        </div>          
                    </div>
                </div>
            </section>
            <!--? Blog Area Start-->
            <section class="blog_area section-padding">
                <div style="#subjecttable{
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
                     }">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h2>Manage <b style="color: #FF3514">Slider</b></h2>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="slideradd"><button id="addSub" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Slider</span></button></a>
                                    </div>
                                </div>
                            </div>


                            <!--Table-->
                            <table class="table table-striped table-hover" id="subjecttable">
                                <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>title</th>
                                        <th>description</th>
                                        <th>link</th>
                                        <th>status</th>
                                        <th>endtime</th>
                                        <th>image</th>
                                        <th>type</th>
                                        <th>marketer_id</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>

                            </table>

                        </div>
                    </div>        
                </div>
            </section>

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

            <!-- footer-bottom area -->
            <div class="footer-bottom-area">
                <div class="container">
                    <div class="footer-border">
                        <div class="row d-flex align-items-center">
                            <div class="col-xl-12 ">
                                <div class="footer-copy-right text-center">
                                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End-->
        </div>
    </footer> 

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


</body>
<script type="text/javascript">
                                            $(document).ready(function () {

                                                //Display datatable code
                                                var dataTableInstance = $("#subjecttable").DataTable({
                                                    ajax: {
                                                        url: '/holalearn/slider_marketer',
                                                        type: 'POST',
                                                        dataType: 'json',
                                                        success: function (response) {
                                                            var list_slider = JSON.parse(response.list1);
                                                            console.log(list_slider);
                                                            dataTableInstance.clear().rows.add(list_slider).draw();
                                                        }
                                                        //dataSrc: function (response) {
                                                        //   var jsonData = JSON.parse(response.list);
                                                        //     return jsonData;
                                                        // }
                                                    },
                                                    columns: [
                                                        {data: 'id'},
                                                        {data: 'title'},
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
                                                        {data: 'link'},
                                                        {data: 'status',
                                                            render: function (data) {
                                                                if (data === 1) {
                                                                    return '<p style="color: green">Show</p>';
                                                                }
                                                                if (data === 0) {
                                                                    return '<p style="color: red">Hide</p>';
                                                                }
                                                            }
                                                        },
                                                        {data: 'endtime',
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
                                                        {data: 'type'},
                                                        {data: 'marketer_id'},
                                                        {
                                                            // Thêm cột action
                                                            data: null,
                                                            sortable: false,
                                                            searchable: false,
                                                            render: function (data, type, row) {
                                                                return '<a href="slideredit?id=' + row.id + '" class="genric-btn danger-border" onclick="fin()"><button type="button" class="btn btn-primary">Edit</button></a>' +
                                                                        '<a id="delete'+row.id+'" href="" class="genric-btn danger-border" onclick="fin1('+row.id+')"><button type="button" class="btn btn-danger">Delete</button></a>';
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

                                                    currentPage = dataTableInstance.page();

                                                    datas = {
                                                        method: "delete",
                                                        subject_id: sub_id
                                                    };
                                                    $.ajax({
                                                        url: '/holalearn/managesubject',
                                                        type: 'POST',
                                                        dataType: 'json',
                                                        data: datas,
                                                        success: function (response) {
                                                            showSuccessMessage('xoa thanh cong', 'Sucess');
                                                            dataTableInstance.ajax.reload(function () {
                                                                dataTableInstance.page(currentPage).draw('page');
                                                            });
                                                            $('#deleteSubjectModal').modal('hide');
                                                        }
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
<script type="text/javascript">
    function fin1(id) {
        
        if(confirm("Are you sure to delete this slider?")){
            $('#delete'+id).attr("href", "sliderdelete?id="+id);
        }
    }
</script>
</html>
