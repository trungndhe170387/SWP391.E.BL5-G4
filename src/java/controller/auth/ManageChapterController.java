
package controller.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.ChapterDAO;
import dto.Quiz2DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Chapter;

@MultipartConfig
@WebServlet(name = "ManageChapterController", urlPatterns = {"/managechapter"})
public class ManageChapterController extends BaseRequiredAuthorizationController {

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject jsonobj = new JsonObject();
        String chapter_no = request.getParameter("chapter_no");
        String chapter_name = request.getParameter("chapter_name");
        String chapter_id = request.getParameter("chapter_id");
        String numQuestion = request.getParameter("numQuestion");
        ChapterDAO chapDAO = new ChapterDAO();
        Chapter chapter = chapDAO.updateChapter(chapter_no, chapter_name, chapter_id, numQuestion);
        String status;
        if (chapter != null) {
            status = "Success";
        } else {
            status = "Failed";
        }
        String updatedChapter = gson.toJson(chapter);
        status = gson.toJson(status);
        jsonobj.addProperty("updatedChapter", updatedChapter);
        jsonobj.addProperty("status", status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject jsonobj = new JsonObject();
        String chapter_id = request.getParameter("chapter_id");
        ChapterDAO chapDAO = new ChapterDAO();
        boolean isSuceed = chapDAO.deleteChapter(chapter_id);
        String status;
        if (isSuceed) {
            status = "Success";
        } else {
            status = "Failed";
        }
        status = gson.toJson(status);
        jsonobj.addProperty("status", status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        ChapterDAO cd = new ChapterDAO();
        Quiz2DAO q2d = new Quiz2DAO();
        Gson gson = new Gson();
        JsonObject jsonobj = new JsonObject();
        String action = request.getParameter("action");
        if (action.equals("getNumberQues")) {
            String chapter_id = request.getParameter("chapter_id");
            int number = q2d.getNumberQuestionOfQuiz(chapter_id);
            String numOfQues = gson.toJson(number);
            jsonobj.addProperty("numOfQues", numOfQues);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonobj.toString());
        } else {
            String selectedNumQues_raw = request.getParameter("numQuestion");
            String chapter_id = request.getParameter("chapter_id");
            String message = null;
            int numOfQuestion = cd.getNumberQuestionOfChapter(chapter_id);
            try {
                int selectedNumQues = Integer.parseInt(selectedNumQues_raw);
                if (selectedNumQues > numOfQuestion) {
                    message = "The number of questions in the bank is not enough to create a quiz with the number of questions you choose";
                } else {
                    if (!cd.checkNumberLevelQuestion(selectedNumQues_raw, chapter_id)) {
                        message = "The number of questions of each level in the bank is not enough to create a quiz with the number of questions you choose";
                    }
                }
                message = gson.toJson(message);
                jsonobj.addProperty("message", message);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());
            } catch (NumberFormatException e) {
            }
        }
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject jsonobj = new JsonObject();
        ChapterDAO chapDAO = new ChapterDAO();
        String chapter_no = (String) request.getParameter("chapter_no");
        String chapter_name = (String) request.getParameter("chapter_name");
        String course_id = (String) request.getParameter("course_id");
        Chapter chapter = chapDAO.addNewChapter(chapter_no, chapter_name, course_id);
        String status;
        if (chapter != null) {
            status = "Success";
        } else {
            status = "Failed";
        }
        String insertedChapter = gson.toJson(chapter);
        status = gson.toJson(status);
        jsonobj.addProperty("insertedChapter", insertedChapter);
        jsonobj.addProperty("status", status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

}
