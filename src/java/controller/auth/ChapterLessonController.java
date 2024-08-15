
package controller.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.ChapterDAO;
import dto.LessonDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Chapter;
import model.Lesson;

/**
 *
 * @author lam12
 */
@WebServlet(name = "ChapterLessonController", urlPatterns = {"/chapterlesson"})
public class ChapterLessonController extends BaseRequiredAuthorizationController {

 

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        JsonObject jsonobj = new JsonObject();
        Gson gson = new Gson();
        String course_id = request.getParameter("course_id");
        ChapterDAO chapDAO = new ChapterDAO();
        LessonDAO lessonDAO = new LessonDAO();
        List<Chapter> chapList = chapDAO.getListChapterByCourse_id(course_id);
        List<Lesson> lessonList = lessonDAO.getAllLessonByCourseId(course_id);

        String listChapter = gson.toJson(chapList);
        String listLesson = gson.toJson(lessonList);
        jsonobj.addProperty("listChapter", listChapter);
        jsonobj.addProperty("listLesson", listLesson);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
    }

}
