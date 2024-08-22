<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Courses | Education</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="template learningenvironment/style.css" />
    <link href="template subject_detail/css/style.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }
        .nav-item1 {
            background-color: #007bff;
            border: 2px solid #0056b3;
            margin: 5px;
            height: 50px; /* Chiều cao cố định */
            display: flex;
            align-items: center; /* Canh giữa nội dung */
            justify-content: center; /* Canh giữa nội dung */
            flex: 1 1 calc(20% - 10px); /* Mỗi ô chiếm 20% chiều rộng */
            box-sizing: border-box; /* Đảm bảo padding và border không ảnh hưởng đến kích thước */
            border-radius: 5px; /* Bo góc */
            transition: background-color 0.3s, transform 0.3s; /* Hiệu ứng chuyển đổi */
        }
        .nav-link1 {
            width: 100%; /* Để nút chiếm toàn bộ chiều rộng của nav-item */
            text-align: center; /* Canh giữa văn bản */
            text-decoration: none; /* Bỏ gạch chân */
        }
        .nav-item1:hover {
            background-color: #0056b3; /* Màu nền khi hover */
            transform: scale(1.05); /* Tăng kích thước khi hover */
        }
        .tab-pane {
            background-color: #ffffff;
            border: 2px solid #e0e0e0;
            padding: 20px;
            border-radius: 8px; /* Bo góc */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng */
        }
        .nav-link1.active {
            border: 2px solid #FF3520;
            color: #FF3520;
            font-weight: bold; /* Đậm chữ khi active */
        }
        .question-taken {
            background-color: #FFE133;
            color: #000;
        }
        .finish-quiz {
            margin-top: 3%;
        }
        .dynamic-height {
            border: 5px solid red;
            padding: 10px;
        }
        h4.nav-quiz-title {
            margin-bottom: 15px;
            color: #333; /* Màu tiêu đề */
        }
    </style>
</head>
<body>
    <jsp:include page="header3.jsp"></jsp:include> 
    <div class="container-fluid my-5">
        <jsp:include page="sidebarlearning.jsp"></jsp:include>
        <jsp:useBean id="qr" class="dto.ChapterDAO" scope="request"></jsp:useBean>
        <c:set var="quiz_id" value="${requestScope.quiz_id}" />
        <c:set var="learner_id" value="${sessionScope.account.account_id}" />
        <c:set var="result" value="${qr.getQuizResult(quiz_id, learner_id)}"/>
        
        <div class="content">
            <c:if test="${result.status == 0}">
                <div class="row">
                    <div class="col-md-8">
                        <form action="quiz-result" method="get" id="quizForm">
                            <div class="tab-content" id="nav-tabContent">
                                <input type="hidden" value="${requestScope.subject_id}" name="subject_id">
                                <input type="hidden" value="${requestScope.course_id}" name="course_id">
                                <input type="hidden" value="${requestScope.chapter_id}" name="chapter_id">
                                <input type="hidden" value="${requestScope.quiz_id}" name="quiz_id">
                                <input type="hidden" value="${requestScope.category_id}" name="category_id">
                                <c:forEach var="i" items="${requestScope.quiz}">
                                    <div class="tab-pane fade p-3" id="nav-${i.question_id}" role="tabpanel" aria-labelledby="nav-home-tab">
                                        <h5>${i.content}</h5>
                                        <p>Select one:</p>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="${i.question_id}" value="1">
                                            <label class="form-check-label">${i.option1}</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="${i.question_id}" value="2">
                                            <label class="form-check-label">${i.option2}</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="${i.question_id}" value="3">
                                            <label class="form-check-label">${i.option3}</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="${i.question_id}" value="4">
                                            <label class="form-check-label">${i.option4}</label>
                                        </div>
                                        <hr>
                                    </div>
                                </c:forEach>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-4 dynamic-height">
                        <h4 class="nav-quiz-title">Quiz Navigation</h4>
                        <div class="nav flex-wrap" id="nav-tab" role="tablist">
                            <c:forEach var="j" items="${requestScope.quiz}" varStatus="loop">
                                <c:set var="variable" value="${loop.index + 1}" />
                                <div class="nav-item1">
                                    <button class="nav-link1" id="nav-${j.question_id}-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-${j.question_id}" type="button" role="tab" aria-controls="nav-${j.question_id}"
                                            aria-selected="true">${variable}</button>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="finish-quiz">
                            <a id="submit-quiz" href="#" style="color: red; text-decoration: none">Finish attempt...</a>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${result.status == 1}">
                <div class="row">
                    <table class="table table-hover table-dark">
                        <thead>
                            <tr>
                                <th>Marks</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${result.mark}</td>
                                <td style="color: green">PASSED</td>
                            </tr>
                        </tbody>
                    </table>
                </div> 
            </c:if>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $("input[type='radio']").on('change', function () {
                var parentDiv = $(this).closest(".tab-pane");
                if (parentDiv.length > 0) {
                    var parentId = parentDiv.attr("id");
                    var tabItems = $("#nav-tab").find(".nav-item1");
                    tabItems.each(function () {
                        var button = $(this).find('button');
                        if (button.data('bs-target') === '#' + parentId) {
                            button.addClass('question-taken');
                        }
                    });
                }
            });

            $("#submit-quiz").click(function (event) {
                event.preventDefault();
                $("#quizForm").submit();
            });

            function getItemsPerRow() {
                var rightColumn = $(".dynamic-height");
                var rowWidth = rightColumn.width();
                var tabItems = rightColumn.find(".nav-item1");
                var itemsPerRow = 0, totalWidth = 0;

                tabItems.each(function () {
                    var itemWidth = $(this).outerWidth(true);
                    totalWidth += itemWidth;
                    if (totalWidth <= rowWidth) {
                        itemsPerRow++;
                    } else {
                        return false;
                    }
                });
                return itemsPerRow;
            }

            function setRightColumnHeight() {
                var rightColumn = $(".dynamic-height");
                var tabItems = rightColumn.find(".nav-item1");
                var numberItem = tabItems.length;
                var itemPerRow = getItemsPerRow();
                var rows = Math.ceil(numberItem / itemPerRow) + 3;
                var height = tabItems.eq(0).height() * rows + $('.nav-quiz-title').height() + $('.finish-quiz').height();
                rightColumn.height(height);
            }

            setRightColumnHeight();
            $(window).resize(setRightColumnHeight);
        });
    </script>
    <script src="template learningenvironment/script.js"></script>
</body>
</html>
