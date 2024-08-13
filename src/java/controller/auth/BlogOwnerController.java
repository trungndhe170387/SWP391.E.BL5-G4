
package controller.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.BlogDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Blog;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BlogOwnerController", urlPatterns = {"/blog_marketer"})
public class BlogOwnerController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        request.getRequestDispatcher("blog_marketer.jsp").forward(request, response);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        BlogDAO dao = new BlogDAO();
        HttpSession session = request.getSession();

        String makerter_id = acc.getAccount_id() + "";
        List<Blog> listB = dao.getAllBlogByOwner(makerter_id);

        Gson gson = new Gson();
        String list1 = gson.toJson(listB);
        JsonObject jsonobj = new JsonObject();
        jsonobj.addProperty("list1", list1);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

}
