package com.dao;

import java.sql.*;

public class ContactBean {
    private String name;
    private String email;
    private String mobile;
    private String message;

    // Getters and Setters
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }

    // Save to Database using try-with-resources
    public boolean saveToDatabase() {
        boolean status = false;
        String url = "jdbc:mysql://localhost:3306/pcscloudlabs?useSSL=false&allowPublicKeyRetrieval=true";
        String user = "cloudlabs";
        String pass = "PCSGlobal@4321";
        
        String sql = "INSERT INTO contact_form (name, email, mobile, message) VALUES (?, ?, ?, ?)";

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("JDBC Driver loaded successfully.");

            try (Connection conn = DriverManager.getConnection(url, user, pass);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, this.name);
                ps.setString(2, this.email);
                ps.setString(3, this.mobile);
                ps.setString(4, this.message);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    status = true;
                    System.out.println("Data successfully saved to the database.");
                }
            }
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
        return status;
    }
}