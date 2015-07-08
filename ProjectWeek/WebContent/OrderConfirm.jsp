<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>TotaliTEA - Order placed</title>
		<jsp:useBean id="bean" class="model.OrderBean" scope="page"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	    <link rel="stylesheet" href="./css/normalize.css" type="text/css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	    <link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,300' rel='stylesheet' type='text/css'>
	    <link rel="stylesheet" href="./css/styles.css" type="text/css">
	</head>
	<body class="content">
		<% 	bean.addOrderToDatabase(request); //Send the order to the database
			bean.decrementStock(request); //Decrement the quantity of each item bought that's left in stock
			request.getSession().setAttribute("cart", null); //Reset the contents of the cart
			//bean.writeOrder(); //Write the contents of the order to a .txt file%> 
			<h1 align="center">
				<br /><br />
				<i class="fa fa-check-circle-o fa-5x"></i><br /><br />
				<span style="font-size: 45pt">Success</span>
			</h1>
			<h3 align="center">Your order has been processed successfully.  <br />Please go back and login using the form to access the site.</h3>
			<button class ="btn btn-default" style="position: absolute; left: 42.5%; top: 75%; font-size: 16pt; font-weight: 400;">Return to login page</button>
		

	</body>
</html>