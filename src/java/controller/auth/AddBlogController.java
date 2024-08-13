/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import dto.BlogDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import model.Account;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "AddBlogController", urlPatterns = {"/blogadd"})
public class AddBlogController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        request.getRequestDispatcher("blogadd.jsp").forward(request, response);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String mess = null;
        String imageName = null;
        String savePath = "D:/Sem5_Fall2023/SWP391/image/";
        File file = new File(savePath);
        if (!file.exists()) {
            file.mkdirs();
        }

        BlogDAO dao = new BlogDAO();
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String description = request.getParameter("description");
        Part filePart = request.getPart("image");
        String link = request.getParameter("link");
        String status = request.getParameter("status");
        String marketer_id = request.getParameter("marketer_id");
        String tag = request.getParameter("tag");

        if (filePart.getSize() > 0) {
            imageName = filePart.getSubmittedFileName();
            file = new File(savePath + imageName);
            try ( InputStream fileContent = filePart.getInputStream();  FileOutputStream fos = new FileOutputStream(file)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
            }
        }

        boolean isSuccess = dao.addBlog(title, content, description, imageName, link, status, marketer_id, tag);
        if (isSuccess) {
            mess = "Add successful";
            request.setAttribute("mess", mess);
            response.sendRedirect("blog_marketer");
        } else {
            request.getRequestDispatcher("blogadd").forward(request, response);
        }
    }

}
