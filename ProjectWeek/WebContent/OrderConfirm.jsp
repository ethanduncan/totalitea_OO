<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>TotaliTEA - Order placed</title>
		<jsp:useBean id="bean" class="model.OrderBean" scope="page"/>
		<%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
	</head>
	<body class="content">
		<% 	bean.addOrderToDatabase(request); //Send the order to the database
			bean.decrementStock(request); //Decrement the quantity of each item bought that's left in stock
			request.getSession().setAttribute("cart", null); //Reset the contents of the cart
			bean.writeOrder(); //Write the contents of the order to a .txt file%> 
			<%= hb.getBody() %>
			<h1 align="center">
				<br /><br />
				<i class="fa fa-check-circle-o fa-5x"></i><br /><br />
				<span style="font-size: 45pt">Success</span>
			</h1>
			<h3 align="center">Your order has been processed successfully.</h3>
		

	</body>
</html>