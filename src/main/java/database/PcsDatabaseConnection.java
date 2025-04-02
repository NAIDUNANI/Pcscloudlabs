package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PcsDatabaseConnection {
    private static Connection connection = null;

    // Private constructor to prevent instantiation
    private PcsDatabaseConnection() {}

    public static Connection getConnection() {
        try {
            // If connection is null or closed, establish a new connection
            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pcscloudlabs?useSSL=false&allowPublicKeyRetrieval=true",
                    "cloudlabs",
                    "PCSGlobal@4321"
                );
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
