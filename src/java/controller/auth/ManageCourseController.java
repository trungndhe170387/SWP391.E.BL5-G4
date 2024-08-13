
package controller.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.CourseDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import model.Account;
import model.Course;

/**
 *
 * @author lam12
 */
@MultipartConfig
@WebServlet(name = "ManageCourseController", urlPatterns = {"/managecourse"})
public class ManageCourseController extends BaseRequiredAuthorizationController {

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonObject jsonobj = new JsonObject();
        String savePath = "D:/FPTU/Sem5/SWP391/ImageRepository/";
        File file = new File(savePath);
        if (!file.exists()) {
            file.mkdirs();
        }
        String course_name = request.getParameter("course_name");
        String course_no = request.getParameter("course_no");
        String course_id = request.getParameter("course_id");
        Part filePart = request.getPart("image");
        String imageName = null;
        if (filePart.getSize() > 0) {
            imageName = filePart.getSubmittedFileName();
            file = new File(savePath + imageName);
            try ( InputStream fileContent = filePart.getInputStream();  FileOutputStream fos = new FileOutputStream(file)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
            }
        }
        CourseDAO cd = new CourseDAO();
        String status;
        boolean isSuceed = cd.updateCourse(course_name, imageName, course_no, course_id);
        if (isSuceed) {
            status = "Update successful";
        } else {
            status = "Update failed";
        }

        jsonobj.addProperty("status", status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String course_id = request.getParameter("course_id");
        JsonObject jsonobj = new JsonObject();
        String status;
        CourseDAO cd = new CourseDAO();
        boolean isSuceed = cd.deleteCourse(course_id);
        if (isSuceed) {
            status = "Successfull";
        } else {
            status = "Failed";
        }
        jsonobj.addProperty("status", status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        String subject_id = (String) session.getAttribute("subject_id");
        CourseDAO cd = new CourseDAO();
        List<Course> listC = cd.getAllCourseBySubjectId(subject_id);

        Gson gson = new Gson();
        String list = gson.toJson(listC);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(list);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CourseDAO cd = new CourseDAO();
        JsonObject jsonobj = new JsonObject();
        String savePath = "D:/FPTU/Sem5/SWP391/ImageRepository/";
        File file = new File(savePath);
        if (!file.exists()) {
            file.mkdirs();
        }
        String subject_id = (String) session.getAttribute("subject_id");
        String course_no = request.getParameter("course_no");
        String course_name = request.getParameter("course_name");
        Part filePart = request.getPart("image");
        String imageName = filePart.getSubmittedFileName();
        file = new File(savePath + imageName);
        try ( InputStream fileContent = filePart.getInputStream();  FileOutputStream fos = new FileOutputStream(file)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }
        String status;
        boolean isSuceed = cd.addCourse(course_name, imageName, subject_id, course_no);
        if (isSuceed) {
            status = "Thanh Cong";
        } else {
            status = "That Bai";
        }
        jsonobj.addProperty("status", status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

}
