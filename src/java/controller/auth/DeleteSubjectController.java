
package controller.auth;

import dto.SubjectDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet(name = "DeleteSubjectController", urlPatterns = {"/deletesubject"})
public class DeleteSubjectController extends BaseRequiredAuthorizationController {

 
    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        SubjectDAO sd = new SubjectDAO();
        String subject_id_raw = request.getParameter("subject_id");
        try {
            int subject_id = Integer.parseInt(subject_id_raw);
            boolean isSuceed = sd.deleteSubjectBySubjectId(subject_id);
        } catch (NumberFormatException e) {
        }
        response.sendRedirect("managesubject");
    }

}
