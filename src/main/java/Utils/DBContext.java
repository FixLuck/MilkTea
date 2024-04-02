package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection conn;
    public DBContext() {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=MilkTea;encrypt=true;trustServerCertificate=true";
            String user = "sa";
            String pass = "sa123456";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }
}
