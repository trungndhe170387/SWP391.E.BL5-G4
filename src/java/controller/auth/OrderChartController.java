package controller.auth;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import com.google.gson.Gson;
import dto.RegistrationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Order;

@WebServlet(name = "OrderChartController", urlPatterns = {"/chart"})
public class OrderChartController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account loggedInAccount = (Account) session.getAttribute("account");

        if (loggedInAccount != null) {

            int lecturerId = loggedInAccount.getAccount_id();

            RegistrationDAO registrationDAO = new RegistrationDAO();
            List<Order> orders = registrationDAO.getOrdersByLecturerId(lecturerId);

            Map<Date, Double> orderInfoMap = new HashMap<>();
            for (Order order : orders) {
                Date orderDate = order.getOrderDate();
                Double totalMoney = order.getTotal_money();
                orderInfoMap.put(orderDate, totalMoney);
            }

            Set<Date> keySet = orderInfoMap.keySet();
            for (Date key : keySet) {
                System.out.println(key + " " + orderInfoMap.get(key));
            }

            String ordersJson = new Gson().toJson(orders);

            request.setAttribute("ordersJson", ordersJson);
            request.getRequestDispatcher("chart.jsp").forward(request, response);
        } else {

            response.sendRedirect("Login.jsp");
        }
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
