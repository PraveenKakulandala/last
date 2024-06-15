<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<head>
<%@include file="/includes/head.jsp"%>


  <style>
  		
       body {
  font-family: Arial, sans-serif; /* Set font family */
  background-color: black; /* Set background color */
  padding: 20px; /* Add padding to the body */
}

h1 {
  text-align: center; /* Center align the heading */
  color: white; /* Set text color to white */
  background-color: #333; /* Set background color for the heading */
  padding: 20px; /* Add padding around the heading */
}

h2 {
  text-align:center;
  color: #333; /* Set text color for heading */
}

form {
  max-width: 400px; /* Set max width for the form */
  margin: 0 auto; /* Center align the form */
  background-color: #fff; /* Set background color for the form */
  padding: 20px; /* Add padding to the form */
  border-radius: 5px; /* Add border radius to the form */
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Add shadow effect to the form */
}

label {
  display: block; /* Display labels as block elements */
  margin-bottom: 10px; /* Add bottom margin to labels */
  color: #333; /* Set text color for labels */
}

input[type="text"],
input[type="file"],
input[type="submit"] {
  width: calc(100% - 20px); /* Set input width */
  padding: 10px; /* Add padding to inputs */
  margin-bottom: 15px; /* Add bottom margin to inputs */
  border: 1px solid #ccc; /* Add border to inputs */
  border-radius: 5px; /* Add border radius to inputs */
}

input[type="submit"] {
  background-color: #333; /* Set background color for submit button */
  color: white; /* Set text color for submit button */
  cursor: pointer; /* Change cursor to pointer on hover */
}

input[type="submit"]:hover {
  background-color: #555; /* Change background color on hover */
}

    </style>
<meta charset="UTF-8">
<title>ACloth Shop</title>
</head>
<body>


  <h1 style="text-align: center; color:white;" >Add Product</h1>
    <form action="AddProductServlet" method="post" enctype="multipart/form-data">
        <label for="productId">Product ID:</label>
        <input type="text" id="productId" name="productId" required><br><br>
        
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required><br><br>
        
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" required><br><br>
        
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" required><br><br>
        
        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="image/*"><br><br>
        
        <input type="submit" value="Add Product">
    </form>









</body>
</html>