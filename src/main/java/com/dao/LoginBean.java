package com.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginBean implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private String email;
    private String password;
    private String message;
    private boolean validUser;

    // Getters and Setters
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getMessage() { return message; }
    public boolean isValidUser() { return validUser; }

    // Database connection and validation method
    public boolean validateUser() {
    	String url = "jdbc:mysql://localhost:3306/pcscloudlabs?useSSL=false&allowPublicKeyRetrieval=true";
        String username = "cloudlabs";
        String dbPassword = "PCSGlobal@4321";

        try (Connection connection = DriverManager.getConnection(url, username, dbPassword)) {
            System.out.println("Database Connected Successfully!");
            
            // Check if the user exists and is verified
            String sql = "SELECT * FROM Users WHERE Email = ? AND Password = ? AND Verified = 1";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, password);

                System.out.println("Executing query: " + sql);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        validUser = true;
                        message = "Login Successful! Welcome back, " + resultSet.getString("Email") + ".";
                        System.out.println(message);
                    } else {
                        validUser = false;
                        message = "Invalid email, password, or email not verified.";
                        System.out.println(message);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            validUser = false;
            message = "Error during login. Please try again later.";
        }
        return validUser;
    }
}
