package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLConnection {

    // JavaBean representing a User
    public static class User {
        private int id;
        private String email;
        private String phoneNumber;
        private String password;
        private java.sql.Timestamp createdAt;

        public User(int id, String email, String phoneNumber, String password, java.sql.Timestamp createdAt) {
            this.id = id;
            this.email = email;
            this.phoneNumber = phoneNumber;
            this.password = password;
            this.createdAt = createdAt;
        }

        // Getters
        public int getId() { return id; }
        public String getEmail() { return email; }
        public String getPhoneNumber() { return phoneNumber; }
        public String getPassword() { return password; }
        public java.sql.Timestamp getCreatedAt() { return createdAt; }

        @Override
        public String toString() {
            return "User ID: " + id + "\n" +
                   "Email: " + email + "\n" +
                   "Phone Number: " + phoneNumber + "\n" +
                   "Password: " + password + "\n" +
                   "Created At: " + createdAt + "\n" +
                   "-------------------------";
        }
    }

    public static void main(String[] args) {
        // MySQL JDBC URL, username, and password
    	
    	String url = "jdbc:mysql://localhost:3306/pcscloudlabs?useSSL=false&allowPublicKeyRetrieval=true";
        String username = "cloudlabs";
        String password = "PCSGlobal@4321";

        // Establish the connection and query the Users table
        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement()) {

            System.out.println("Connected to MySQL database successfully!");

            // Query to retrieve all users
            String sql = "SELECT * FROM Users";
            try (ResultSet rs = stmt.executeQuery(sql)) {
                // Loop through the result set and display each user
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String email = rs.getString("Email");
                    String phone = rs.getString("PhoneNumber");
                    String pwd = rs.getString("Password");
                    java.sql.Timestamp createdAt = rs.getTimestamp("created_at");

                    User user = new User(id, email, phone, pwd, createdAt);
                    System.out.println(user);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
