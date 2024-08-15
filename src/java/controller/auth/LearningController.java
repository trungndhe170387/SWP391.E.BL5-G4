
package controller.auth;

import dto.AccountDAO;
import dto.Chapter1DAO;
import dto.CommentDAO;
import dto.Course1DAO;
import dto.Lesson1DAO;
import dto.Quiz1DAO;
import dto.Subject1DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Chapter;
import model.Comment;
import model.Course;
import model.Learner_Chapter;
import model.Learner_Course;
import model.Learner_Lesson;
import model.Learner_Subject;
import model.Lesson;
import model.Quiz;
import model.QuizResult;
import model.Subject;

/**
 *
 * @author admin
 */
@WebServlet(name = "LearningController", urlPatterns = {"/learning"})
public class LearningController extends BaseRequiredAuthorizationController {

    
    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String subject_id_raw = request.getParameter("subject_id");
        String course_id_raw = request.getParameter("course_id");
        String chapter_id_raw = request.getParameter("chapter_id");
        String lesson_id_raw = request.getParameter("lesson_id");
        String category_id_raw = request.getParameter("category_id");
        Subject1DAO s = new Subject1DAO();
        Course1DAO c = new Course1DAO();
        AccountDAO d = new AccountDAO();
        Chapter1DAO ch = new Chapter1DAO();
        Lesson1DAO l = new Lesson1DAO();
        CommentDAO cm = new CommentDAO();
        Quiz1DAO q = new Quiz1DAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        try {
            int subject_id = Integer.parseInt(subject_id_raw);
            int course_id = Integer.parseInt(course_id_raw);
            int chapter_id = Integer.parseInt(chapter_id_raw);
            int lesson_id = Integer.parseInt(lesson_id_raw);
            int totalofcmt = cm.getTotalComment(lesson_id);
            int category_id = Integer.parseInt(category_id_raw);
            Subject subject = s.getSubject(subject_id);
            Course course = c.getCourseByCourseId(subject_id, course_id);
            Account account = d.getAccountProfile(subject.getLecturer_id());
            Lesson lesson = l.getLessonByLessonId(lesson_id);
            List<Chapter> listChapter = ch.getChapterByCourseId(course_id);
            List<Lesson> listLesson = l.getLessonByCourseId(course_id);
            List<Comment> listComment = cm.getTop5CommentByProductId(lesson_id);
            List<Quiz> listQuiz = q.getQuizByCourseId(course_id);
            List<Learner_Lesson> listLearnerLesson = l.getLearnerLessonByCourseId(course_id, a.getAccount_id());
            List<QuizResult> listQuizResult = q.getStatusByCourseId(course_id, a.getAccount_id());
            List<Learner_Chapter> listLearnerChapter = ch.getLearnerChapterByCourseId(course_id, a.getAccount_id());
            Learner_Course learnercourse = c.getLearnerCourseByCourseId(a.getAccount_id(), course_id);
            Learner_Subject learnersubject = s.getLearnerSubjectBySubjectId(a.getAccount_id(), subject_id);
            request.setAttribute("category_id", category_id);
            request.setAttribute("learnersubject", learnersubject);
            request.setAttribute("learnercourse", learnercourse);
            request.setAttribute("listLearnerChapter", listLearnerChapter);
            request.setAttribute("listQuizResult", listQuizResult);
            request.setAttribute("listLearnerLesson", listLearnerLesson);
            request.setAttribute("listQuiz", listQuiz);
            request.setAttribute("totalofcmt", totalofcmt);
            request.setAttribute("listComment", listComment);
            request.setAttribute("listChapter", listChapter);
            request.setAttribute("listLesson", listLesson);
            request.setAttribute("account", account);
            request.setAttribute("subject", subject);
            request.setAttribute("course", course);
            request.setAttribute("lesson", lesson);
            request.setAttribute("chapter_id", chapter_id);
            request.getRequestDispatcher("learning.jsp").forward(request, response);

        } catch (Exception e) {
        }
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
