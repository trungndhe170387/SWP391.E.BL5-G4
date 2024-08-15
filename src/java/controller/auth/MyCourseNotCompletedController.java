
package controller.auth;

import dto.SliderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Learner_Subject;
import model.Slider;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MyCourseNotCompletedController", urlPatterns = {"/mycoursenotcompleted"})
public class MyCourseNotCompletedController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        //processRequest(request, response);
        SliderDAO sdao = new SliderDAO();
        List<Slider> listS1 = sdao.getAllSliderSubject();
        HttpSession session = request.getSession();
        String learner_id = acc.getAccount_id() + "";
        List<Learner_Subject> listLS = sdao.getAllMyCourseNotCompleted(learner_id);
        request.setAttribute("listLS", listLS);

//        Gson gson = new Gson();
//        String list1 = gson.toJson(listB);
//        String listS = gson.toJson(listS1);
//        String listLs1 = gson.toJson(listLs);       
        request.setAttribute("listS1", listS1);
//        JsonObject jsonobj = new JsonObject();
//        jsonobj.addProperty("list1", list1);
//        jsonobj.addProperty("listLs1", listLs1);
//        jsonobj.addProperty("listS", listS);
//        
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write(jsonobj.toString());
        request.getRequestDispatcher("mycoursenotcompleted.jsp").forward(request, response);
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
