package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.PcsDatabaseConnection;


public class AdminBean {
    private String email;
    private String password;
    private String created_at;

    // Getters and Setters
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() { // ✅ Fixed method name
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    // ✅ Validate admin login
    public boolean validateAdmin() {
        boolean isValid = false;
        String sql = "SELECT * FROM Admins WHERE Email = ? AND Password = ?";

        try (Connection conn = PcsDatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                this.created_at = rs.getString("Created_at"); // Retrieve created_at
                isValid = true; // Admin credentials are valid
            }

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isValid;
    }
}
