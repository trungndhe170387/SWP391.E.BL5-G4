
package controller.auth;

import dto.AccountDAO;
import dto.Chapter1DAO;
import dto.CommentDAO;
import dto.Course1DAO;
import dto.Lesson1DAO;
import dto.Quiz1DAO;
import dto.Subject1DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Course;
import model.Learner_Chapter;
import model.Learner_Course;
import model.Learner_Lesson;
import model.Learner_Subject;
import model.Subject;
import utils.EmailUtils1;

/**
 *
 * @author admin
 */
@WebServlet(name = "MarkAsDoneController", urlPatterns = {"/done"})
public class MarkAsDoneController extends BaseRequiredAuthorizationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String lesson_id_raw = request.getParameter("lesson_id");
        String course_id_raw = request.getParameter("course_id");
        String subject_id_raw = request.getParameter("subject_id");
        String chapter_id_raw = request.getParameter("chapter_id");
        String category_id_raw = request.getParameter("category_id");
        Subject1DAO s = new Subject1DAO();
        Course1DAO c = new Course1DAO();
        AccountDAO d = new AccountDAO();
        Chapter1DAO ch = new Chapter1DAO();
        Lesson1DAO l = new Lesson1DAO();
        CommentDAO cm = new CommentDAO();
        Quiz1DAO q = new Quiz1DAO();
        int lesson_id = Integer.parseInt(lesson_id_raw);
        int course_id = Integer.parseInt(course_id_raw);
        int subject_id = Integer.parseInt(subject_id_raw);
        int chapter_id = Integer.parseInt(chapter_id_raw);
        int category_id = Integer.parseInt(category_id_raw);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        Learner_Lesson ls = new Learner_Lesson();
        ls.setLearner_id(account.getAccount_id());
        ls.setLesson_id(lesson_id);
        l.updateStatusLesson(ls);
        int lessonchapter = l.getNumberLessonInChapter(chapter_id);
        int lessondone = l.getNumberLessonDoneInChapter(chapter_id, account.getAccount_id());
        int quizchapter = q.getNumberQuizInChapter(chapter_id);
        int quizdone = q.getNumberQuizDoneInChapter(chapter_id, account.getAccount_id());
        Course course = c.getCourseByCourseId(subject_id, course_id);
        Subject subject = s.getSubject(subject_id);
        if (lessonchapter == lessondone && quizchapter == quizdone) {
            Learner_Chapter chap = new Learner_Chapter();
            chap.setChapter_id(chapter_id);
            chap.setLearner_id(account.getAccount_id());
            ch.updateStatusChapter(chap);
        }
        String link = "http://localhost:9999/holalearn/getcoursecertificate?category_id=" + category_id + "&subject_id=" + subject_id + "&course_id=" + course_id;
        String coursecertificateletter = "Dear " + account.getFullname() + ",\n"
                + "\n"
                + "Congratulations on successfully completing the " + course.getCourse_name() + " course!\n"
                + "\n"
                + "As your instructor, I'm delighted to see you complete this milestone. You've worked very hard over the past [duration of course] and should feel proud of yourself.\n"
                + "\n"
                + "Throughout the course, you consistently demonstrated curiosity, focus and perseverance. Your thoughtful contributions during class enriched our discussions and pushed everyone’s thinking forward.\n"
                + "\n"
                + "Beyond the academic skills, I’m glad to see you develop greater confidence in yourself and your abilities. These personal growths are so valuable and will help you in your future endeavors.\n"
                + "\n"
                + "We covered a lot of ground together, from [key topics covered]. I hope these lessons provide a solid foundation as you continue pursuing your goals and passions.\n"
                + "\n"
                + "Thank you for being a wonderful student. It was my privilege to guide you on this journey of learning and self-discovery. I wish you all the best as you move forward to new challenges and achievements.\n"
                + "\n"
                + "Please keep in touch and let me know if I can be of assistance. I hope our paths cross again soon.\n"
                + "\n"
                + "Warm regards,\n"
                + "" + subject.getLecturer_name() + " \nhere is your Course certificate link: " + link;
        int chaptercourse = ch.getNumberChapterInCourse(course_id);
        int chapterdone = ch.getNumberChapterDoneInCourse(course_id, account.getAccount_id());
        if (chaptercourse == chapterdone) {
            Learner_Course cou = new Learner_Course();
            cou.setCourse_id(course_id);
            cou.setLearner_id(account.getAccount_id());
            c.updateStatusCourse(cou);
            EmailUtils1.sendEmail(account.getEmail(), "Hola Learn", coursecertificateletter);

        }
        String links = "http://localhost:9999/holalearn/getcoursecertificate?category_id=" + category_id + "&subject_id=" + subject_id;
        String subjectcertificateletter = "Dear " + account.getFullname() + ",\n"
                + "\n"
                + "Congratulations on successfully completing the " + subject.getSubject_name() + " subject!\n"
                + "\n"
                + "As your instructor, I'm delighted to see you complete this milestone. You've worked very hard over the past [duration of course] and should feel proud of yourself.\n"
                + "\n"
                + "Throughout the course, you consistently demonstrated curiosity, focus and perseverance. Your thoughtful contributions during class enriched our discussions and pushed everyone’s thinking forward.\n"
                + "\n"
                + "Beyond the academic skills, I’m glad to see you develop greater confidence in yourself and your abilities. These personal growths are so valuable and will help you in your future endeavors.\n"
                + "\n"
                + "We covered a lot of ground together, from [key topics covered]. I hope these lessons provide a solid foundation as you continue pursuing your goals and passions.\n"
                + "\n"
                + "Thank you for being a wonderful student. It was my privilege to guide you on this journey of learning and self-discovery. I wish you all the best as you move forward to new challenges and achievements.\n"
                + "\n"
                + "Please keep in touch and let me know if I can be of assistance. I hope our paths cross again soon.\n"
                + "\n"
                + "Warm regards,\n"
                + "" + subject.getLecturer_name() + " \nhere is your Subject certificate link:" + links;
        int coursesubject = c.getNumberCourseInSubject(subject_id);
        int coursedone = c.getNumberQuizDoneInChapter(subject_id, account.getAccount_id());
        if (coursedone == coursesubject) {
            Learner_Subject su = new Learner_Subject();
            su.setSubject_id(subject_id);
            su.setLearner_id(account.getAccount_id());
            s.updateStatusSubject(su);
            EmailUtils1.sendEmail(account.getEmail(), "Hola Learn", subjectcertificateletter);
        }
        response.sendRedirect("learning?category_id=" + category_id + "&subject_id=" + subject_id + "&course_id=" + course_id + "&chapter_id=" + chapter_id + "&lesson_id=" + lesson_id);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
