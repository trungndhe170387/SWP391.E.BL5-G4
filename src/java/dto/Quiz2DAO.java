/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author lam12
 */
public class Quiz2DAO extends DBContext {

    public int getNumberQuestionOfQuiz(String chapter_id) {
        String query = " SELECT [numOfQues] FROM [Quiz] WHERE chapter_id = ?";
        int number = 0;
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, chapter_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                number = rs.getInt("numOfQues");
            }
        } catch (SQLException e) {
        }
        return number;
    }
    
    public static void main(String[] args) {
        Quiz2DAO q2d = new Quiz2DAO();
        System.out.println(q2d.getNumberQuestionOfQuiz("1"));
    }
}
