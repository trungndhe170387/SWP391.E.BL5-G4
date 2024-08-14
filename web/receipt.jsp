<%-- 
    Document   : receipt
    Created on : Oct 4, 2023, 4:14:49 AM
    Author     : hayha
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>Payment Receipt</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                background:#eee;
                margin-top:20px;
            }
            .text-danger strong {
                color: #9f181c;
            }
            .receipt-main {
                background: #ffffff none repeat scroll 0 0;
                border-bottom: 12px solid #333333;
                border-top: 12px solid #9f181c;
                margin-top: 50px;
                margin-bottom: 50px;
                padding: 40px 30px !important;
                position: relative;
                box-shadow: 0 1px 21px #acacac;
                color: #333333;
                font-family: open sans;
            }
            .receipt-main p {
                color: #333333;
                font-family: open sans;
                line-height: 1.42857;
            }
            .receipt-footer h1 {
                font-size: 15px;
                font-weight: 400 !important;
                margin: 0 !important;
            }
            .receipt-main::after {
                background: #414143 none repeat scroll 0 0;
                content: "";
                height: 5px;
                left: 0;
                position: absolute;
                right: 0;
                top: -13px;
            }
            .receipt-main thead {
                background: #414143 none repeat scroll 0 0;
            }
            .receipt-main thead th {
                color:#fff;
            }
            .receipt-right h5 {
                font-size: 16px;
                font-weight: bold;
                margin: 0 0 7px 0;
            }
            .receipt-right p {
                font-size: 12px;
                margin: 0px;
            }
            .receipt-right p i {
                text-align: center;
                width: 18px;
            }
            .receipt-main td {
                padding: 9px 20px !important;
            }
            .receipt-main th {
                padding: 13px 20px !important;
            }
            .receipt-main td {
                font-size: 13px;
                font-weight: initial !important;
            }
            .receipt-main td p:last-child {
                margin: 0;
                padding: 0;
            }
            .receipt-main td h2 {
                font-size: 20px;
                font-weight: 900;
                margin: 0;
                text-transform: uppercase;
            }
            .receipt-header-mid .receipt-left h1 {
                font-weight: 100;
                margin: 34px 0 0;
                text-align: right;
                text-transform: uppercase;
            }
            .receipt-header-mid {
                margin: 24px 0;
                overflow: hidden;
            }

            #container {
                background-color: #dcdcdc;
            }
        </style>
    </head>
    <body>
        <div class="col-md-12">
            <div class="row">
                <div class="receipt-main col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
                    <div class="row">
                        <div class="receipt-header">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="receipt-left">
                                    <img class="img-responsive" alt="iamgurdeeposahan" src="https://bootdey.com/img/Content/avatar/avatar6.png" style="width: 71px; border-radius: 43px;">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="receipt-header receipt-header-mid">
                            <div class="col-xs-8 col-sm-8 col-md-8 text-left">
                                <div class="receipt-right">
                                    <h5>               
                                        <td><b>Payer:</b></td>
                                        <td>${payer.firstName} ${payer.lastName}</td>      
                                    </h5>

                                    <p><b>Email :</b>${payer.email}</p>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Description</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td class="text-right">
                                        <p>
                                            <strong>Description: </strong>
                                        </p>

                                    </td>

                                    <td>
                                        <c:forEach var="item" items="${subject_name}" > 
                                            <p>${item}</p>
                                        </c:forEach>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="text-right">
                                        <p>
                                            <strong>Total Amount: </strong>
                                        </p>
                                        <p>
                                            <strong>Discount: </strong>
                                        </p>

                                    </td>
                                    <td>
                                        <p>
                                            <strong><i class="fa fa-inr"></i>${transaction.amount.details.subtotal}  USD </strong>
                                        </p>
                                        <p>
                                            <strong><i class="fa fa-inr"></i></strong>
                                        </p>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right"><h2><strong>Total: </strong></h2></td>

                                    <td class="text-left text-danger"><h2><strong><i class="fa fa-inr"></i> ${transaction.amount.total} USD</strong></h2></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="receipt-header receipt-header-mid receipt-footer">
                            <div class="col-xs-8 col-sm-8 col-md-8 text-left">
                                <div class="receipt-right">
                                    
                                    <h5 style="color: rgb(140, 140, 140);">Thank you for purchasing the course</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="receipt-left">
                                    <h1><a href="home">Back to home</a></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>