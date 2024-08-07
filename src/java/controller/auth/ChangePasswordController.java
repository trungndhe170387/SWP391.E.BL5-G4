package controller.auth;

import dto.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

import security.MD5Encryption;

/**
 *
 * @author HoangAnh
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = "/changepassword")
public class ChangePasswordController extends BaseRequiredAuthorizationController {

    private static final String PASSWORD_REGEX = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%]).{8,20}";


    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (acc == null) {
            response.sendRedirect("Login.jsp");
        } else {
            response.sendRedirect("ChangePassword.jsp");;
        }

    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {

        String username = request.getParameter("username");
        String oldPass = request.getParameter("oldPassword");
        String newPass = request.getParameter("newPassword");
        String newPass_raw = newPass;
        String confirmPass = request.getParameter("confirmPassword");
        String curPass = request.getParameter("curPass");
        try {
            oldPass = new MD5Encryption().convertPassword(oldPass);
            newPass = new MD5Encryption().convertPassword(newPass);
            confirmPass = new MD5Encryption().convertPassword(confirmPass);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ChangePasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!oldPass.equals(curPass)) {
            request.setAttribute("err", "Your old password is not correct");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
        } else if (newPass.equals(oldPass)) {
            request.setAttribute("err", "New password must be different from old password");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
        } else if (!newPass.equals(confirmPass)) {
            request.setAttribute("err", "Confirm password is incorrect");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
        } else if (!newPass_raw.matches(PASSWORD_REGEX)) {
            request.setAttribute("err", "Your password must has at least 8 characters and contain uppercase, lowercase, number and specical syntax (!, @, #, $, %)");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
        } else {
            AccountDAO ad = new AccountDAO();
            ad.changePassword(username, newPass);
            request.setAttribute("mess", "Your password has been changed successfully");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

}
