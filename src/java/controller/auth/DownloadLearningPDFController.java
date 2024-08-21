package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import model.Account;

/**
 *
 * @author admin
 */
@WebServlet(name = "DownloadLearningPDFController", urlPatterns = {"/downloadlearningpdf"})
public class DownloadLearningPDFController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String filename = request.getParameter("filename");
        
        // Kiểm tra xem filename có được truyền không
        if (filename == null || filename.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Filename is missing.");
            return;
        }

        String filePath = "G:/Study/FU_FPT/Test/" + filename; // Đảm bảo đường dẫn đúng
        File file = new File(filePath);

        // Kiểm tra xem file có tồn tại không
        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found.");
            return;
        }

        try (FileInputStream fis = new FileInputStream(file);
             OutputStream os = response.getOutputStream()) {
             
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
            System.out.println("Downloading file: " + file.getName());

            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error while downloading file.");
            e.printStackTrace();
        }
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        // Phương thức POST không được sử dụng trong trường hợp này
    }
}
