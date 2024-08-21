
package controller.auth;

import dto.SliderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DeleteSliderController", urlPatterns = {"/sliderdelete"})
public class DeleteSliderController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        SliderDAO dao = new SliderDAO();
        dao.deleteSlider(id_raw);
        response.sendRedirect("slider_marketer");
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
    }

}
