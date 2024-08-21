
package controller.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import model.Account;
import model.Comment;
import model.Comment_Report;
import utils.EmailUtils1;

/**
 *
 * @author admin
 */
@WebServlet(name = "CommentController", urlPatterns = {"/comment"})
public class CommentController extends BaseRequiredAuthorizationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String lesson_id_raw = request.getParameter("lesson_id");
        String amount_raw = request.getParameter("amount");
        CommentDAO cm = new CommentDAO();
        int lesson_id = Integer.parseInt(lesson_id_raw);
        int amount = Integer.parseInt(amount_raw);
        List<Comment> listc = cm.getNext5CommentByProductId(lesson_id, amount);
        for (Comment c : listc) {
            out.println("<div id=\"content\">\n"
                    + "                                        <c:forEach items=\"${requestScope.listComment}\" var=\"comment\">\n"
                    + "                                            <div class=\"media-body comment\">\n"
                    + "                                                <div class=\"mar-btm\">\n"
                    + "                                                    <img class=\"rounded-circle shadow-1-strong me-3\"\n"
                    + "                                                         src=\"data:image/jpeg;base64," + c.getAvatar() + "\"\" alt=\"avatar\" width=\"60\"\n"
                    + "                                                         height=\"60\" />\n"
                    + "                                                    <span class=\"btn-link text-semibold media-heading box-inline\"> " + c.getFullname() + ".&nbsp;&nbsp; <i class=\"fa fa-mobile fa-lg\"></i> " + c.getRole_name() + " - " + c.getComment_date() + "</span>\n"
                    + "                                                </div>\n"
                    + "                                                <p>" + c.getComment() + "</p>\n"
                    + "                                                <div class=\"pad-ver\">\n"
                    + "                                                    <div class=\"btn-group\">\n"
                    + "                                                        <a class=\"btn btn-sm btn-default btn-hover-success\" href=\"#\"><i class=\"fa fa-thumbs-up\"></i></a>\n"
                    + "                                                        <a class=\"btn btn-sm btn-default btn-hover-danger\" href=\"#\"><i class=\"fa fa-thumbs-down\"></i></a>\n"
                    + "                                                    </div>\n"
                    + "                                                    <a class=\"btn btn-sm btn-default btn-hover-primary\" href=\"#\">Comment</a>\n"
                    + "                                                </div>\n"
                    + "                                                <hr>\n"
                    + "                                            </div>\n"
                    + "                                        </c:forEach>\n"
                    + "\n"
                    + "                                    </div>");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doOptions(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
//processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        String lesson_id_raw = request.getParameter("lid");
        CommentDAO cm = new CommentDAO();
        try {
            int lesson_id = Integer.parseInt(lesson_id_raw);
            int totalofcmt = cm.getTotalComment(lesson_id);
            List<Comment> listComment = cm.getCommentByLessonId(lesson_id);
            Gson gson = new Gson();
            String list = gson.toJson(listComment);
            JsonObject jsonobj = new JsonObject();
            jsonobj.addProperty("totalofcmt", totalofcmt);
            jsonobj.addProperty("list", list);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonobj.toString());
        } catch (Exception e) {
        }
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        //processRequest(request, response);

        String action = request.getParameter("action");
        if (action.equals("add")) {
            CommentDAO cm = new CommentDAO();
            LocalDate curDate = LocalDate.now();
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            String lesson_id_raw = request.getParameter("lid");
            String lesson_comment = request.getParameter("comment");
            try {
                int lesson_id = Integer.parseInt(lesson_id_raw);
                Comment comment = new Comment();
                comment.setAccount_id(a.getAccount_id());
                comment.setLesson_id(lesson_id);
                comment.setComment(lesson_comment);
                comment.setComment_date(curDate.toString());
                comment.setStatus(1);
                cm.addCommentById(comment);
                int totalofcmt = cm.getTotalComment(lesson_id);
                List<Comment> listComment = cm.getCommentByLessonId(lesson_id);
                Gson gson = new Gson();
                String list = gson.toJson(listComment);
                JsonObject jsonobj = new JsonObject();
                jsonobj.addProperty("totalofcmt", totalofcmt);
                jsonobj.addProperty("list", list);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());

            } catch (Exception e) {
            }
        } else if (action.equals("edit")) {
            CommentDAO cm = new CommentDAO();
            LocalDate curDate = LocalDate.now();
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            String lesson_id_raw = request.getParameter("lid");
            String comment_id_raw = request.getParameter("cmtid");
            String lesson_comment = request.getParameter("commentedited");
            try {
                int lesson_id = Integer.parseInt(lesson_id_raw);
                int comment_id = Integer.parseInt(comment_id_raw);
                Comment comment = new Comment();
                comment.setComment_id(comment_id);
                comment.setAccount_id(a.getAccount_id());
                comment.setLesson_id(lesson_id);
                comment.setComment(lesson_comment);
                comment.setComment_date(curDate.toString());
                cm.updateCommentById(comment);
                int totalofcmt = cm.getTotalComment(lesson_id);
                List<Comment> listComment = cm.getCommentByLessonId(lesson_id);
                Gson gson = new Gson();
                String list = gson.toJson(listComment);
                JsonObject jsonobj = new JsonObject();
                jsonobj.addProperty("totalofcmt", totalofcmt);
                jsonobj.addProperty("list", list);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());

            } catch (Exception e) {
            }
        } else if (action.equals("delete")) {
            CommentDAO cm = new CommentDAO();
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            String lesson_id_raw = request.getParameter("lid");
            String comment_id_raw = request.getParameter("cmtid");
            try {
                int lesson_id = Integer.parseInt(lesson_id_raw);
                int comment_id = Integer.parseInt(comment_id_raw);
                cm.deleteCommentById(comment_id, lesson_id, a.getAccount_id());
                int totalofcmt = cm.getTotalComment(lesson_id);
                List<Comment> listComment = cm.getCommentByLessonId(lesson_id);
                Gson gson = new Gson();
                String list = gson.toJson(listComment);
                JsonObject jsonobj = new JsonObject();
                jsonobj.addProperty("totalofcmt", totalofcmt);
                jsonobj.addProperty("list", list);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());

            } catch (Exception e) {
            }
        } else if (action.equals("checkreport")) {
            CommentDAO cm = new CommentDAO();
            LocalDate curDate = LocalDate.now();
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            String lesson_id_raw = request.getParameter("lid");
            String comment_id_raw = request.getParameter("cmtid");
            boolean alreadyReported;
            try {
                int lesson_id = Integer.parseInt(lesson_id_raw);
                int comment_id = Integer.parseInt(comment_id_raw);

                Comment_Report cr = cm.getCommentReportByCommentId(comment_id, a.getAccount_id());
                if (cr == null) {
                    int totalofcmt = cm.getTotalComment(lesson_id);
                    alreadyReported = false;
                    List<Comment> listComment = cm.getCommentByLessonId(lesson_id);
                    Gson gson = new Gson();
                    String list = gson.toJson(listComment);
                    JsonObject jsonobj = new JsonObject();
                    jsonobj.addProperty("alreadyReported", alreadyReported);
                    jsonobj.addProperty("totalofcmt", totalofcmt);
                    jsonobj.addProperty("list", list);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(jsonobj.toString());
                } else {
                    int totalofcmt = cm.getTotalComment(lesson_id);
                    alreadyReported = true;
                    List<Comment> listComment = cm.getCommentByLessonId(lesson_id);
                    Gson gson = new Gson();
                    String list = gson.toJson(listComment);
                    JsonObject jsonobj = new JsonObject();
                    jsonobj.addProperty("alreadyReported", alreadyReported);
                    jsonobj.addProperty("totalofcmt", totalofcmt);
                    jsonobj.addProperty("list", list);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(jsonobj.toString());
                }

            } catch (Exception e) {
            }
        } else if (action.equals("report")) {
            CommentDAO cm = new CommentDAO();
            LocalDate curDate = LocalDate.now();
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            String lesson_id_raw = request.getParameter("lid");
            String comment_id_raw = request.getParameter("cmtid");
            String account_id_raw = request.getParameter("accid");
            String reason = request.getParameter("reason");
            boolean alreadyReported;
            try {
                int lesson_id = Integer.parseInt(lesson_id_raw);
                int comment_id = Integer.parseInt(comment_id_raw);
                int account_id = Integer.parseInt(account_id_raw);
                Comment_Report cr = new Comment_Report();
                cr.setComment_id(comment_id);
                cr.setAccount_id(a.getAccount_id());
                cr.setCause(reason);
                cr.setReport_date(curDate.toString());
                cm.addReportComment(cr);

                int numberreportcomment = cm.getReportComment(comment_id);
                if (numberreportcomment == 2) {
                    cm.updateStatusCommentById(comment_id, lesson_id, account_id);
                    int flag = cm.getFlagAccount(account_id);
                    flag = flag + 1;
                    String flagemail = "Dear student,\n"
                            + "\n"
                            + "I'm writing to inform you that you have received <font color='red'>" + flag + "</font> warning flag on your account for violating our community standards. While we understand mistakes happen, multiple violations can lead to account suspension. Please carefully review our guidelines to ensure you understand what content is prohibited.\n"
                            + "\n"
                            + "This first warning acts as a reminder to be thoughtful and respectful. If you receive two more flags, your account will automatically be locked for a period of time. We want everyone to feel welcome and have a positive experience here, so please consider this notice before posting again.\n"
                            + "\n"
                            + "Let me know if you have any questions or need clarification on our policies. I'm here to help you participate successfully. Thank you for understanding.\n"
                            + "\n"
                            + "Sincerely,\n"
                            + "[Admin]";
                    String blockemail = "Dear student,\n"
                            + "\n"
                            + "This letter is to inform you that your account has received three warning flags for violating our community standards. As a result, per our policy, your account will be temporarily suspended effective immediately.\n"
                            + "\n"
                            + "I understand this may be disappointing, but these policies are in place to ensure a positive environment for all members. Multiple warnings were given, yet additional violations have occurred. Please use this time to thoroughly review our guidelines to ensure you understand what type of content is prohibited.\n"
                            + "\n"
                            + "Your suspension will last for 1 years. After this period, you may reactivate your account as long as you agree to follow all terms of service moving forward. Please let me know if you have any questions about reinstating your access.\n"
                            + "\n"
                            + "It is our hope that you will use this as a learning experience. We welcome you back once the suspension is lifted, and trust you will contribute positively to our community. The choice is yours - this can be an opportunity for growth. We are here to support you on that journey.\n"
                            + "\n"
                            + "Sincerely,\n"
                            + "[Admin]\n";
                    String emailrp = cm.getEmailByAccountId(account_id);
                    if (flag == 1) {
                        EmailUtils1.sendEmail(emailrp, "Hola Learn", flagemail);
                    } else if (flag == 2) {
                        EmailUtils1.sendEmail(emailrp, "Hola Learn", flagemail);
                    } else if (flag == 3) {
                        EmailUtils1.sendEmail(emailrp, "Hola Learn", blockemail);
                    }
                    switch (flag) {
                        case 1:
                            EmailUtils1.sendEmail(emailrp, "Hola Learn", flagemail);
                            break;
                        case 2:
                            EmailUtils1.sendEmail(emailrp, "Hola Learn", flagemail);
                            break;
                        case 3:
                            EmailUtils1.sendEmail(emailrp, "Hola Learn", blockemail);
                            break;
                        default:
                        // Xử lý trường hợp mặc định nếu flag không nằm trong các trường hợp trên.
                    }
                    cm.updateFlagAccount(account_id, flag);
                    if (flag == 3) {
                        cm.updateActiveAccount(account_id);
                    }
                }
                int totalofcmt = cm.getTotalComment(lesson_id);
                alreadyReported = false;
                List<Comment> listComment = cm.getCommentByLessonId(lesson_id);
                Gson gson = new Gson();
                String list = gson.toJson(listComment);
                JsonObject jsonobj = new JsonObject();
                jsonobj.addProperty("alreadyReported", alreadyReported);
                jsonobj.addProperty("totalofcmt", totalofcmt);
                jsonobj.addProperty("list", list);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonobj.toString());

            } catch (Exception e) {
            }
        }
    }

}
