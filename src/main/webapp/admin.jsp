
<%@page import="com.dao.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String adminEmail = (String) session.getAttribute("adminEmail");

    // Handle Logout
    if (request.getParameter("logout") != null) {
        session.invalidate(); // Destroy session
        response.sendRedirect("admin.jsp");
        return;
    }

    // Handle Login
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminBean admin = new AdminBean();
        admin.setEmail(email);
        admin.setPassword(password);

        if (admin.validateAdmin()) {
            session.setAttribute("adminEmail", email);
            response.sendRedirect("admin.jsp");
            return;
        } else {
            request.setAttribute("error", "Invalid email or password!");
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ERP Admin | PCS Cloud Lab</title>

    <!-- Inline CSS for demo purposes -->
    <style>
        /* Basic Reset & Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        /* Body - Neutral Background */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f5f7fa;
        }

        /* Login Card */
        .login-card {
            width: 360px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.15);
            padding: 30px 25px;
            text-align: center;
            animation: fadeIn 0.5s ease-in-out;
        }

        /* Heading */
        .login-card h2 {
            font-size: 22px;
            color: #333;
            margin-bottom: 20px;
        }

        /* Error Message */
        .error {
            color: #e74c3c;
            font-size: 14px;
            margin-bottom: 15px;
        }

        /* Form Group */
        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #ccc;
        }

        /* Forgot Password Link */
        .forgot-password {
            text-align: right;
            margin-bottom: 15px;
        }

        .forgot-password a {
            font-size: 12px;
            color: #999;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        /* Submit Button */
        .btn-submit {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background-color: #28a745; /* Green button */
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-submit:hover {
            background-color: #218838;
        }
        
        .back-btn{
        	display:flex;
        	align-items:center;
        	width: 100px;
        	height: 30px;
        }
        .back-btn a{
        	text-decoration: none;
        	color: blue;
        }
        .back-btn a:hover{
        	color: orangered;
        }

        /* Fade-In Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-15px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Welcome Section for Logged-In Admin */
        .welcome-section {
            text-align: center;
        }
        .welcome-section h2 {
            margin-bottom: 20px;
        }
        .welcome-section a {
            color: #007BFF;
            text-decoration: none;
            font-weight: 500;
            margin: 0 10px;
        }
        .welcome-section a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- If admin not logged in, show login card -->
    <% if (adminEmail == null) { %>
        <div class="login-card">
		<div class="back-btn">
			<a href="index.jsp">Home</a>
		</div>
		<h2>Welcome to Admin Login</h2>

            <!-- Display error if credentials fail -->
            <% if (request.getAttribute("error") != null) { %>
                <div class="error"><%= request.getAttribute("error") %></div>
            <% } %>

            <form method="post">
                <!-- Email Field -->
                <div class="form-group">
                    <label for="email">Email</label>
                    <input 
                        type="email" 
                        name="email" 
                        id="email" 
                        placeholder="email@domain.com" 
                        required 
                    />
                </div>

                <!-- Password Field -->
                <div class="form-group">
                    <label for="password">Password</label>
                    <input 
                        type="password" 
                        name="password" 
                        id="password" 
                        placeholder="********" 
                        required 
                    />
                </div>

                <!-- Forgot Password Link -->
                <div class="forgot-password">
                    <a href="#">Forgot password?</a>
                </div>

                <!-- Submit Button -->
                <button class="btn-submit" type="submit">SUBMIT</button>
            </form>
        </div>

    <!-- If admin is logged in, show welcome section -->
    <% } else { %>
        <div class="welcome-section">
            <h2>Welcome, Admin</h2>
            <a href="admin-users-panel.jsp">Go to Users Panel</a> |
            <a href="admin-contact-panel.jsp">Go to Contact Us Panel</a> |
            <a href="index.jsp?logout=true">Logout</a>
        </div>
    <% } %>

</body>
</html>
