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
import model.Category;
import model.Course;
import model.Subject;

/**
 *
 * @author lam12
 */
public class CourseDAO extends DBContext {

    public List<Course> getAllCourseBySubjectId(String subject_id) {
        List<Course> list = new ArrayList<>();
        String query = "SELECT * FROM COURSE WHERE subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, subject_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String base64Image = null;
                byte[] imageData = rs.getBytes("image");
                if (imageData != null) {
                    base64Image = new String(Base64.getEncoder().encode(imageData));
                }
                Course c = new Course(rs.getInt("course_id"),
                        rs.getString("course_name"),
                        base64Image,
                        rs.getInt("subject_id"),
                        rs.getInt("course_no"));
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean addCourse(String course_name, String image, String subject_id, String course_no) {
        String query = "INSERT INTO [dbo].[Course]\n"
                + "           ([course_name]\n"
                + "           ,[image]\n"
                + "           ,[subject_id]\n"
                + "           ,[course_no])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        String pathToFile = "D:/FPTU/Sem5/SWP391/ImageRepository/";
        File courseImage = new File(pathToFile + image);
        try ( InputStream courseStream = new FileInputStream(courseImage)) {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, course_name);
            st.setBinaryStream(2, courseStream);
            st.setString(3, subject_id);
            st.setString(4, course_no);
            st.executeUpdate();
            return true;
        } catch (SQLException | IOException e) {
        }
        return false;
    }

    public boolean updateCourse(String course_name, String image, String course_no, String course_id) {
        String query1 = "UPDATE [dbo].[Course]\n"
                + "   SET [course_name] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[course_no] = ?\n"
                + " WHERE course_id = ?";
        String query2 = "UPDATE [dbo].[Course]\n"
                + "   SET [course_name] = ?\n"
                + "      ,[course_no] = ?\n"
                + " WHERE course_id = ?";
        if (image != null) {
            String pathToFile = "D:/FPTU/Sem5/SWP391/ImageRepository/";
            File courseImage = new File(pathToFile + image);
            try ( InputStream courseStream = new FileInputStream(courseImage)) {
                PreparedStatement st = connection.prepareStatement(query1);
                st.setString(1, course_name);
                st.setBinaryStream(2, courseStream);
                st.setString(3, course_no);
                st.setString(4, course_id);
                st.executeUpdate();
                return true;
            } catch (SQLException | IOException e) {
            }
        } else {
            try {
                PreparedStatement st = connection.prepareStatement(query2);
                st.setString(1, course_name);
                st.setString(2, course_no);
                st.setString(3, course_id);
                st.executeUpdate();
                return true;
            } catch (SQLException e) {
            }
        }
        return false;
    }

    public boolean deleteCourse(String course_id) {
        String query = "DELETE FROM [Course] WHERE course_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, course_id);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }


} //end dao
