
package controller.auth;

import dto.BlogDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DeleteBlogController", urlPatterns = {"/blogdelete"})
public class DeleteBlogController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        BlogDAO dao = new BlogDAO();
        dao.deleteBlog(id_raw);
        response.sendRedirect("blog_marketer");
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
    }

}
