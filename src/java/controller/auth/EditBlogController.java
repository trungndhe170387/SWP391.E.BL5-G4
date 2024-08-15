
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
import java.util.List;
import model.Account;
import model.Blog;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "EditBlogController", urlPatterns = "/blogedit")
public class EditBlogController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        BlogDAO dao = new BlogDAO();
        String id_raw = request.getParameter("id");
        Blog b = dao.getBlogByID(id_raw);
        List<Blog> listB1 = dao.getRelatedBlog();
        request.setAttribute("listB1", listB1);
        request.setAttribute("bid", id_raw);
        request.setAttribute("b", b);
        request.getRequestDispatcher("blogedit.jsp").forward(request, response);
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
        String created_date = request.getParameter("created_date");
        String status = request.getParameter("status");
        String marketer_id = request.getParameter("marketer_id");
        String tag = request.getParameter("tag");

        String id_raw = request.getParameter("id");
        request.setAttribute("bid", id_raw);

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

        boolean isSuccess = dao.editBlog(title, content, description, imageName, link, created_date, status, marketer_id, tag, id_raw);
        if (isSuccess) {
            mess = "Update successful";
        } else {
            mess = "Update failed";
        }

        Blog b = dao.getBlogByID(id_raw);

        request.setAttribute("b", b);
        request.setAttribute("mess", mess);

        request.getRequestDispatcher("blogedit.jsp").forward(request, response);
    }

}
