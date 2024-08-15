/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import model.Comment;
import model.Comment_Report;

/**
 *
 * @author admin
 */
public class CommentDAO extends DBContext {

    public List<Comment> getTop5CommentByProductId(int lesson_id) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT top(5) Account.*, Comment_Lesson.*, Role.role_name\n"
                + "  FROM [Comment_Lesson], Account,Lesson,Role\n"
                + "  where Comment_Lesson.account_id = Account.account_id\n"
                + "  and Comment_Lesson.lesson_id = Lesson.lesson_id\n"
                + "  and Account.role_id = Role.role_id\n"
                + "  and Lesson.lesson_id = ?\n"
                + "  order by Comment_Lesson.comment_id desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lesson_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageByte = rs.getBytes("avatar");
                String image = new String(Base64.getEncoder().encode(imageByte));
                Comment c = new Comment();
                c.setComment_id(rs.getInt("comment_id"));
                c.setAccount_id(rs.getInt("account_id"));
                c.setLesson_id(rs.getInt("lesson_id"));
                c.setComment(rs.getString("comment"));
                c.setStatus(rs.getInt("status"));
                c.setFullname(rs.getString("fullname"));
                c.setComment_date(rs.getString("comment_date"));
                c.setAvatar(image);
                c.setRole_name(rs.getString("role_name"));
                list.add(c);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    public List<Comment> getNext5CommentByProductId(int lesson_id, int amount) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT Account.*, Comment_Lesson.*, Role.role_name\n"
                + "  FROM [Comment_Lesson], Account,Lesson,Role\n"
                + "  where Comment_Lesson.account_id = Account.account_id\n"
                + "  and Comment_Lesson.lesson_id = Lesson.lesson_id\n"
                + "  and Account.role_id = Role.role_id\n"
                + "  and Lesson.lesson_id = ?\n"
                + "  order by Comment_Lesson.comment_id desc\n"
                + "  offset ? rows fetch next 5 rows only";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lesson_id);
            st.setInt(2, amount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageByte = rs.getBytes("avatar");
                String image = new String(Base64.getEncoder().encode(imageByte));
                Comment c = new Comment();
                c.setComment_id(rs.getInt("comment_id"));
                c.setAccount_id(rs.getInt("account_id"));
                c.setLesson_id(rs.getInt("lesson_id"));
                c.setComment(rs.getString("comment"));
                c.setStatus(rs.getInt("status"));
                c.setFullname(rs.getString("fullname"));
                c.setComment_date(rs.getString("comment_date"));
                c.setAvatar(image);
                c.setRole_name(rs.getString("role_name"));
                list.add(c);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    public List<Comment> getCommentByLessonId(int lesson_id) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT Account.*, Comment_Lesson.*, Role.role_name\n"
                + "                  FROM [Comment_Lesson], Account,Lesson,Role\n"
                + "                  where Comment_Lesson.account_id = Account.account_id\n"
                + "                  and Comment_Lesson.lesson_id = Lesson.lesson_id\n"
                + "                  and Account.role_id = Role.role_id\n"
                + "                  and Lesson.lesson_id = ? \n"
                + "				  and Comment_Lesson.status <> 0\n"
                + "                  order by Comment_Lesson.comment_id desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lesson_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageByte = rs.getBytes("avatar");
                String image = new String(Base64.getEncoder().encode(imageByte));
                Comment c = new Comment();
                c.setComment_id(rs.getInt("comment_id"));
                c.setAccount_id(rs.getInt("account_id"));
                c.setLesson_id(rs.getInt("lesson_id"));
                c.setComment(rs.getString("comment"));
                c.setStatus(rs.getInt("status"));
                c.setFullname(rs.getString("fullname"));
                c.setComment_date(rs.getString("comment_date"));
                c.setAvatar(image);
                c.setRole_name(rs.getString("role_name"));
                list.add(c);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    public void addCommentById(Comment c) {
        String sql = "INSERT INTO [dbo].[Comment_Lesson]\n"
                + "           ([account_id]\n"
                + "           ,[lesson_id]\n"
                + "           ,[comment]\n"
                + "           ,[comment_date]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getAccount_id());
            st.setInt(2, c.getLesson_id());
            st.setString(3, c.getComment());
            st.setString(4, c.getComment_date());
            st.setInt(5, c.getStatus());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateCommentById(Comment c) {
        String sql = "UPDATE [dbo].[Comment_Lesson]\n"
                + "SET comment = ?,\n"
                + "Comment_Lesson.comment_date = ?\n"
                + "WHERE Comment_Lesson.comment_id = ?\n"
                + "AND Comment_Lesson.lesson_id = ?\n"
                + "AND Comment_Lesson.account_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getComment());
            st.setString(2, c.getComment_date());
            st.setInt(3, c.getComment_id());
            st.setInt(4, c.getLesson_id());
            st.setInt(5, c.getAccount_id());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void deleteCommentById(int comment_id, int lesson_id, int account_id) {
        String sql = "DELETE FROM [dbo].[Comment_Lesson]\n"
                + "      WHERE Comment_Lesson.comment_id = ?\n"
                + "	  and Comment_Lesson.account_id = ?\n"
                + "	  and Comment_Lesson.lesson_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, comment_id);
            st.setInt(2, account_id);
            st.setInt(3, lesson_id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateStatusCommentById(int comment_id, int lesson_id, int account_id) {
        String sql = "UPDATE [dbo].[Comment_Lesson]\n"
                + "   SET [status] = 0\n"
                + " WHERE Comment_Lesson.comment_id = ?\n"
                + "                 and Comment_Lesson.account_id = ?\n"
                + "                	  and Comment_Lesson.lesson_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, comment_id);
            st.setInt(2, account_id);
            st.setInt(3, lesson_id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public int getTotalComment(int lesson_id) {

        String sql = "  Select count(*) from Comment_Lesson\n"
                + "  where Comment_Lesson.lesson_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lesson_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }

        } catch (SQLException e) {

        }

        return 0;
    }

    public Comment_Report getCommentReportByCommentId(int comment_id, int account_id) {
        String sql = "SELECT*\n"
                + "  FROM [Comment_Report]\n"
                + "  where Comment_Report.comment_id = ?\n"
                + "  and Comment_Report.account_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, comment_id);
            st.setInt(2, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment_Report c = new Comment_Report();
                c.setReport_id(rs.getInt("comment_id"));
                c.setComment_id(rs.getInt("comment_id"));
                c.setAccount_id(rs.getInt("account_id"));
                c.setCause(rs.getString("cause"));
                c.setReport_date(rs.getString("report_date"));
                return c;
            }

        } catch (SQLException e) {

        }

        return null;
    }

    public void addReportComment(Comment_Report c) {
        String sql = "INSERT INTO [dbo].[Comment_Report]\n"
                + "           ([comment_id]\n"
                + "           ,[account_id]\n"
                + "           ,[cause]\n"
                + "           ,[report_date])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getComment_id());
            st.setInt(2, c.getAccount_id());
            st.setString(3, c.getCause());
            st.setString(4, c.getReport_date());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public int getReportComment(int comment_id) {

        String sql = "SELECT COUNT(Comment_Report.comment_id)\n"
                + "  FROM [Comment_Report]\n"
                + "  where Comment_Report.comment_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, comment_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }

        } catch (SQLException e) {

        }

        return 0;
    }

    public void updateFlagAccount(int account_id, int flag) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [flag] = ?  WHERE Account.account_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, flag);
            st.setInt(2, account_id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public int getFlagAccount(int account_id) {
        String sql = "SELECT Account.flag\n"
                + "  FROM [Account]\n"
                + " where Account.account_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }

        } catch (SQLException e) {

        }

        return 0;
    }

    public void updateActiveAccount(int account_id) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET active = 2  WHERE Account.account_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public String getEmailByAccountId(int account_id) {
        String sql = "SELECT Account.email\n"
                + "  FROM [Account]\n"
                + "  where Account.account_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString("email");
            }

        } catch (SQLException e) {

        }

        return null;
    }
    public static void main(String[] args) {
        CommentDAO c = new CommentDAO();
        List <Comment> cmt = c.getCommentByLessonId(1);
        System.out.println(cmt.size());
    }

}
