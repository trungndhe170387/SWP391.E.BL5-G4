
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
@WebServlet(name = "SubjectManagement", urlPatterns = {"/subjectmanagement"})
public class SubjectManagement extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("subject_id") != null) {
            session.removeAttribute("subject_id");
        }
        request.getRequestDispatcher("managesubject.jsp").forward(request, response);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
