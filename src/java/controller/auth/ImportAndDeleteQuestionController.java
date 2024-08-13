
package controller.auth;

import com.google.gson.Gson;
import dto.QuestionBankDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author HoangAnh
 */
@MultipartConfig
@WebServlet(name = "ImportQuestionController", urlPatterns = {"/importquestion"})
public class ImportAndDeleteQuestionController extends BaseRequiredAuthorizationController {

    private static final QuestionBankDAO qb = new QuestionBankDAO();

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subject = request.getParameter("id");
        String chapter = request.getParameter("questionChapter");
        String content = request.getParameter("content");
        String op1 = request.getParameter("op1");
        String op2 = request.getParameter("op2");
        String op3 = request.getParameter("op3");
        String op4 = request.getParameter("op4");
        String answer = request.getParameter("answer");
        String level = request.getParameter("level");
        qb.addOneQuestion(content, op1, op2, op3, op4, answer, chapter, subject, level);
        Gson gson = new Gson();
        String listQuestion = gson.toJson("Hello");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(listQuestion);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String q = request.getParameter("questionId");
        if (!q.isEmpty()) {
            String[] qid = q.split(",");
            qb.deleteQuestion(qid);
        }
        // send to ajax
        Gson gson = new Gson();
        String listQuestion = gson.toJson("Hello");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(listQuestion);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String questionChapter = request.getParameter("questionChapter");
        String id = request.getParameter("id");
        String savePath = "D:/FPTU/Sem5/SWP391/UploadQuestion/";
        String fileName = "";
        File file = new File(savePath);
        if (!file.exists()) {
            file.mkdirs();
        }
        Part filePart = request.getPart("fileQuestion");
        if (filePart.getSize() > 0) {
            fileName = filePart.getSubmittedFileName();
            file = new File(savePath + fileName);
            try ( InputStream fileContent = filePart.getInputStream();  FileOutputStream fos = new FileOutputStream(file)) {
                // Copy dữ liệu
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
            }
        }
        List<Integer> listError = new ArrayList<>();
        if (!id.isEmpty() && !questionChapter.isEmpty()) {
            listError = qb.importQuestion(fileName, questionChapter, id);
        }

        Gson gson = new Gson();
        String listE = gson.toJson(listError);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(listE);
    }

}
