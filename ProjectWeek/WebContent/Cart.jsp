<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	    <link rel="stylesheet" href="./css/normalize.css" type="text/css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	    <link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,300' rel='stylesheet' type='text/css'>
	    <link rel="stylesheet" href="./css/styles.css" type="text/css">
		<title>Basket</title>
		
		<jsp:useBean id="bean" class="model.BasketBean" scope="page"/>
		
	</head>
	<body class="content">
	
		<nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><img src="./css/img/brand.png" alt="Logo" /></a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li><a href="search.jsp">Search</a></li>
                    <li class="active"><a href="Cart.jsp">Basket</a></li>
                    <li><a href="Order.jsp">Checkout</a></li>
                    <li>
                        <form class="navbar-form navbar-left" role="search" action="ControllingServlet" method="post">
                            <div class="form-group">
                                <input type="hidden" name="page" value="2">
                                <input type="hidden" name="searchType" value="name">
                                <input type="text" class="form-control" name="searchText" id="constSearch" placeholder="Search for an item">
                                <button type="submit" class="btn btn-success" id="constBtn">Search</button>
                            </div> <!-- /.form-group -->
                        </form><!-- /.navbar-form -->
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1 align="center"><br />This is the content of your basket<br /><br /></h1>
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>Item ID</th>
    				<th>Item name</th> <!-- Creates table and a row for column titles -->
    				<th>Item price</th>
    				<th>Stock</th>
                </tr>
            </thead>
            <tbody>
                <tr>
					<%= bean.displayCart(request) %> <!--  loop through the basket list and show all the items -->
				</tr>
				<tr>
					<th colspan="3"><p align="right">Total price</p></th>
					<td>£<%= bean.displayTotal() %></td>
				</tr>		
            </tbody>
        </table><!-- /.table -->
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4">
                <br /><br />
                <form action="search.jsp" method="post" style="background-color: rgba(0,0,0,0); display: inline-block; position:absolute; top:20%; left:15%;">
                	<button class="btn btn-default" type="submit" style="margin-right: 0px; ">Continue shopping</button>
                </form>
                <form action="Order.jsp" method="post" style="background-color: rgba(0,0,0,0); display: inline-block; position: absolute; top: 20%; left: 55%;">
                	<button class="btn btn-success" id="checkout" type="submit" style="margin-right: 0px;">Confirm and buy</button>
                </form>
            </div><!-- /.col-lg-4 -->
        </div>
    </div> <!-- /.container -->