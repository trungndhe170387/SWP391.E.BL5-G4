
package controller.auth;

import dto.RegistrationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;
import model.OrderSubject;

/**
 *
 * @author hayha
 */
@WebServlet(name = "BuySubjectController", urlPatterns = {"/buysubject"})
public class BuySubjectController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        if (acc == null) {
            response.sendRedirect("Login.jsp");
        } else {
            boolean productExisted = false;
            Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }
            String tsubject_id = request.getParameter("subject_id");
            int subject_id;

            try {
                subject_id = Integer.parseInt(tsubject_id);

                RegistrationDAO reg = new RegistrationDAO();
                OrderSubject od = reg.getSubjectbyId(subject_id);
                int category_id = od.getCategory_id();
                double discount = od.getDiscount();
                double price = od.getPrice() * (1 - discount / 100);
                Item t = new Item(od, price);
                t.setCategory_id(category_id);

                for (Item existingItem : cart.getItems()) {
                    if (existingItem.getOrderSubject().getSubject_id() == t.getOrderSubject().getSubject_id()) {
                        productExisted = true;
                        break;
                    }
                }
                if (!productExisted) {
                    cart.addItem(t);
                }
            } catch (NumberFormatException e) {
            }
            if (productExisted) {
                request.setAttribute("productExistsMessage", "Subject already in the cart!");

            }

            List<Item> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("size", list.size());
            request.getRequestDispatcher("subjectlist").forward(request, response);

        }
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
