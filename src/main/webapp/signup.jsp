<%@ page import="com.dao.SignUpBean" %>
<%
    String message = null;
    String messageColor = "red";

    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phone_number");
    String password = request.getParameter("password");

    if (email != null && phoneNumber != null && password != null &&
        !email.isEmpty() && !phoneNumber.isEmpty() && !password.isEmpty()) {
        
        SignUpBean user = new SignUpBean(email, phoneNumber, password);
        boolean success = user.save();

        if (success) {
            message = "Your Email successful verified! Please Login";
            messageColor = "green";
            response.sendRedirect("verify.jsp");
        } else {
            message = "Signup failed. You may already be registered.";
            response.sendRedirect("index.jsp");
        }
    } else {
        message = "All fields are required!";
    }

    session.setAttribute("signupMessage", message);
    session.setAttribute("messageColor", messageColor);
    
%>
