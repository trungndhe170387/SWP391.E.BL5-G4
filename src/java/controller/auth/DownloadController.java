
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
 * @author HoangAnh
 */
@WebServlet(name = "DownloadController", urlPatterns = {"/download"})
public class DownloadController extends BaseRequiredAuthorizationController {

   
    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String filePath = "G:/Study/FU_FPT/Test/TemplateImportQuestions.xlsx";
        File file = new File(filePath);
        FileInputStream fis = new FileInputStream(file);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
        System.out.println(file.getName());
        OutputStream os = response.getOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = fis.read(buffer)) != -1) {
            os.write(buffer, 0, bytesRead);
        }
        os.close();
        fis.close();
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
    }

}
