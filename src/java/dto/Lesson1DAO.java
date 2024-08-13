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
import model.Chapter;
import model.Learner_Lesson;
import model.Lesson;

/**
 *
 * @author admin
 */
public class Lesson1DAO extends DBContext {

    // Lay tat ca lesson theo course
    public List<Lesson> getLessonByCourseId(int course_id) {
        List<Lesson> list = new ArrayList<>();
        String sql = "SELECT Lesson.* FROM [Chapter], Course,Lesson\n"
                + "where  Chapter.course_id = Course.course_id\n"
                + "and Chapter.chapter_id = Lesson.chapter_id\n"
                + "and Course.course_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson l = new Lesson();
                l.setLesson_id(rs.getInt("lesson_id"));
                l.setChapter_id(rs.getInt("chapter_id"));
                l.setLesson_no(rs.getInt("lesson_no"));
                l.setLesson_name(rs.getString("lesson_name"));
                l.setDocument(rs.getString("document"));
                l.setVideo(rs.getString("video"));
                l.setDescription(rs.getString("description"));
                list.add(l);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    //
    // Lay tat ca lesson theo course
    public Lesson getLessonByLessonId(int lesson_id) {

        String sql = "Select * from Lesson\n"
                + "where Lesson.lesson_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lesson_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson l = new Lesson();
                l.setLesson_id(rs.getInt("lesson_id"));
                l.setChapter_id(rs.getInt("chapter_id"));
                l.setLesson_no(rs.getInt("lesson_no"));
                l.setLesson_name(rs.getString("lesson_name"));
                l.setDocument(rs.getString("document"));
                l.setVideo(rs.getString("video"));
                l.setDescription(rs.getString("description"));
                return l;
            }

        } catch (SQLException e) {

        }

        return null;
    }

    // Lay status cua Lesson
    public List<Learner_Lesson> getLearnerLessonByCourseId(int course_id, int learner_id) {
        List<Learner_Lesson> list = new ArrayList<>();
        String sql = "  SELECT Learner_Lesson.* \n"
                + "                FROM [Learner_Lesson],Lesson, Chapter, Course\n"
                + "                 where Learner_Lesson.lesson_id = Lesson.lesson_id\n"
                + "                 and Lesson.chapter_id = Chapter.chapter_id\n"
                + "                 and Chapter.course_id = Course.course_id\n"
                + "				 and Learner_Lesson.learner_id = ?\n"
                + "                 and Course.course_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, learner_id);
            st.setInt(2, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Learner_Lesson l = new Learner_Lesson();
                l.setId(rs.getInt("id"));
                l.setLearner_id(rs.getInt("learner_id"));
                l.setLesson_id(rs.getInt("lesson_id"));
                l.setStatus(rs.getInt("status"));
                list.add(l);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    // Update status cua learner_lesson
    public void updateStatusLesson(Learner_Lesson l) {
        String sql = "UPDATE [dbo].[Learner_Lesson]\n"
                + "   SET [status] = 1\n"
                + "	  WHERE Learner_Lesson.learner_id = ?\n"
                + "	  and Learner_Lesson.lesson_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, l.getLearner_id());
            st.setInt(2, l.getLesson_id());

            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    // Lay so luong lesson co san trong mot chapter
    public int getNumberLessonInChapter(int chapter_id) {
        String sql = "SELECT count(*)\n"
                + "  FROM [Lesson], Chapter\n"
                + "  where Lesson.chapter_id = Chapter.chapter_id\n"
                + "  and Chapter.chapter_id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, chapter_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {

        }

        return 0;
    }

    // Lay so luong lesson da hoan thanh cua 1 learner trong mot chapter
    public int getNumberLessonDoneInChapter(int chapter_id, int account_id) {
        String sql = "Select count(*) from Lesson, Learner_Lesson, Chapter, Account\n"
                + "where Lesson.chapter_id = Chapter.chapter_id\n"
                + "and Lesson.lesson_id = Learner_Lesson.lesson_id\n"
                + "and Account.account_id = Learner_Lesson.learner_id\n"
                + "and Chapter.chapter_id = ?\n"
                + "and Account.account_id = ?\n"
                + "and Learner_Lesson.status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, chapter_id);
            st.setInt(2, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {

        }

        return 0;
    }

}
