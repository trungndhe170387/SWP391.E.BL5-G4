
package controller.auth;

import dto.SliderDAO;
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
import model.Slider;

/**
 *
 * @author Admin
 */
@MultipartConfig

@WebServlet(name = "EditSliderController", urlPatterns = {"/slideredit"})
public class EditSliderController extends BaseRequiredAuthorizationController {

  

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        SliderDAO dao = new SliderDAO();
        String id_raw = request.getParameter("id");
        Slider s = dao.getSliderEditByID(id_raw);
        request.setAttribute("sid", id_raw);
        request.setAttribute("s", s);
        request.getRequestDispatcher("slideredit.jsp").forward(request, response);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String mess = null;
        String imageName = null;
        String savePath = "G:/Study/FU_FPT/Test/image";
        File file = new File(savePath);
        if (!file.exists()) {
            file.mkdirs();
        }

        SliderDAO dao = new SliderDAO();

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Part filePart = request.getPart("image");
        String link = request.getParameter("link");
        String endtime = request.getParameter("endtime");
        String status = request.getParameter("status");
        String marketer_id = request.getParameter("marketer_id");
        String type = request.getParameter("type");

        String id_raw = request.getParameter("id");
        request.setAttribute("sid", id_raw);

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

        boolean isSuccess = dao.editSlider(imageName, title, status, link, marketer_id, type, endtime, description, id_raw);
        if (isSuccess) {
            mess = "Update successful";
        } else {
            mess = "Update failed";
        }

        Slider s = dao.getSliderEditByID(id_raw);

        request.setAttribute("s", s);
        request.setAttribute("mess", mess);

        request.getRequestDispatcher("slideredit.jsp").forward(request, response);
    }

}
