
package controller.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.SubjectDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Subject;

@WebServlet(name = "LecturerSubjectController", urlPatterns = {"/lecturersubject"})
public class LecturerSubjectController extends BaseRequiredAuthorizationController {

   

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        request.getRequestDispatcher("questionbank.jsp").forward(request, response);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        HttpSession session = request.getSession();
        SubjectDAO sd = new SubjectDAO();
        String txtSearch = request.getParameter("key");
        List<Subject> listS = sd.getSubjectBankByLecturer(acc.getAccount_id(), txtSearch);
        Gson gson = new Gson();
        String listSubject = gson.toJson(listS);
        JsonObject jo = new JsonObject();
        jo.addProperty("list", listSubject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jo.toString());
    }

}
