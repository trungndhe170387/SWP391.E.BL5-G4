
package controller.auth;

import dto.AccountDAO;
import dto.Chapter1DAO;
import dto.Course1DAO;
import dto.Lesson1DAO;
import dto.Quiz1DAO;
import dto.Subject1DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Chapter;
import model.Course;
import model.Lesson;
import model.Quiz;
import model.Subject;

/**
 *
 * @author admin
 */
@WebServlet(name = "CourseDetailController", urlPatterns = {"/coursedetail"})
public class CourseDetailController extends BaseRequiredAuthorizationController {

    
    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String subject_id_raw = request.getParameter("subject_id");
        String course_id_raw = request.getParameter("course_id");
        String category_id_raw = request.getParameter("category_id");
        Subject1DAO s = new Subject1DAO();
        Course1DAO c = new Course1DAO();
        AccountDAO d = new AccountDAO();
        Chapter1DAO ch = new Chapter1DAO();
        Lesson1DAO l = new Lesson1DAO();
        Quiz1DAO q = new Quiz1DAO();
        try {
            int subject_id = Integer.parseInt(subject_id_raw);
            int course_id = Integer.parseInt(course_id_raw);
            int category_id = Integer.parseInt(category_id_raw);
            Subject subject = s.getSubject(subject_id);
            Course course = c.getCourseByCourseId(subject_id, course_id);
            Account account = d.getAccountProfile(subject.getLecturer_id());
            List<Chapter> listChapter = ch.getChapterByCourseId(course_id);
            List<Lesson> listLesson = l.getLessonByCourseId(course_id);
            List<Quiz> listQuiz = q.getQuizByCourseId(course_id);
            request.setAttribute("listQuiz", listQuiz);
            request.setAttribute("listChapter", listChapter);
            request.setAttribute("listLesson", listLesson);
            request.setAttribute("account", account);
            request.setAttribute("subject", subject);
            request.setAttribute("course", course);
            request.setAttribute("category_id", category_id);
            request.getRequestDispatcher("coursedetail.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
    }

}
