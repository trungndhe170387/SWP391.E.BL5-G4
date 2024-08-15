
package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author lam12
 */
@WebServlet(name = "CourseManagementController", urlPatterns = {"/coursemanagement"})
public class CourseManagementController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String subject_id = request.getParameter("subject_id");
        String subject_name = request.getParameter("subject_name");
        HttpSession session = request.getSession();
        session.setAttribute("subject_id", subject_id);
        request.setAttribute("subject_name", subject_name);
        request.getRequestDispatcher("coursemanagement.jsp").forward(request, response);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
    }

}
