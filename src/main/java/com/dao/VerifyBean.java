package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class VerifyBean {
    private String email;
    private String verificationCode;
    private String message;
    private boolean verified;

    // Getters and Setters
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getVerificationCode() { return verificationCode; }
    public void setVerificationCode(String verificationCode) { this.verificationCode = verificationCode; }

    public String getMessage() { return message; }
    public boolean isVerified() { return verified; }

    // Database connection method
    private Connection connect() throws Exception {
        String url = "jdbc:mysql://localhost:3306/pcscloudlabs?useSSL=false&allowPublicKeyRetrieval=true";
        String dbUser = "cloudlabs";
        String dbPassword = "PCSGlobal@4321";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, dbUser, dbPassword);
    }

    // Method to verify the code
    public boolean verifyUser() {
        String sql = "SELECT verification_code FROM Users WHERE email = ? AND verified = 0";
        try (Connection conn = connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next() && rs.getString("verification_code").equals(verificationCode)) {
                String updateQuery = "UPDATE Users SET verified = 1 WHERE email = ?";
                try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                    updateStmt.setString(1, email);
                    updateStmt.executeUpdate();
                }
                verified = true;
                message = "Email verified successfully! You can now log in.";
            } else {
                verified = false;
                message = "Invalid verification code or email already verified.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error during email verification.";
        }
        return verified;
    }
}
