package controller.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.LessonDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import model.Account;
import model.Lesson;

/**
 *
 * @author lam12
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/managelesson"})
public class ManageLessonController extends BaseRequiredAuthorizationController {

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status;
        String savePath = "D:/FPTU/Sem5/SWP391/uploadDocument/";
        LessonDAO lessonDAO = new LessonDAO();
        Gson gson = new Gson();
        JsonObject jsonobj = new JsonObject();
        File file = new File(savePath);
        if (!file.exists()) {
            file.mkdirs();
        }
        String lesson_no = request.getParameter("update_lesson_no");
        String lesson_name = request.getParameter("lesson_name");
        String description = request.getParameter("description");
        String lesson_id = request.getParameter("lesson_id");
        String video = request.getParameter("video");
        Part filePart = request.getPart("document");
        String fileName = null;
        if (filePart.getSize() > 0) {
            fileName = filePart.getSubmittedFileName();
            file = new File(savePath + fileName);
            try ( InputStream fileContent = filePart.getInputStream();  FileOutputStream fos = new FileOutputStream(file)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
            } catch (Exception e) {
            }
        }
        String documentpath = request.getParameter("documentpath");
        if (fileName != null) {
            documentpath = savePath + fileName;
        }
        Lesson lesson;
        String type = request.getParameter("type");
        if (type.equals("document")) {
            lesson = lessonDAO.updateLesson(lesson_no, lesson_name, null, documentpath, description, lesson_id);
        } else if (type.equals("video")) {
            lesson = lessonDAO.updateLesson(lesson_no, lesson_name, video, null, description, lesson_id);
        } else {
            lesson = lessonDAO.updateLesson(lesson_no, lesson_name, video, documentpath, description, lesson_id);
        }
        if (lesson != null) {
            status = "Success";
        } else {
            status = "Failed";
        }
        String updatedLesson = gson.toJson(lesson);
        status = gson.toJson(status);
        jsonobj.addProperty("updatedLesson", updatedLesson);
        jsonobj.addProperty("status", status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lesson_id = request.getParameter("lesson_id");
        LessonDAO lessDAO = new LessonDAO();
        Gson gson = new Gson();
        JsonObject jsonobj = new JsonObject();
        String status;
        boolean isSuceed = lessDAO.deleteLesson(lesson_id);
        if (isSuceed) {
            status = "Successfull";
        } else {
            status = "Failed";
        }
        status = gson.toJson(status);
        jsonobj.addProperty("status", status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String status;
        String savePath = "D:/FPTU/Sem5/SWP391/uploadDocument/";
        LessonDAO lessonDAO = new LessonDAO();
        Gson gson = new Gson();
        JsonObject jsonobj = new JsonObject();
        File file = new File(savePath);
        if (!file.exists()) {
            file.mkdirs();
        }
        String lesson_no = request.getParameter("add_lesson_no");
        String lesson_name = request.getParameter("lesson_name");
        String description = request.getParameter("description");
        String chapter_id = request.getParameter("chapter_id");
        String video = request.getParameter("video");
        if (video.equals("")) {
            video = null;
        }
        Part filePart = request.getPart("document");
        String fileName = null;
        if (filePart.getSize() > 0) {
            fileName = filePart.getSubmittedFileName();
            file = new File(savePath + fileName);
            try ( InputStream fileContent = filePart.getInputStream();  FileOutputStream fos = new FileOutputStream(file)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
            } catch (Exception e) {
            }
        }
        String documentpath = null;
        if (fileName != null) {
            documentpath = savePath + fileName;
        }
        Lesson lesson = lessonDAO.addLesson(lesson_no, lesson_name, video, documentpath, chapter_id, description);
        if (lesson != null) {
            status = "Success";
        } else {
            status = "Failed";
        }
        String insertedLesson = gson.toJson(lesson);
        status = gson.toJson(status);
        jsonobj.addProperty("insertedLesson", insertedLesson);
        jsonobj.addProperty("status", status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

}
