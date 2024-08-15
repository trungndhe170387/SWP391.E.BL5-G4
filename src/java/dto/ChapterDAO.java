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
import model.QuestionL;
import model.QuizResult;

/**
 *
 * @author lam12
 */
public class ChapterDAO extends DBContext {

    public List<Chapter> getListChapterByCourse_id(String course_id) {
        List<Chapter> list = new ArrayList<>();
        String query = "SELECT * FROM CHAPTER WHERE course_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, course_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Chapter c = new Chapter(rs.getInt("chapter_id"),
                        rs.getInt("chapter_no"),
                        rs.getString("chapter_name"),
                        rs.getInt("course_id"));
                list.add(c);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public int getQuizIdByChapId(String chapter_id) {
        int quizId = 0;
        String query = "select quiz_id from quiz where chapter_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, chapter_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                quizId = rs.getInt("quiz_id");
            }
        } catch (SQLException e) {
        }
        return quizId;
    }

    public boolean addQuizForChapter(String name, String chapter_id, String numOfQues) {
        String query = "INSERT INTO Quiz (name, chapter_id, numOfQues) "
                + "VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, name);
            st.setString(2, chapter_id);
            st.setString(3, numOfQues);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public Chapter addNewChapter(String chapter_no, String chapter_name, String course_id) {
        String query1 = "INSERT INTO Chapter (chapter_no, chapter_name, course_id) "
                + "VALUES (?, ?, ?)";
        String query2 = "SELECT TOP 1 * FROM Chapter ORDER BY chapter_id desc";
        try {
            PreparedStatement st1 = connection.prepareStatement(query1);
            PreparedStatement st2 = connection.prepareStatement(query2);
            st1.setString(1, chapter_no);
            st1.setString(2, chapter_name);
            st1.setString(3, course_id);
            int row = st1.executeUpdate();
            if (row > 0) {
                ResultSet rs = st2.executeQuery();
                if (rs.next()) {
                    Chapter chapter = new Chapter(rs.getInt("chapter_id"), rs.getInt("chapter_no"),
                            rs.getString("chapter_name"), rs.getInt("course_id"));
                    boolean isOk = addQuizForChapter(chapter_name, chapter.getChapter_id() + "", "0");
                    if (isOk) {
                        return chapter;
                    }
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean updateNumberQuestionOfQuiz(String numberOfQues, String chapter_id) {
        String query = "UPDATE Quiz\n"
                + "SET [numOfQues] = ?\n"
                + "WHERE chapter_id = ?\n";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, numberOfQues);
            st.setString(2, chapter_id);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public Chapter updateChapter(String chapter_no, String chapter_name, String chapter_id, String numQuesOfQuiz) {
        String query1 = "UPDATE Chapter\n"
                + "SET chapter_no = ?\n"
                + " ,chapter_name = ?\n"
                + "WHERE chapter_id = ?\n";
        String query2 = "SELECT * FROM Chapter WHERE chapter_id = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(query1);
            st1.setString(1, chapter_no);
            st1.setString(2, chapter_name);
            st1.setString(3, chapter_id);
            int row = st1.executeUpdate();
            if (row > 0) {
                PreparedStatement st2 = connection.prepareStatement(query2);
                st2.setString(1, chapter_id);
                ResultSet rs = st2.executeQuery();
                if (rs.next()) {
                    Chapter chapter = new Chapter(rs.getInt("chapter_id"), rs.getInt("chapter_no"),
                            rs.getString("chapter_name"), rs.getInt("course_id"));
                    boolean isOk = updateNumberQuestionOfQuiz(numQuesOfQuiz, chapter_id);
                    if (isOk) {
                        return chapter;
                    }
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean deleteChapter(String chapter_id) {
        String query1 = "DELETE FROM Chapter WHERE chapter_id = ?";
        String query2 = "DELETE FROM Quiz WHERE chapter_id = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(query1);
            PreparedStatement st2 = connection.prepareStatement(query2);
            st1.setString(1, chapter_id);
            int row = st1.executeUpdate();
            if (row > 0) {
                st2.setString(1, chapter_id);
                st2.executeUpdate();
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public int getNumberQuestionOfChapter(String chapter_id) {
        String query = "SELECT count(*) AS numberOfQuestion \n"
                + " FROM Question WHERE quiz_id = ?";
        int number = 0;
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, chapter_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                number = rs.getInt("numberOfQuestion");
            }
        } catch (SQLException e) {
        }
        return number;
    }

    public boolean checkNumberLevelQuestion(String selectedNumberQuestion_raw, String chapter_id) {

        String query = "SELECT COUNT(*)\n"
                + "FROM (\n"
                + "    SELECT *  \n"
                + "    FROM question\n"
                + "    WHERE quiz_id = ? and [level] = ?\n"
                + ") AS Subquery;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            int selectedNumberQues = Integer.parseInt(selectedNumberQuestion_raw);
            for (int i = 1; i <= 3; i++) {
                st.setString(1, chapter_id);
                st.setInt(2, i);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    int ques = rs.getInt(1);
                    if (i == 1 || i == 2) {
                        if (ques < selectedNumberQues * 40 / 100) {
                            return false;
                        }
                    } else if (i == 3) {
                        if (ques < selectedNumberQues * 20 / 100) {
                            return false;
                        }
                    }
                }
            }
        } catch (SQLException e) {
        }
        return true;
    }

    public List<QuestionL> createQuizForChapter(String chapter_id) {
        List<QuestionL> list = new ArrayList<>();
        Quiz2DAO q2d = new Quiz2DAO();
        int numberQuesOfQuiz = q2d.getNumberQuestionOfQuiz(chapter_id);
        if (numberQuesOfQuiz == 0) {
            return list = null;
        }
        String query = "";
        try {
            PreparedStatement st;
            int num = 0;
            for (int i = 1; i <= 3; i++) {
                if (i == 1 || i == 2) {
                    num = numberQuesOfQuiz * 40 / 100;
                } else if (i == 3) {
                    num = numberQuesOfQuiz * 20 / 100;
                }
                query = "SELECT TOP " + num + " *\n"
                        + "FROM question\n"
                        + "WHERE quiz_id = ?\n"
                        + "AND [level] = ?\n"
                        + "ORDER BY NEWID()";
                st = connection.prepareStatement(query);
                st.setString(1, chapter_id);
                st.setInt(2, i);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    QuestionL q = new QuestionL(rs.getInt("question_id"),
                            rs.getString("content"),
                            rs.getString("option1"),
                            rs.getString("option2"),
                            rs.getString("option3"),
                            rs.getString("option4"),
                            rs.getInt("answer"),
                            rs.getInt("subject_id"),
                            rs.getInt("quiz_id"),
                            rs.getInt("level"));
                    list.add(q);
                }
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean updateQuizResult(String learner_id, String quiz_id, double mark, String status) {
        String updateQuery = "UPDATE [dbo].[Quiz_Result]\n"
                + "   SET [mark] = ?\n"
                + "   ,[status] = ?\n"
                + " WHERE quiz_id = ? AND learner_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(updateQuery);
            st.setDouble(1, mark);
            st.setString(2, status);
            st.setString(3, quiz_id);
            st.setString(4, learner_id);
            int updatedRow = st.executeUpdate();
            if (updatedRow == 0) {
                String insertQuery = "INSERT INTO [dbo].[Quiz_Result]\n"
                        + "           ([learner_id]\n"
                        + "           ,[quiz_id]\n"
                        + "           ,[mark]\n"
                        + "           ,[status])\n"
                        + "     VALUES\n"
                        + "           (?, ?, ?, ?)";
                st = connection.prepareStatement(insertQuery);
                st.setString(1, learner_id);
                st.setString(2, quiz_id);
                st.setDouble(3, mark);
                st.setString(4, status);
                int insertedRow = st.executeUpdate();
                if (insertedRow > 0) {
                    return true;
                }
            } else if (updatedRow > 0) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public QuizResult getQuizResult(String quiz_id, String learner_id) {
        String query = "select * from Quiz_Result \n"
                + "where quiz_id = ?\n"
                + "and learner_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, quiz_id);
            st.setString(2, learner_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new QuizResult(rs.getInt("id"), rs.getInt("learner_id"), rs.getInt("quiz_id"), rs.getFloat("mark"), rs.getInt("status"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

}
