<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<!--  hi -->
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add item</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
		<jsp:useBean id="beanUse" class = "model.AddItemBean" scope = "page"/>
	
	</head>
	
	<body>
	<!--  Navigation bar -->
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Admin Control Panel</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="Overview.jsp">Home</a></li>
        <li><a href="addItem.jsp">Add Item</a></li>
        <li><a href="StockReport.jsp">Stock Report</a></li> 
        <li><a href="AdminLogin.jsp">Logout[admin]</a></li> 
      </ul>
    </div>
  </div>
</nav>
	
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