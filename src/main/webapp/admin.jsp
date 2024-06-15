<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>


<% 
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());

List<Product> products = pd.getAllProducts();



%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>


  <style>
  		
      body {
  background-color: black; /* Set background color */
  font-family: Arial, sans-serif; /* Set font family */
}

h4 {
   text-align: center; /* Center align the heading */
  color: white; /* Set text color to white */
  background-color: black; /* Set background color for the heading */
  padding: 20px; /* Add padding around the heading */
}

h1 {
  text-align: center; /* Center align the heading */
  color: white; /* Set text color to white */
  background-color: #333; /* Set background color for the heading */
  padding: 20px; /* Add padding around the heading */
}

a {
  display: block; /* Display links as block elements */
  text-decoration: none; /* Remove underline from links */
  color: white; /* Set text color for links */
  padding: 10px; /* Add padding around the links */
  margin: 10px; /* Add margin around the links */
  border: 1px solid #333; /* Add border around the links */
  border-radius: 5px; /* Add border radius to make links rounded */
}

a:hover {
  background-color: #333; /* Change background color on hover */
  color: #fff; /* Change text color on hover */
}

    </style>
<meta charset="UTF-8">
<title>ACloth Shop</title>
</head>
<body>

  <h1 style="text-align: center; color:white;" >    <span style="color:red;">A</span>Cloth Admin Panel</h1>
  <h4>"Welcome to the Control Center."</h4><br>
  
  <br><a style="  background-color: green;" href="addProduct.jsp">Add Product</a>
    <br><a style="  background-color: red;" href="removeProduct.jsp">Remove Product</a>
    <br><a style="  background-color: orange;" href="viewProduct.jsp">View Product</a>
        <br><a style="  background-color: blue;" href="productList.jsp">Orders</a>
                <br><a style="  background-color: gray;" href="customerInfo.jsp">Customer Info</a>
        
        <br><a style="  background-color: brown;" href="adminInfo.jsp">Admin Info</a>
    
  <br><a href="index.jsp" style="display: block; width: 150px; padding: 10px; text-align: center; background-color: white; color:black ; text-decoration: none; border-radius: 5px; margin: 0 auto;">Go to Shop</a>

  
</body>
</html>