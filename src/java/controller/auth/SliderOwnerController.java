package controller.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.SliderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Slider;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SliderOwnerController", urlPatterns = {"/slider_marketer"})
public class SliderOwnerController extends BaseRequiredAuthorizationController {


    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        request.getRequestDispatcher("slider_marketer.jsp").forward(request, response);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        SliderDAO dao = new SliderDAO();
        HttpSession session = request.getSession();
        String makerter_id = acc.getAccount_id() + "";
        List<Slider> listS = dao.getAllSliderByOwner(makerter_id);

        Gson gson = new Gson();
        String list1 = gson.toJson(listS);
        JsonObject jsonobj = new JsonObject();
        jsonobj.addProperty("list1", list1);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

}
