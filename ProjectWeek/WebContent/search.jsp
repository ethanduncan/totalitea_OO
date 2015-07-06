<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html>
<head>
    <title>TotaliTEA -- Dummy -- Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="./css/normalize.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="./css/styles.css">    
    <jsp:useBean id="bean" class="model.LoginBean" scope="session"/>
    <%@ page import="dto.Customer" %>
</head>

<body class="landing">

	<div class="container">
		
		<h2>
			<% 
				Customer customer = (Customer) request.getSession().getAttribute("customer");
				    		
				if(customer.isGoldMember()){
				%>Welcome, Gold member <%=customer.getFirstName() %>
			<%}%><!-- retrieves the customer object from the session to check if the user logging in is a gold member, if they are the website will greet them by name -->
		    	
		</h2>
		<br /><br /><br />
	    <form action="ControllingServlet" method="get" align="center">
	    	<input type="hidden" name="page" value="2">
	        <h1 align="center">Browse our collection of teas <br />from all over the world</h2>
	        <input type="text" name="searchText" class="form-control" placeholder="Search for an item in our collection of fine teas" id="search"> <br />
	        <div class="row">
	            <div class="col-lg-3 col-lg-offset-2">
	                <p><b>Search by name</b></p>
	            </div><!-- /.col-lg-3 -->
	            <div class="col-lg-1">
	                <input type="radio" id="searchtype" name="searchType" value="name" checked>
	            </div><!-- /.col-lg-1 -->
	            <div class="col-lg-3 col-lg-offset-1">
	                <p><b>Search by category</b></p>
	            </div><!-- /.col-lg-3 -->
	            <div class="col-lg-1">
	                <input type="radio" id="searchtype" name="searchType" value="category">
	            </div><!-- /.col-lg-1 -->
	        </div><!-- /.row -->
	        <button type="submit" class="btn btn-success" id="search">Search</button>
	        <br /><br />
	    </form>
    
    </div>

</body>
</html>
