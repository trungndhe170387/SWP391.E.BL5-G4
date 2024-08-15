
package controller.auth;

import dto.Course1DAO;
import dto.Subject1DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Subject;

/**
 *
 * @author admin
 */
@WebServlet(name = "GetSubjectCertificateController", urlPatterns = {"/getsubjectcertificate"})
public class GetSubjectCertificateController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String subject_id_raw = request.getParameter("subject_id");
        String category_id_raw = request.getParameter("category_id");
        String course_id_raw = request.getParameter("course_id");
        Course1DAO c = new Course1DAO();
        Subject1DAO s = new Subject1DAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            response.sendRedirect("login");
        } else {
            try {
                int subject_id = Integer.parseInt(subject_id_raw);
                int category_id = Integer.parseInt(category_id_raw);
                int course_id = Integer.parseInt(course_id_raw);
                Subject subject = s.getSubject(subject_id);
                request.setAttribute("course_id", course_id);
                request.setAttribute("category_id", category_id);
                request.setAttribute("subject", subject);
                request.getRequestDispatcher("subjectcertificate.jsp").forward(request, response);
            } catch (Exception e) {
            }
        }
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
