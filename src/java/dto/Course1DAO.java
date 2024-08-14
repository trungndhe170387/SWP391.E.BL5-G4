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
import model.Category;
import model.Course;
import model.Learner_Course;
import model.Subject;

/**
 *
 * @author lam12
 */
public class Course1DAO extends DBContext {

    // Lay tat ca course o trong subject bao gom ca so luong lesson va chapter trong moi course
    public List<Course> getCourseBySubjectId(int subject_id) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "  Course.*,\n"
                + "  Category.category_name,\n"
                + "  (SELECT COUNT(Chapter.chapter_id)\n"
                + "   FROM Chapter  \n"
                + "   WHERE Chapter.course_id = Course.course_id) AS chapter_num,\n"
                + "  (SELECT COUNT(Lesson.lesson_id) \n"
                + "   FROM Lesson\n"
                + "   INNER JOIN Chapter ON Lesson.chapter_id = Chapter.chapter_id\n"
                + "   WHERE Chapter.course_id = Course.course_id) AS lesson_num, \n"
                + "ROUND(\n"
                + "(SELECT AVG(Learner_Course.rate)\n"
                + "FROM Learner_Course\n"
                + "WHERE Learner_Course.course_id = Course.course_id\n"
                + "GROUP BY Learner_Course.course_id), 1\n"
                + " ) AS rate_course\n"
                + "\n"
                + "FROM Course\n"
                + "INNER JOIN Subject ON Course.subject_id = Subject.subject_id  \n"
                + "INNER JOIN Category ON Category.category_id = Subject.category_id\n"
                + "WHERE Subject.subject_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageByte = rs.getBytes("image");
                String image = new String(Base64.getEncoder().encode(imageByte));
                Course c = new Course();
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                c.setImage(image);
                c.setSubject_id(rs.getInt("subject_id"));
                c.setCourse_no(rs.getInt("course_no"));
                c.setChapter_num(rs.getInt("chapter_num"));
                c.setLesson_num(rs.getInt("lesson_num"));
                c.setDescription(rs.getString("description"));
                c.setCategory_name(rs.getString("category_name"));
                c.setRate_course(rs.getDouble("rate_course"));
                list.add(c);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    // Lay 1 Course Detail
    public Course getCourseByCourseId(int subject_id, int course_id) {
        String sql = "SELECT\n"
                + "  Course.*,\n"
                + "  Category.category_name,\n"
                + "  (SELECT COUNT(Chapter.chapter_id)\n"
                + "   FROM Chapter  \n"
                + "   WHERE Chapter.course_id = Course.course_id) AS chapter_num,\n"
                + "  (SELECT COUNT(Lesson.lesson_id) \n"
                + "   FROM Lesson\n"
                + "   INNER JOIN Chapter ON Lesson.chapter_id = Chapter.chapter_id\n"
                + "   WHERE Chapter.course_id = Course.course_id) AS lesson_num, \n"
                + "ROUND(\n"
                + "(SELECT AVG(Learner_Course.rate)\n"
                + "FROM Learner_Course\n"
                + "WHERE Learner_Course.course_id = Course.course_id\n"
                + "GROUP BY Learner_Course.course_id), 1\n"
                + " ) AS rate_course\n"
                + "\n"
                + "FROM Course\n"
                + "INNER JOIN Subject ON Course.subject_id = Subject.subject_id  \n"
                + "INNER JOIN Category ON Category.category_id = Subject.category_id\n"
                + "WHERE Subject.subject_id = ? AND Course.course_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id);
            st.setInt(2, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageByte = rs.getBytes("image");
                String image = new String(Base64.getEncoder().encode(imageByte));
                Course c = new Course();
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                c.setImage(image);
                c.setSubject_id(rs.getInt("subject_id"));
                c.setCourse_no(rs.getInt("course_no"));
                c.setChapter_num(rs.getInt("chapter_num"));
                c.setLesson_num(rs.getInt("lesson_num"));
                c.setDescription(rs.getString("description"));
                c.setCategory_name(rs.getString("category_name"));
                c.setRate_course(rs.getDouble("rate_course"));
                return c;
            }

        } catch (SQLException e) {

        }

        return null;
    }

    // Update status course
    public void updateStatusCourse(Learner_Course c) {
        String sql = "UPDATE [dbo].[Learner_Course]\n"
                + "   SET [status] = 1\n"
                + "    \n"
                + " WHERE Learner_Course.course_id = ?\n"
                + " and Learner_Course.learner_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getCourse_id());
            st.setInt(2, c.getLearner_id());

            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    // Lay so luong course trong mot subject
    public int getNumberCourseInSubject(int subject_id) {
        String sql = "Select count(*) from Course, Subject\n"
                + "where Course.subject_id = Subject.subject_id\n"
                + "and Subject.subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {

        }

        return 0;
    }

    // Lay so luong course done trong mot chapter
    public int getNumberQuizDoneInChapter(int subject_id, int account_id) {
        String sql = "Select count(*) from Learner_Course, Course, Subject, Account\n"
                + "where Learner_Course.course_id = Course.course_id\n"
                + "and Course.subject_id = Subject.subject_id\n"
                + "and Learner_Course.learner_id = Account.account_id\n"
                + "and Learner_Course.status = 1\n"
                + "and Subject.subject_id = ?\n"
                + "and Learner_Course.learner_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id);
            st.setInt(2, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {

        }

        return 0;
    }

    // Lay va tra ve trang thai cua course cua learner
    public Learner_Course getLearnerCourseByCourseId(int learner_id, int course_id) {
        String sql = "SELECT *\n"
                + "  FROM [Learner_Course]\n"
                + "  where Learner_Course.course_id = ?\n"
                + "  and Learner_Course.learner_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course_id);
            st.setInt(2, learner_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Learner_Course c = new Learner_Course();
                c.setId(rs.getInt("id"));
                c.setCourse_id(rs.getInt("course_id"));
                c.setLearner_id(rs.getInt("learner_id"));
                c.setStatus(rs.getInt("status"));
                c.setRate(rs.getFloat("rate"));
                return c;
            }

        } catch (SQLException e) {

        }

        return null;
    }

    // Update rate course
    public void updateRateCourse(Learner_Course c) {
        String sql = "UPDATE [dbo].[Learner_Course]\n"
                + "SET [rate] = ?\n"
                + " WHERE Learner_Course.learner_id = ?\n"
                + " and Learner_Course.course_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(3, c.getCourse_id());
            st.setInt(2, c.getLearner_id());
            st.setFloat(1, c.getRate());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

} //end dao
