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
import model.Quiz;
import model.QuizResult;

/**
 *
 * @author admin
 */
public class Quiz1DAO extends DBContext {

    // Lay tat ca chapter theo course
    public List<Quiz> getQuizByCourseId(int course_id) {
        List<Quiz> list = new ArrayList<>();
        String sql = "SELECT Quiz.*\n"
                + "  FROM [Chapter],Quiz, Course\n"
                + "  where Chapter.chapter_id = Quiz.chapter_id\n"
                + "  and Course.course_id = Chapter.course_id\n"
                + "  and Course.course_id = ?\n"
                + "  ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Quiz q = new Quiz();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setName(rs.getString("name"));
                q.setChapter_id(rs.getInt("chapter_id"));
                list.add(q);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    // Lay status cua quiz 
    public List<QuizResult> getStatusByCourseId(int course_id, int learner_id) {
        List<QuizResult> list = new ArrayList<>();
        String sql = "				  SELECT Quiz_Result.*\n"
                + "                 FROM [Quiz_Result],Quiz, Chapter, Course\n"
                + "                  where Quiz_Result.quiz_id = Quiz.quiz_id\n"
                + "                  and Quiz.chapter_id = Chapter.chapter_id\n"
                + "                 and Chapter.course_id =Course.course_id\n"
                + "				 and Quiz_Result.learner_id = ?\n"
                + "                 and Course.course_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, learner_id);
            st.setInt(2, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                QuizResult q = new QuizResult();
                q.setId(rs.getInt("id"));
                q.setLearner_id(rs.getInt("learner_id"));
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setMark(rs.getFloat("mark"));
                q.setStatus(rs.getInt("status"));
                list.add(q);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    // Lay so luong quiz trong mot chapter
    public int getNumberQuizInChapter(int chapter_id) {
        String sql = "Select count(*) from  Quiz, Chapter\n"
                + "where Quiz.chapter_id = Chapter.chapter_id\n"
                + "and Chapter.chapter_id = ? ";
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

    // Lay so luong quiz trong mot chapter
    public int getNumberQuizDoneInChapter(int chapter_id, int account_id) {
        String sql = "Select count(*) from  Quiz, Chapter, Quiz_Result, Account\n"
                + "where Quiz.chapter_id = Chapter.chapter_id\n"
                + "and Quiz.quiz_id = Quiz_Result.quiz_id\n"
                + "and Account.account_id = Quiz_Result.learner_id\n"
                + "and Chapter.chapter_id = ?\n"
                + "and Account.account_id = ?\n"
                + "and Quiz_Result.status = 1";
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
