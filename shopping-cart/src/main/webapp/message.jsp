
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .message {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .success {
            color: #007bff;
        }
        .error {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="message">
        <% String message = (String) request.getAttribute("Message"); %>
        <h2 class="<%= message.startsWith("ERROR") ? "error" : "success" %>"><%= message %></h2>
        <a href="index.jsp">Go Back</a>
    </div>
</body>
</html>
