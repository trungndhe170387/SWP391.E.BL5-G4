
package dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {
    protected Connection connection;
       public DBContext() {
        try {
<<<<<<< HEAD
            // Edit URL, username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1434;databaseName=HolaLearn";
            String username = "sa";
            String password = "123456";
=======
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName=HolaLearn1";
            String username = "sa";
            String password = "trung2003";
>>>>>>> origin/main
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connection established successfully.");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }

    public static void main(String[] args) {
        System.out.println(new DBContext().connection);
    }
}

