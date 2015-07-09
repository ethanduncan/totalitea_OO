<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<!--  hi -->
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add item</title>
		<%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
		
		<jsp:useBean id="beanUse" class = "model.AddItemBean" scope = "page"/>
	
	</head>
	
	<body>
	<!--  Navigation bar -->
	<%= hb.getAdminBody() %>
	
		<%String catAdd = (String) request.getSession().getAttribute("catAdd"); %> <!-- retrieves the searchText and searchType variables from the session data -->
		<%String descAdd = (String) request.getSession().getAttribute("descAdd"); %>
		<%String weightAdd = (String) request.getSession().getAttribute("weightAdd"); %>
		<%String priceAdd = (String) request.getSession().getAttribute("priceAdd"); %>
		<%String quantityAdd = (String) request.getSession().getAttribute("quantityAdd"); %>
		<% beanUse.adding(catAdd, descAdd, weightAdd, priceAdd, quantityAdd); %>
		
		
		<div class="container">
			<h1 align="center">
				<i class="fa fa-check-circle-o fa-5x"></i>
				Item added successfully
				</br>
			<a href="addItem.jsp">Add more items</a>
			</h1>
		</div>
	
	</body>
</html>