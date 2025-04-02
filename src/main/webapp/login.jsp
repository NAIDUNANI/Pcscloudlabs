<%@ page import="com.dao.LoginBean" %>
<jsp:useBean id="loginBean" class="com.dao.LoginBean" scope="page"/>
<jsp:setProperty name="loginBean" property="email" param="email"/>
<jsp:setProperty name="loginBean" property="password" param="password"/>

<%
    String message = null;
    String messageColor = "red"; // Default error color

    if (request.getMethod().equalsIgnoreCase("POST")) {
        if (loginBean.validateUser()) {  
            session.setAttribute("userEmail", loginBean.getEmail()); // Store session
            message = loginBean.getMessage();
            messageColor = "green"; // Success message
        } else {
            session.removeAttribute("userEmail"); // Remove session if login fails
            message = loginBean.getMessage();
        }

        // Set session attributes for displaying messages
        session.setAttribute("loginMessage", message);
        session.setAttribute("loginMessageColor", messageColor);

        // Redirect to index.jsp to clear form input
        response.sendRedirect("index.jsp");
    }
%>
