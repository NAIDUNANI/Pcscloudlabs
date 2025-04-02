package com.dao;

import java.sql.*;
import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;

public class SignUpBean {
    private String email;
    private String phoneNumber;
    private String password;
    private String verificationCode;

    public SignUpBean() {}

    public SignUpBean(String email, String phoneNumber, String password) {
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.verificationCode = generateCode(); // Generate a verification code
    }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    private Connection connect() throws Exception {
    	String url = "jdbc:mysql://localhost:3306/pcscloudlabs?useSSL=false&allowPublicKeyRetrieval=true";
        String dbUser = "cloudlabs";
        String dbPassword = "PCSGlobal@4321";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, dbUser, dbPassword);
    }

    private String generateCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000); // 6-digit code
        return String.valueOf(code);
    }

    private void sendVerificationEmail(String recipient, String code) {
    	
    	final String from = "noreply@pcscloudlabs.com";
    	final String appPassword = "pcscloudlabs@123";
    	
    	Properties props = new Properties();
    	props.put("mail.smtp.auth", "true");
    	props.put("mail.smtp.ssl.enable", "true");
    	props.put("mail.smtp.host", "mail.pcscloudlabs.com");
    	props.put("mail.smtp.port", "465");
    	props.put("mail.smtp.ssl.protocols", "TLSv1.2");

    	

    	Session session = Session.getInstance(props, new Authenticator() {
    	    protected PasswordAuthentication getPasswordAuthentication() {
    	        return new PasswordAuthentication(from, appPassword);
    	    }
    	});

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject("Email Verification to Activate Your PCSCloudlabs Account");
            message.setText("Dear User,\n\n\n\nYour verification code is: " + code + "\n\n\n\nPlease verify your email to activate your PCSCloudlabs account.\n\nThank you!");

            // Send the email
            Transport.send(message);
            System.out.println("Verification email sent successfully to: " + recipient);
        } catch (MessagingException e) {
            System.err.println("Failed to send verification email. Please check your email settings.");
            e.printStackTrace();
        }
    }

    public boolean save() {
        boolean success = false;
        String sql = "INSERT INTO Users (Email, PhoneNumber, Password, Created_at, verification_code, verified) VALUES (?, ?, ?, NOW(), ?, 0)";
        try (Connection conn = connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, this.email);
            ps.setString(2, this.phoneNumber);
            ps.setString(3, this.password);
            ps.setString(4, this.verificationCode);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                sendVerificationEmail(this.email, this.verificationCode);
                success = true;
                System.out.println("User registered. Verification email sent.");
            }
        } catch (Exception e) {
            System.err.println("Error during user registration:");
            e.printStackTrace();
        }
        return success;
    }

    public boolean verifyUser(String email, String code) {
        String sql = "SELECT verification_code FROM Users WHERE email = ? AND verified = 0";
        try (Connection conn = connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next() && rs.getString("verification_code").equals(code)) {
                String updateQuery = "UPDATE Users SET verified = 1 WHERE email = ?";
                try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                    updateStmt.setString(1, email);
                    updateStmt.executeUpdate();
                }
                return true;
            }
        } catch (Exception e) {
            System.err.println("Error during email verification:");
            e.printStackTrace();
        }
        return false;
    }
}
