<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>TotaliTEA - Your order</title>
		<jsp:useBean id="bean" class="model.OrderBean" scope="page"/>
		<%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
		<%@ page import="domain.Basket" %>
		<%@ page import="service.OrderService" %><!-- imports all the pages that will be used by the scriptlets on this page -->
		<%@ page import="dto.Customer" %>
	</head>
	<body class="content">
	
		<%= hb.getBody() %>
	
		<div class="container">
	
			<span style="display:none;"><%=		bean.orderToString(request) %> <!--  passes the request forwarded to this jsp to the orderToString method. Returns the string to the page. The string has html tags contained within it so there is no formatting here -->
			<%		Basket basket = (Basket) request.getSession().getAttribute("cart"); %></span>
		
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
			    <button type="submit" class="btn btn-success" style="margin-left: 45%;">Submit</button><!-- input to allow for the user to include and special delivery instructions they may have -->
		    </form>
		</div>
	</body>
</html>