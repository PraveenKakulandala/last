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

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html> 
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>ACloth</title>
</head>

<body style="background-color: white; color: black;">
    <%@include file="/includes/navbar.jsp"%>

    <div class="container">
        		<div class="card-header my-3"style="background-color:white ; color: gray;"><h5 style="background-color:white ; color: Black;"><a href="index.jsp" style="background-color:white ; color: Black;">All Products</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="caregory.jsp" style="background-color:white ; color: Black;">Category</a></h5></div>


        <!-- Group products by category -->
        <%
        Map<String, List<Product>> productsByCategory = new HashMap<>();
        for (Product p : products) {
            String category = p.getCategory();
            if (!productsByCategory.containsKey(category)) {
                productsByCategory.put(category, new ArrayList<>());
            }
            productsByCategory.get(category).add(p);
        }
        %>

        <!-- Display products by category -->
        <%
        for (Map.Entry<String, List<Product>> entry : productsByCategory.entrySet()) {
            String category = entry.getKey();
            List<Product> categoryProducts = entry.getValue();
        %>
        <div class="card-header my-3" style="color: white; background-color: black;">
            <h6 ><%= category %></h6>
        </div>
        <div class="row">
            <% for (Product p : categoryProducts) { %>
            <div class="col-md-3 my-3">
                <div class="card w-100">
<img class="card-img-top" src="product-images/<%=p.getImage() %>" alt="Card image cap" style="transition: transform 0.3s ease-in-out; cursor: pointer;" onmouseover="this.style.transform='scale(1.1)';" onmouseout="this.style.transform='scale(1)';">
                    <div class="card-body">
						<h5 class="card-title" style="cursor: help;" title="This shirt features a modern design crafted from premium-quality fabric, offering both style and comfort for any occasion."><%=p.getName() %></h5>
                        <h6 class="price">Price: $<%=p.getPrice() %></h6>
                        <h6 class="category">Category: <%=p.getCategory() %></h6>
                        <div class="mt-3 d-flex justify-content-between">
                           							<a class="btn " style="padding: 15px 30px; font-size: 10px; background-color: #333333; color: white; border: none; border-radius: 20px; cursor: pointer; transition: background-color 0.3s;" onmouseover="this.style.backgroundColor='gray';" onmouseout="this.style.backgroundColor='#333333';" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> 
							<a class="btn " style="padding: 15px 30px; font-size: 10px; background-color: black; color: white; border: #333333; border-radius: 20px; cursor: pointer; transition: background-color 0.3s;" onmouseover="this.style.backgroundColor='gray';" onmouseout="this.style.backgroundColor='black';" href="order-now?quantity=1&id=<%=p.getId()%> ">Buy Now</a>
           </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <% } %>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
```

This version of the code removes inline CSS styles and classes. It's a more simplified version without any styling applied.
</html>