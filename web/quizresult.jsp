<%-- 
    Document   : bootstrap
    Created on : Oct 27, 2023, 11:13:01 PM
    Author     : lam12
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Courses | Education</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="template learningenvironment/style.css" />
        <link href="template subject_detail/css/style.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        
         <!-- Popper.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>
            .nav-item {
                background-color: gray;
                border: 2px solid;
                margin: 5px;
            }
            .nav-link {
                color: #fff;
            }
            .tab-pane {
                background-color: #f7f7f7;
                border: 2px solid #e0e0e0;
                padding: 20px;
            }
            body{
                background-color: gainsboro;
            }
            .nav-link.active{
                border: 2px solid #FF3520;
                color: #FF3520;
            }
            .question-taken {
                background-color: #FFE133;
                color: #000000;
            }
        </style> 
    </head>
    <body>
        <jsp:include page="header3.jsp"></jsp:include> 
            <div class="container-fluid my-5">
            <jsp:include page="sidebarlearning.jsp"></jsp:include>
                <div class="content">
                    <div>
                        <table class="table table-hover table-dark">
                            <tbody>
                                <tr>
                                    <th>Marks</th>
                                    <th>Grade</th>
                                    <th>Status</th>
                                </tr>
                                <tr>
                                    <th>${numberCorretAnswer}/${fn:length(listQues)}</th>
                                <th>${mark}</th>
                                <c:if test="${mark<5}"><th style="color: red">NOT PASSED</th></c:if>
                                <c:if test="${mark>=5}"> <th style="color: green">PASSED</th></c:if>
                                </tr>
                            </tbody>
                        </table>
                    </div>   
                <c:forEach var="i" items="${requestScope.listQues}">
                    <c:set var="correctAnswer" value="${i.answer}"/>
                    <c:set var="learnerAnswer" value="${quizTaken[i.question_id]}"/>
                    <div class="ques" id="nav-${i.question_id}">
                        <div>
                            <h5>${i.content}</h5>
                        </div>
                        <hr>
                        <div>
                            <p>Select one: </p>
                            <c:forEach var="j" begin="1" end="4">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" ${learnerAnswer == j ? "checked" : ""} name="${i.question_id}" disabled value="${j}">
                                    <label>
                                        <c:if test="${j == 1}">${i.option1}</c:if>
                                        <c:if test="${j == 2}">${i.option2}</c:if>
                                        <c:if test="${j == 3}">${i.option3}</c:if>
                                        <c:if test="${j == 4}">${i.option4}</c:if>
                                        </label>
                                    <c:if test="${learnerAnswer == j}">
                                        <c:if test="${learnerAnswer == correctAnswer}">
                                            <span style="color:#008A00;font-size:20pt"> &#x2713;</span>
                                        </c:if>
                                        <c:if test="${learnerAnswer != correctAnswer}">
                                            <span style="color:#008A00;font-size:11pt"> &#x274c;</span>
                                        </c:if>
                                    </c:if>
                                </div>
                            </c:forEach>
                            <br>
                            <div><strong>Answer: 
                                    <c:if test="${correctAnswer == 1}">${i.option1}</c:if>
                                    <c:if test="${correctAnswer == 2}">${i.option2}</c:if>
                                    <c:if test="${correctAnswer == 3}">${i.option3}</c:if>
                                    <c:if test="${correctAnswer == 4}">${i.option4}</c:if>  
                                    </strong>
                                </div> 
                            </div>
                        </div>
                        <hr style="border: none; height: 5px; background-color: #000;">
                </c:forEach>  

            </div>
        </div>
        <script src="template learningenvironment/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
    </body>
</html>
