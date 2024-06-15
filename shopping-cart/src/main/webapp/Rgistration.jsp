<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>ACloth Shop</title>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Register</div>
			<div class="card-body">
				<form action="register" method="post">
					<div class="form-group">
						<label>Name</label> 
						<input type="text" name="name" class="form-control" placeholder="Enter Name" required>
					</div>
					<div class="form-group">
						<label>Email</label> 
						<input type="email" name="email" class="form-control" placeholder="Enter Email" required>
					</div>
					<div class="form-group">
						<label>Password</label> 
						<input type="password" name="password" class="form-control" placeholder="Enter Password" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-dark">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<%@include file="/includes/footer.jsp"%>
</body>
</html>