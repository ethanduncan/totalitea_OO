<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>TotaliTEA - Your order</title>
		<jsp:useBean id="bean" class="model.OrderBean" scope="page"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	    <link rel="stylesheet" href="./css/normalize.css" type="text/css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	    <link href="http://fonts.googleapis.com/css?family=Fira+Sans:400,300" rel="stylesheet" type="text/css">
	    <link rel="stylesheet" type="text/css" href="./css/styles.css">
		<%@ page import="domain.Basket" %>
		<%@ page import="service.OrderService" %><!-- imports all the pages that will be used by the scriptlets on this page -->
		<%@ page import="dto.Customer" %>
	</head>
	<body class="content">
	
		<div class="container">
	
			<%=		bean.orderToString(request) %> <!--  passes the request forwarded to this jsp to the orderToString method. Returns the string to the page. The string has html tags contained within it so there is no formatting here -->
			<%		Basket basket = (Basket) request.getSession().getAttribute("cart"); %>
		
			<h1 align="center">Here's your order details</h1>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Item ID</th>
						<th>Item</th>
						<th>Item weight</th>
						<th>Item price</th>
					</tr>
				</thead>
				<tbody>
					<%=basket.displayBasket() %>
					<tr>
						<th colspan="3">Shipping cost</th>
						<td>£<%=bean.getShippingCost(request) %>
					</tr>
					<tr>
						<th colspan="3">Total cost</th>
						<td>£<%= bean.getShippingCost(request).add(basket.getTotalBasketPrice()) %>
					</tr>
				</tbody>
			</table>
			<!-- retrieves the cart object from the session and casts it to basket so it can be used on this jsp-->
			<label for="deliveryInstructions">Special Delivery Instructions: </label>
			<form action="ControllingServlet" method="GET" style="background-color: rgba(0,0,0,0); margin-top: 0px;">
				<input type="hidden" name="page" value="6" />
			    <input type="text" placeholder="Special Delivery instructions, e.g. 'Leave it in the porch and close the door'" name="deliveryInstructions" class="form-control"/> <br />
			    <button type="submit" class="btn btn-success">Submit</button><!-- input to allow for the user to include and special delivery instructions they may have -->
		    </form>
		</div>
	</body>
</html>