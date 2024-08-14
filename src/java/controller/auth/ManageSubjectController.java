
package controller.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.SubjectDAO;
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
import model.Subject;

@MultipartConfig
@WebServlet(name = "ManageSubjectController", urlPatterns = {"/managesubject"})
public class ManageSubjectController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        int lecturer_id = acc.getAccount_id();
        SubjectDAO sd = new SubjectDAO();
        List<Subject> listS = sd.getAllSubjectByLecturerId(lecturer_id);

        Gson gson = new Gson();
        String list = gson.toJson(listS);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(list);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Gson gson = new Gson();
        JsonObject jsonobj = new JsonObject();
        SubjectDAO sd = new SubjectDAO();
        String savePath = "D:/FPTU/Sem5/SWP391/ImageRepository/";
        File file = new File(savePath);
        if (!file.exists()) {
            file.mkdirs();
        }

        String method = request.getParameter("method");
        if (method.equals("update")) {

            String imageName = null, status = null;
            double price = 0, discount = 0;
            int subject_id = 0, category_id = 0;
            String subject_id_raw = request.getParameter("subject_id");
            String subject_name = request.getParameter("subject_name");
            String description = request.getParameter("description");
            String price_raw = request.getParameter("price");
            String discount_raw = request.getParameter("discount");
            String category_id_raw = request.getParameter("category_id");
            System.out.println(description);
            System.out.println(subject_name);

            try {
                subject_id = Integer.parseInt(subject_id_raw);
                discount = Double.parseDouble(discount_raw);
                price = Double.parseDouble(price_raw);
                category_id = Integer.parseInt(category_id_raw);
                System.out.println(discount);
                System.out.println(price);
                System.out.println(category_id);
                System.out.println(subject_id);
                Part filePart = request.getPart("image");
                System.out.println(filePart);
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
                boolean isSuceed = sd.updateSubjectWithSubjectIDByLecturer(subject_name, description, imageName, discount, price, category_id, subject_id);
                if (isSuceed) {
                    status = "Update successful";
                } else {
                    status = "Update failed";
                }

                jsonobj.addProperty("status", status);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());

            } catch (NumberFormatException | IOException e) {
                status = "Khong hơp le";
                jsonobj.addProperty("status", status);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());
            }

        } else if (method.equals("delete")) {

            String status = null;
            String subject_id_raw = request.getParameter("subject_id");
            try {
                int subject_id = Integer.parseInt(subject_id_raw);
                boolean isSuceed = sd.deleteSubjectBySubjectId(subject_id);
                if (isSuceed) {
                    status = "Update successful";
                } else {
                    status = "Update failed";
                }
                jsonobj.addProperty("status", status);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());
            } catch (NumberFormatException e) {
            }

        } else if (method.equals("add")) {

      
            String imageName = null, status = null;
            double price = 0, discount = 0;
            int category_id = 0;
            String subject_name = request.getParameter("subject_name");
            String description = request.getParameter("description");
            String price_raw = request.getParameter("price");
            String category_id_raw = request.getParameter("category_id");
            String discount_raw = request.getParameter("discount");
            try {
                discount = Double.parseDouble(discount_raw);
                price = Double.parseDouble(price_raw);
                category_id = Integer.parseInt(category_id_raw);
                Part filePart = request.getPart("image");
                imageName = filePart.getSubmittedFileName();
                file = new File(savePath + imageName);
                try ( InputStream fileContent = filePart.getInputStream();  FileOutputStream fos = new FileOutputStream(file)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = fileContent.read(buffer)) != -1) {
                        fos.write(buffer, 0, bytesRead);
                    }
                }
                boolean isSucced = sd.addSubject(subject_name, description, imageName, price, discount, category_id, acc.getAccount_id());
                if (isSucced) {
                    status = "Thanh Cong";
                } else {
                    status = "That Bai";
                }
                jsonobj.addProperty("status", status);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());
            } catch (IOException | NumberFormatException e) {
                status = "Khong hơp le";
                jsonobj.addProperty("status", status);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());
            }

        } else if (method.equals("getSubjectBySubjectId")) {

            String subject_id_raw = request.getParameter("subject_id");
            try {
                int subject_id = Integer.parseInt(subject_id_raw);
                Subject sub = sd.getSubjectBySubjectId(subject_id);
                String subject = gson.toJson(sub);
                jsonobj.addProperty("subject", subject);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());
            } catch (NumberFormatException e) {
            }

        }
    }

}
