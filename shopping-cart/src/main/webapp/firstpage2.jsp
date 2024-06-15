<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>ACloth</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your T-Shirt Shop</title>
   


</head>
<body >


    <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: -1; background-image: url('product-images/222.jpg'); background-size: 1500px 900px; background-position: center; animation: slide 20s linear infinite;"></div>

	<%@include file="/includes/navbar.jsp"%>
	<div style="font-family: Arial, sans-serif; margin: 0; padding: 0;  display: flex; justify-content: center; align-items: center; height: 100vh;">
	<a href="index.jsp"  ><button  style="padding: 15px 30px; font-size: 18px; background-color: black; color: white; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s;" >Shop Now</button></a>
	
	</div>
	
	
		<%@include file="/includes/footer.jsp"%>
	
	


</body>
</html>