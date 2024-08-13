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
import model.Category;

<<<<<<< HEAD
/**
 *
 * @author lam12
 */
=======
>>>>>>> 50e0590cedc61de77d14f50d4efd376d201b7d85
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category cate = new Category(rs.getInt("category_id"), rs.getString("category_name"));
                list.add(cate);
            }
        } catch (SQLException e) {
        }
        return list;
    }

}
