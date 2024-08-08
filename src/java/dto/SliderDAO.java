/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import model.Account;
import model.Blog;
import model.Learner_Subject;
import model.Slider;
import model.Subject;

/**
 *
 * @author Admin
 */
public class SliderDAO extends DBContext {

    public List<Slider> getAllSliderSubject() {
        List<Slider> listS = new ArrayList<>();
        String sql = "select s.id, s.image, s.title, s.status, s.link, s.marketer_id, s.type, s.endtime, s.description, a.fullname from Slider s\n"
                + "join Account a on s.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and s.status = 1\n"
                + "and s.type = 'Subject'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                listS.add(new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listS;
    }

    public List<Slider> getAllSliderBlog() {
        List<Slider> listS = new ArrayList<>();
        String sql = "select s.id, s.image, s.title, s.status, s.link, s.marketer_id, s.type, s.endtime, s.description, a.fullname from Slider s\n"
                + "join Account a on s.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and s.status = 1\n"
                + "and s.type = 'Blog'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                listS.add(new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listS;
    }

    public List<Slider> getAllSliderDiscount() {
        List<Slider> listS = new ArrayList<>();
        String sql = "select s.id, s.image, s.title, s.status, s.link, s.marketer_id, s.type, s.endtime, s.description, a.fullname from Slider s\n"
                + "join Account a on s.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and s.status = 1\n"
                + "and s.type = 'Discount'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                listS.add(new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listS;
    }

    public Slider getSliderByID(String id) {

        String sql = "select s.id, s.image, s.title, s.status, s.link, s.marketer_id, s.type, s.endtime, s.description, a.fullname from Slider s\n"
                + "join Account a on s.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and s.status = 1\n"
                + "and s.id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));

                return new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public Slider getSliderEditByID(String id) {

        String sql = "select s.id, s.image, s.title, s.status, s.link, s.marketer_id, s.type, s.endtime, s.description, a.fullname from Slider s\n"
                + "join Account a on s.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and s.id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));

                return new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Slider> getAllSliderByOwner(String marketer_id) {
        List<Slider> listS = new ArrayList<>();
        String sql = "select s.id, s.image, s.title, s.status, s.link, s.marketer_id, s.type, s.endtime, s.description, a.fullname from Slider s\n"
                + "join Account a on s.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and s.marketer_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, marketer_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));

                listS.add(new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listS;
    }

    public boolean editSlider(String fileName, String title, String status, String link,
            String marketer_id, String type, String endtime, String description, String sliderid) {
        String sql1 = "UPDATE [dbo].[Slider]\n"
                + "   SET [image] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[link] = ?\n"
                + "      ,[marketer_id] = ?\n"
                + "      ,[type] = ?\n"
                + "      ,[endtime] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE id= ?";

        String sql2 = "UPDATE [dbo].[Slider]\n"
                + "   SET [title] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[link] = ?\n"
                + "      ,[marketer_id] = ?\n"
                + "      ,[type] = ?\n"
                + "      ,[endtime] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE id= ?";

        if (fileName != null) {
            String pathToFile = "D:/Sem5_Fall2023/SWP391/image/";
            File avatarImage = new File(pathToFile + fileName);
            try ( InputStream avatarStream = new FileInputStream(avatarImage)) {
                PreparedStatement st = connection.prepareStatement(sql1);
                st.setBinaryStream(1, avatarStream);
                st.setString(2, title);
                st.setString(3, status);
                st.setString(4, link);
                st.setString(5, marketer_id);
                st.setString(6, type);
                st.setString(7, endtime);
                st.setString(8, description);
                st.setString(9, sliderid);

                st.executeUpdate();
                return true;
            } catch (SQLException | IOException e) {
            }
        } else {
            try {
                PreparedStatement st = connection.prepareStatement(sql2);
                st.setString(1, title);
                st.setString(2, status);
                st.setString(3, link);
                st.setString(4, marketer_id);
                st.setString(5, type);
                st.setString(6, endtime);
                st.setString(7, description);
                st.setString(8, sliderid);
                st.executeUpdate();
                return true;
            } catch (SQLException e) {

            }
        }
        return false;
    }

    public boolean addSlider(String fileName, String title, String status, String link,
            String marketer_id, String type, String endtime, String description) {
        String sql = "INSERT INTO [dbo].[Slider]\n"
                + "           ([image]\n"
                + "           ,[title]\n"
                + "           ,[status]\n"
                + "           ,[link]\n"
                + "           ,[marketer_id]\n"
                + "           ,[type]\n"
                + "           ,[endtime]\n"
                + "           ,[description])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        if (fileName != null) {
            String pathToFile = "D:/Sem5_Fall2023/SWP391/image/";
            File avatarImage = new File(pathToFile + fileName);
            try ( InputStream avatarStream = new FileInputStream(avatarImage)) {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setBinaryStream(1, avatarStream);
                st.setString(2, title);
                st.setString(3, status);
                st.setString(4, link);
                st.setString(5, marketer_id);
                st.setString(6, type);
                st.setString(7, endtime);
                st.setString(8, description);

                st.executeUpdate();
                return true;
            } catch (SQLException | IOException e) {
            }
        }
        return false;
    }

    public void deleteSlider(String id) {

        String sql = "delete from slider where id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public List<Subject> getHaloweenDiscountSubject() {
        List<Subject> list = new ArrayList<>();
        String query = "SELECT\n"
                + "Subject.*,\n"
                + "Account.fullname,\n"
                + "ROUND(\n"
                + "(SELECT AVG(avg_rate) \n"
                + "FROM\n"
                + "(SELECT Course.course_id, AVG(Learner_Course.rate) AS avg_rate\n"
                + "FROM Learner_Course\n"
                + "INNER JOIN Course ON Learner_Course.course_id = Course.course_id\n"
                + "GROUP BY Course.course_id) AS course_rate\n"
                + "WHERE course_rate.course_id IN (SELECT Course.course_id\n"
                + "FROM Course\n"
                + "WHERE Course.subject_id = Subject.subject_id)), 1) AS subject_rate\n"
                + "FROM Subject\n"
                + "INNER JOIN Account ON Subject.lecturer_id = Account.account_id\n"
                + "WHERE MONTH(created_date) = 10\n"
                + "and discount > 0";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Subject s = new Subject();
                s.setSubject_id(rs.getInt("subject_id"));
                s.setSubject_name(rs.getString("subject_name"));
                s.setDescription(rs.getString("description"));
                s.setImage(base64Image);
                s.setPrice(rs.getFloat("price"));
                s.setDiscount(rs.getFloat("discount"));
                s.setSold(rs.getInt("sold"));
                s.setCreated_date(rs.getString("created_date"));
                s.setUpdated_date(rs.getString("updated_date"));
                s.setCategory_id(rs.getInt("category_id"));
                s.setLecturer_id(rs.getInt("lecturer_id"));
                s.setLecturer_name(rs.getString("fullname"));
                s.setRate_subject(rs.getDouble("subject_rate"));
                list.add(s);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Subject> getAutumnDiscountSubject() {
        List<Subject> list = new ArrayList<>();
        String query = "SELECT\n"
                + "Subject.*,\n"
                + "Account.fullname,\n"
                + "ROUND(\n"
                + "(SELECT AVG(avg_rate) \n"
                + "FROM\n"
                + "(SELECT Course.course_id, AVG(Learner_Course.rate) AS avg_rate\n"
                + "FROM Learner_Course\n"
                + "INNER JOIN Course ON Learner_Course.course_id = Course.course_id\n"
                + "GROUP BY Course.course_id) AS course_rate\n"
                + "WHERE course_rate.course_id IN (SELECT Course.course_id\n"
                + "FROM Course\n"
                + "WHERE Course.subject_id = Subject.subject_id)), 1) AS subject_rate\n"
                + "FROM Subject\n"
                + "INNER JOIN Account ON Subject.lecturer_id = Account.account_id\n"
                + "WHERE MONTH(created_date) between 8 and 10\n"
                + "and discount > 0";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Subject s = new Subject();
                s.setSubject_id(rs.getInt("subject_id"));
                s.setSubject_name(rs.getString("subject_name"));
                s.setDescription(rs.getString("description"));
                s.setImage(base64Image);
                s.setPrice(rs.getFloat("price"));
                s.setDiscount(rs.getFloat("discount"));
                s.setSold(rs.getInt("sold"));
                s.setCreated_date(rs.getString("created_date"));
                s.setUpdated_date(rs.getString("updated_date"));
                s.setCategory_id(rs.getInt("category_id"));
                s.setLecturer_id(rs.getInt("lecturer_id"));
                s.setLecturer_name(rs.getString("fullname"));
                s.setRate_subject(rs.getDouble("subject_rate"));
                list.add(s);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Subject> getChristmasDiscountSubject() {
        List<Subject> list = new ArrayList<>();
        String query = "SELECT\n"
                + "Subject.*,\n"
                + "Account.fullname,\n"
                + "ROUND(\n"
                + "(SELECT AVG(avg_rate) \n"
                + "FROM\n"
                + "(SELECT Course.course_id, AVG(Learner_Course.rate) AS avg_rate\n"
                + "FROM Learner_Course\n"
                + "INNER JOIN Course ON Learner_Course.course_id = Course.course_id\n"
                + "GROUP BY Course.course_id) AS course_rate\n"
                + "WHERE course_rate.course_id IN (SELECT Course.course_id\n"
                + "FROM Course\n"
                + "WHERE Course.subject_id = Subject.subject_id)), 1) AS subject_rate\n"
                + "FROM Subject\n"
                + "INNER JOIN Account ON Subject.lecturer_id = Account.account_id\n"
                + "WHERE DAY(created_date) between 12 and 25\n"
                + "and MONTH(created_date) = 12\n"
                + "and discount > 0";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Subject s = new Subject();
                s.setSubject_id(rs.getInt("subject_id"));
                s.setSubject_name(rs.getString("subject_name"));
                s.setDescription(rs.getString("description"));
                s.setImage(base64Image);
                s.setPrice(rs.getFloat("price"));
                s.setDiscount(rs.getFloat("discount"));
                s.setSold(rs.getInt("sold"));
                s.setCreated_date(rs.getString("created_date"));
                s.setUpdated_date(rs.getString("updated_date"));
                s.setCategory_id(rs.getInt("category_id"));
                s.setLecturer_id(rs.getInt("lecturer_id"));
                s.setLecturer_name(rs.getString("fullname"));
                s.setRate_subject(rs.getDouble("subject_rate"));
                list.add(s);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Learner_Subject> getAllMyCourse(String learner_id) {
        List<Learner_Subject> list = new ArrayList<>();
        String sql = "select distinct ls.*, a.account_id, a.fullname, s.subject_name, s.image, s.lecturer_id, accsub.fullname as [lecturer_name], s.category_id \n"
                + "from Learner_Subject ls \n"
                + "join Subject s on ls.subject_id = s.subject_id\n"
                + "join Account a on a.account_id = ls.learner_id\n"
                + "join (select * from Account acc JOIN Subject sub ON acc.account_id = sub.lecturer_id) as accsub ON accsub.account_id = s.lecturer_id\n"
                + "WHERE ls.active = 1 AND ls.learner_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, learner_id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Learner_Subject ls = new Learner_Subject();
                ls.setId(rs.getInt("id"));
                ls.setLearner_id(rs.getInt("learner_id"));
                ls.setSubject_id(rs.getInt("subject_id"));
                ls.setEnrolled_date(rs.getString("enrolled_date"));
                ls.setEnd_date(rs.getString("end_date"));
                ls.setActive(rs.getInt("active"));
                ls.setStatus(rs.getInt("status"));
                ls.setAccount_id(rs.getInt("account_id"));
                ls.setFullname(rs.getString("fullname"));
                ls.setSubject_name(rs.getString("subject_name"));
                ls.setImage(base64Image);
                ls.setLecturer_id(rs.getInt("lecturer_id"));
                ls.setLecturer_name(rs.getString("lecturer_name"));
                ls.setCategory_id(rs.getInt("category_id"));
                list.add(ls);
            }
        } catch (SQLException e) {
        }

        return list;
    }
    public List<Learner_Subject> getAllMyCourseCompleted(String learner_id) {
        List<Learner_Subject> list = new ArrayList<>();
        String sql = "select distinct ls.*, a.account_id, a.fullname, s.subject_name, s.image, s.lecturer_id, accsub.fullname as [lecturer_name], s.category_id \n"
                + "from Learner_Subject ls \n"
                + "join Subject s on ls.subject_id = s.subject_id\n"
                + "join Account a on a.account_id = ls.learner_id\n"
                + "join (select * from Account acc JOIN Subject sub ON acc.account_id = sub.lecturer_id) as accsub ON accsub.account_id = s.lecturer_id\n"
                + "WHERE ls.active = 1 AND ls.status = 1 AND ls.learner_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, learner_id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Learner_Subject ls = new Learner_Subject();
                ls.setId(rs.getInt("id"));
                ls.setLearner_id(rs.getInt("learner_id"));
                ls.setSubject_id(rs.getInt("subject_id"));
                ls.setEnrolled_date(rs.getString("enrolled_date"));
                ls.setEnd_date(rs.getString("end_date"));
                ls.setActive(rs.getInt("active"));
                ls.setStatus(rs.getInt("status"));
                ls.setAccount_id(rs.getInt("account_id"));
                ls.setFullname(rs.getString("fullname"));
                ls.setSubject_name(rs.getString("subject_name"));
                ls.setImage(base64Image);
                ls.setLecturer_id(rs.getInt("lecturer_id"));
                ls.setLecturer_name(rs.getString("lecturer_name"));
                ls.setCategory_id(rs.getInt("category_id"));
                list.add(ls);
            }
        } catch (SQLException e) {
        }

        return list;
    }
    
    public List<Learner_Subject> getAllMyCourseNotCompleted(String learner_id) {
        List<Learner_Subject> list = new ArrayList<>();
        String sql = "select distinct ls.*, a.account_id, a.fullname, s.subject_name, s.image, s.lecturer_id, accsub.fullname as [lecturer_name], s.category_id \n"
                + "from Learner_Subject ls \n"
                + "join Subject s on ls.subject_id = s.subject_id\n"
                + "join Account a on a.account_id = ls.learner_id\n"
                + "join (select * from Account acc JOIN Subject sub ON acc.account_id = sub.lecturer_id) as accsub ON accsub.account_id = s.lecturer_id\n"
                + "WHERE ls.active = 1 AND ls.status = 0 AND ls.learner_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, learner_id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Learner_Subject ls = new Learner_Subject();
                ls.setId(rs.getInt("id"));
                ls.setLearner_id(rs.getInt("learner_id"));
                ls.setSubject_id(rs.getInt("subject_id"));
                ls.setEnrolled_date(rs.getString("enrolled_date"));
                ls.setEnd_date(rs.getString("end_date"));
                ls.setActive(rs.getInt("active"));
                ls.setStatus(rs.getInt("status"));
                ls.setAccount_id(rs.getInt("account_id"));
                ls.setFullname(rs.getString("fullname"));
                ls.setSubject_name(rs.getString("subject_name"));
                ls.setImage(base64Image);
                ls.setLecturer_id(rs.getInt("lecturer_id"));
                ls.setLecturer_name(rs.getString("lecturer_name"));
                ls.setCategory_id(rs.getInt("category_id"));
                list.add(ls);
            }
        } catch (SQLException e) {
        }

        return list;
    }
    
    public List<Learner_Subject> searchByName(String search_raw) {
        List<Learner_Subject> listP = new ArrayList<>();
        String sql = "select distinct ls.*, a.account_id, a.fullname, s.subject_name, s.image, s.lecturer_id, accsub.fullname as [lecturer_name], s.category_id \n"
                + "from Learner_Subject ls \n"
                + "join Subject s on ls.subject_id = s.subject_id\n"
                + "join Account a on a.account_id = ls.learner_id\n"
                + "join (select * from Account acc JOIN Subject sub ON acc.account_id = sub.lecturer_id) as accsub ON accsub.account_id = s.lecturer_id\n"
                + "WHERE ls.active = 1 AND ls.learner_id = ?\n"
                + "where s.subject_name like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search_raw + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Learner_Subject ls = new Learner_Subject();
                ls.setId(rs.getInt("id"));
                ls.setLearner_id(rs.getInt("learner_id"));
                ls.setSubject_id(rs.getInt("subject_id"));
                ls.setEnrolled_date(rs.getString("enrolled_date"));
                ls.setEnd_date(rs.getString("end_date"));
                ls.setActive(rs.getInt("active"));
                ls.setStatus(rs.getInt("status"));
                ls.setAccount_id(rs.getInt("account_id"));
                ls.setFullname(rs.getString("fullname"));
                ls.setSubject_name(rs.getString("subject_name"));
                ls.setImage(base64Image);
                ls.setLecturer_id(rs.getInt("lecturer_id"));
                ls.setLecturer_name(rs.getString("lecturer_name"));
                ls.setCategory_id(rs.getInt("category_id"));
                listP.add(ls);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listP;
    }

    public static void main(String[] args) {
        SliderDAO dao = new SliderDAO();
        List<Learner_Subject> ls1 = dao.getAllMyCourse("2");
        //Slider s2 = dao.getSliderByID("1");
//        System.out.println(s2);
        for (Learner_Subject learner_Subject : ls1) {
            System.out.println(learner_Subject);
        }
    }
}
