<%-- 
    Document   : FileUploadTest
    Created on : Oct 7, 2023, 4:00:35 PM
    Author     : HoangAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="importquestion" enctype="multipart/form-data" method="post">
            File upload: <input type="file" name="question"><br/>
            <input type="submit" value="IMPORT"/>
        </form>
    </body>
</html>
