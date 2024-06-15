<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body style=" background-color: Black; color:black" >
    <h1 style="color:white;  text-align: center;">Order List</h1>
    <table>
        <tr style=" background-color: white; color:black">
            <th>Order ID</th>
            <th>Product Id</th>
            <th>Customer Id</th>
            <th>Order Quantity</th>
            <th>Date</th>
        </tr>
        <% 
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/login", "root", "12345");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM orders");
                while (rs.next()) {
        %>
        <tr style=" background-color: gray; color:white">
            <td><%= rs.getInt("o_id") %></td>
            <td><%= rs.getInt("p_id") %></td>
            <td><%= rs.getInt("u_id") %></td>
            <td><%= rs.getInt("o_quantity") %></td>
            <td><%= rs.getString("o_date") %></td>
            
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
