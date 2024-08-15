package controller.auth;

import com.google.gson.Gson;
import dto.QuestionBankDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Chapter;
import model.Course;
import model.Question;

/**
 *
 * @author HoangAnh
 */
@WebServlet(name = "QuestionBankController", urlPatterns = {"/questionbank"})
public class QuestionBankController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String subject_id = request.getParameter("sid");
        QuestionBankDAO qb = new QuestionBankDAO();
        List<Course> listCourse = qb.getCourseBySubject(subject_id);
        List<Chapter> listChapter = qb.getChapterBySubject(subject_id);
        List<Question> listQuestion = qb.getAllQuestion(subject_id);
        request.setAttribute("listQuestion", listQuestion);
        request.setAttribute("listCourse", listCourse);
        request.setAttribute("listChapter", listChapter);
        request.setAttribute("subject_id", subject_id);
        request.getRequestDispatcher("managequestion.jsp").forward(request, response);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        QuestionBankDAO qb = new QuestionBankDAO();
        String id = request.getParameter("id");
        String content = request.getParameter("content");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String answer = request.getParameter("answer");
        String level = request.getParameter("level");
        if (!id.isEmpty() && !content.isEmpty()) {
            qb.editQuestion(id, content, option1, option2, option3, option4, answer, level);
        }
        String sid = request.getParameter("sid");
        String c = request.getParameter("keyCourse");
        String ch = request.getParameter("keyChapter");
        String[] course = null;
        String[] chapter = null;
        if (!c.isEmpty()) {
            course = c.split(",");
        }
        if (!ch.isEmpty()) {
            chapter = ch.split(",");
        }
        List<Question> list = qb.getQuestionBySubject(sid, course, chapter);
        Gson gson = new Gson();
        String listQuestion = gson.toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(listQuestion);
    }

}
