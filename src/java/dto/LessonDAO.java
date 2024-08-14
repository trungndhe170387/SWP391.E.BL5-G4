/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Lesson;

/**
 *
 * @author lam12
 */
public class LessonDAO extends DBContext {

    public List<Lesson> getAllLessonByCourseId(String course_id) {
        List<Lesson> list = new ArrayList<>();
        String query = " SELECT * FROM LESSON WHERE chapter_id in (SELECT chapter_id FROM CHAPTER WHERE course_id = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson l = new Lesson(rs.getInt("lesson_id"),
                        rs.getInt("lesson_no"),
                        rs.getString("lesson_name"),
                        rs.getString("video"),
                        rs.getString("document"),
                        rs.getInt("chapter_id"),
                        rs.getString("description"));
                list.add(l);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Lesson addLesson(String lesson_no, String lesson_name, String video, String document, String chapter_id, String description) {
        String query1 = "INSERT INTO Lesson (lesson_no, lesson_name, video, document, chapter_id, description) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        String query2 = "SELECT TOP 1 * FROM Lesson ORDER BY lesson_id desc";

        try {
            PreparedStatement st1 = connection.prepareStatement(query1);
            PreparedStatement st2 = connection.prepareStatement(query2);
            st1.setString(1, lesson_no);
            st1.setString(2, lesson_name);
            st1.setString(3, video);
            st1.setString(4, document);
            st1.setString(5, chapter_id);
            st1.setString(6, description);
            int row = st1.executeUpdate();
            if (row > 0) {
                ResultSet rs = st2.executeQuery();
                if (rs.next()) {
                    return new Lesson(rs.getInt("lesson_id"), rs.getInt("lesson_no"),
                            rs.getString("lesson_name"), rs.getString("video"),
                            rs.getString("document"), rs.getInt("chapter_id"), rs.getString("description"));
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Lesson updateLesson(String lesson_no, String lesson_name, String video, String document, String description, String lesson_id) {
        String query1 = "UPDATE Lesson\n"
                + "SET lesson_no = ?\n"
                + " ,lesson_name = ?\n"
                + " ,video = ?\n"
                + " ,document = ?\n"
                + " ,description = ?\n"
                + "WHERE lesson_id = ?\n";
        String query2 = "SELECT * FROM Lesson WHERE lesson_id = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(query1);
            st1.setString(1, lesson_no);
            st1.setString(2, lesson_name);
            st1.setString(3, video);
            st1.setString(4, document);
            st1.setString(5, description);
            st1.setString(6, lesson_id);
            int row = st1.executeUpdate();
            if (row > 0) {
                PreparedStatement st3 = connection.prepareStatement(query2);
                st3.setString(1, lesson_id);
                ResultSet rs = st3.executeQuery();
                if (rs.next()) {
                    return new Lesson(rs.getInt("lesson_id"), rs.getInt("lesson_no"),
                            rs.getString("lesson_name"), rs.getString("video"),
                            rs.getString("document"), rs.getInt("chapter_id"), rs.getString("description"));
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean deleteLesson(String lesson_id) {
        String query = "DELETE FROM Lesson WHERE lesson_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, lesson_id);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }


    public static void main(String[] args) {
        LessonDAO ld = new LessonDAO();
        Lesson less = ld.updateLesson("25", "Doan Tung Lam", "https://www.youtube.com/embed/iTWYa0t5COk?si=ckiPmtHzP9w6yiPE", null, "asd szdjkf szdifh ", "110");
        System.out.println(less);
    }

}
