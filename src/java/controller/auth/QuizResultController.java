package controller.auth;

import dto.AccountDAO;
import dto.Chapter1DAO;
import dto.ChapterDAO;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Chapter;
import model.Course;
import model.Learner_Chapter;
import model.Learner_Course;
import model.Learner_Lesson;
import model.Learner_Subject;
import model.Lesson;
import model.QuestionL;
import model.Quiz;
import model.QuizResult;
import model.Subject;
import utils.EmailUtils1;

/**
 *
 * @author lam12
 */
@WebServlet(name = "QuizResultController", urlPatterns = {"/quiz-result"})
public class QuizResultController extends BaseAuthenticationController {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
HttpSession session = request.getSession();
        String subject_id_raw = request.getParameter("subject_id");
        String course_id_raw = request.getParameter("course_id");
        String chapter_id_raw = request.getParameter("chapter_id");
        String quiz_id_raw = request.getParameter("quiz_id");
        String category_id_raw = request.getParameter("category_id");
        Subject1DAO s = new Subject1DAO();
        Course1DAO c = new Course1DAO();
        AccountDAO d = new AccountDAO();
        Chapter1DAO ch = new Chapter1DAO();
        ChapterDAO cd = new ChapterDAO();
        Lesson1DAO l = new Lesson1DAO();
        Quiz1DAO q = new Quiz1DAO();
        Account a = (Account) session.getAttribute("account");
        try {
            int subject_id = Integer.parseInt(subject_id_raw);
            int course_id = Integer.parseInt(course_id_raw);
            int chapter_id = Integer.parseInt(chapter_id_raw);
            int quiz_id = Integer.parseInt(quiz_id_raw);
            int category_id = Integer.parseInt(category_id_raw);
            Subject subject = s.getSubject(subject_id);
            Course course = c.getCourseByCourseId(subject_id, course_id);
            Account account = d.getAccountProfile(subject.getLecturer_id());

            List<Chapter> listChapter = ch.getChapterByCourseId(course_id);
            List<Lesson> listLesson = l.getLessonByCourseId(course_id);

            List<Quiz> listQuiz = q.getQuizByCourseId(course_id);
            List<Learner_Lesson> listLearnerLesson = l.getLearnerLessonByCourseId(course_id, a.getAccount_id());
            List<QuizResult> listQuizResult = q.getStatusByCourseId(course_id, a.getAccount_id());
            List<Learner_Chapter> listLearnerChapter = ch.getLearnerChapterByCourseId(course_id, a.getAccount_id());
            Learner_Course learnercourse = c.getLearnerCourseByCourseId(a.getAccount_id(), course_id);
            Learner_Subject learnersubject = s.getLearnerSubjectBySubjectId(a.getAccount_id(), subject_id);

            Map<Integer, Integer> quizTaken = new HashMap<>();
            double mark = 0;
            int numberCorretAnswer = 0;
            List<QuestionL> listQues = (ArrayList<QuestionL>) session.getAttribute("quiz");
            Map<Integer, Integer> quizResult = (HashMap<Integer, Integer>) session.getAttribute("quizResult");
            for (Map.Entry<Integer, Integer> entry : quizResult.entrySet()) {
                String answer_raw = request.getParameter(entry.getKey() + "");
                if (answer_raw != null) {
                    int answer = Integer.parseInt(answer_raw);
                    quizTaken.put(entry.getKey(), answer);
                    if (answer == entry.getValue()) {
                        numberCorretAnswer++;
                    }
                }
            }
            mark = 1.00 * 10 / quizResult.size() * numberCorretAnswer;

            int status = (mark >= 5) ? 1 : 0;
            cd.updateQuizResult(a.getAccount_id() + "", quiz_id + "", mark, status + "");

            Learner_Lesson ls = new Learner_Lesson();
            ls.setLearner_id(a.getAccount_id());
            l.updateStatusLesson(ls);
            int lessonchapter = l.getNumberLessonInChapter(chapter_id);
            int lessondone = l.getNumberLessonDoneInChapter(chapter_id, a.getAccount_id());
            int quizchapter = q.getNumberQuizInChapter(chapter_id);
            int quizdone = q.getNumberQuizDoneInChapter(chapter_id, a.getAccount_id());
         
            if (lessonchapter == lessondone && quizchapter == quizdone) {
                Learner_Chapter chap = new Learner_Chapter();
                chap.setChapter_id(chapter_id);
                chap.setLearner_id(a.getAccount_id());
                ch.updateStatusChapter(chap);
            }
            String link = "http://localhost:9999/holalearn/getcoursecertificate?category_id=" + category_id + "&subject_id=" + subject_id + "&course_id=" + course_id;
            String coursecertificateletter = "Dear " + a.getFullname() + ",\n"
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
            int chapterdone = ch.getNumberChapterDoneInCourse(course_id, a.getAccount_id());
            if (chaptercourse == chapterdone) {
                Learner_Course cou = new Learner_Course();
                cou.setCourse_id(course_id);
                cou.setLearner_id(a.getAccount_id());
                c.updateStatusCourse(cou);
                EmailUtils1.sendEmail(a.getEmail(), "Hola Learn", coursecertificateletter);

            }
            String links = "http://localhost:9999/holalearn/getcoursecertificate?category_id=" + category_id + "&subject_id=" + subject_id;
            String subjectcertificateletter = "Dear " + a.getFullname() + ",\n"
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
            int coursedone = c.getNumberQuizDoneInChapter(subject_id, a.getAccount_id());
            if (coursedone == coursesubject) {
                Learner_Subject su = new Learner_Subject();
                su.setSubject_id(subject_id);
                su.setLearner_id(a.getAccount_id());
                s.updateStatusSubject(su);
                EmailUtils1.sendEmail(a.getEmail(), "Hola Learn", subjectcertificateletter);
            }
            request.setAttribute("listQues", listQues);
            request.setAttribute("mark", mark);
            request.setAttribute("numberCorretAnswer", numberCorretAnswer);
            request.setAttribute("quizTaken", quizTaken);

            session.setAttribute("chapter_id", chapter_id);
            session.setAttribute("quizResult", quizResult);

            request.setAttribute("category_id", category_id);
            request.setAttribute("learnersubject", learnersubject);
            request.setAttribute("learnercourse", learnercourse);
            request.setAttribute("listLearnerChapter", listLearnerChapter);
            request.setAttribute("listQuizResult", listQuizResult);
            request.setAttribute("listLearnerLesson", listLearnerLesson);
            request.setAttribute("listQuiz", listQuiz);

            request.setAttribute("listChapter", listChapter);
            request.setAttribute("listLesson", listLesson);
            request.setAttribute("account", account);
            request.setAttribute("subject", subject);
            request.setAttribute("course", course);

            request.setAttribute("chapter_id", chapter_id);
            request.getRequestDispatcher("quizresult.jsp").forward(request, response);

        } catch (Exception e) {
        }    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
