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
import model.Chapter;
import model.Course;
import model.Learner_Chapter;

/**
 *
 * @author admin
 */
public class Chapter1DAO extends DBContext {

    // Lay tat ca chapter theo course
    public List<Chapter> getChapterByCourseId(int course_id) {
        List<Chapter> list = new ArrayList<>();
        String sql = "SELECT * FROM [Chapter], Course\n"
                + "where  Chapter.course_id = Course.course_id\n"
                + "and Course.course_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Chapter c = new Chapter();
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setChapter_name(rs.getString("chapter_name"));
                c.setChapter_no(rs.getInt("chapter_no"));
                c.setCourse_id(rs.getInt("course_id"));
                list.add(c);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    // Update status cua learner_lesson
    public void updateStatusChapter(Learner_Chapter c) {
        String sql = "UPDATE [dbo].[Learner_Chapter]\n"
                + "   SET [status] = 1\n"
                + " WHERE Learner_Chapter.chapter_id = ?\n"
                + " and Learner_Chapter.learner_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getChapter_id());
            st.setInt(2, c.getLearner_id());

            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    // Lay Status cua chapter
    public List<Learner_Chapter> getLearnerChapterByCourseId(int course_id, int learner_id) {
        List<Learner_Chapter> list = new ArrayList<>();
        String sql = "SELECT Learner_Chapter.*\n"
                + "  FROM [Learner_Chapter], Chapter, Course\n"
                + "  where Learner_Chapter.chapter_id = Chapter.chapter_id\n"
                + "  and Chapter.course_id =Course.course_id\n"
                + "  and Learner_Chapter.learner_id = ?\n"
                + "  and Course.course_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, learner_id);
            st.setInt(2, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Learner_Chapter l = new Learner_Chapter();
                l.setId(rs.getInt("id"));
                l.setChapter_id(rs.getInt("chapter_id"));
                l.setLearner_id(rs.getInt("learner_id"));
                l.setStatus(rs.getInt("status"));
                list.add(l);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    // Lay so luong chapter trong 1 course
    public int getNumberChapterInCourse(int course_id) {
        String sql = "Select count(*) from Chapter,Course\n"
                + "where Chapter.course_id = Course.course_id\n"
                + "and Course.course_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {

        }

        return 0;
    }

    // Lay so luong chapter done trong 1 course
    public int getNumberChapterDoneInCourse(int course_id, int learner_id) {
        String sql = "Select count (*) from Learner_Chapter, Chapter, Course, Account\n"
                + "where Learner_Chapter.chapter_id = Chapter.chapter_id\n"
                + "and Chapter.course_id = Course.course_id\n"
                + "and Learner_Chapter.learner_id = Account.account_id\n"
                + "and Course.course_id = ?\n"
                + "and Learner_Chapter.status = 1\n"
                + "and Account.account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course_id);
            st.setInt(2, learner_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {

        }

        return 0;
    }
}
