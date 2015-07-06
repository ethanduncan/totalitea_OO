<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	    <title>TotaliTEA - Add an item</title>
	    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="./styles.css">
	
	</head>
	
	<body>
<nav class="navbar navbar-inverse">
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
<div class="alert alert-info" role="alert">
  <a href="#" class="alert-link">Add an Item to the Database here. Please make sure you follow correct procedure.</a>
</div>
	<!--  Add -->
	
		<div class="container">
			<h1>Add an item to the database</h1>
		
			<form form action="ControllingServlet" method="GET">
	            <input type="hidden" name="page" value="5"/>
	            <label for="catAdd">Item Category: </label>
	            <input type="text" placeholder="category" name="catAdd" class="form-control"/> <br />
	            <label for="descAdd">Description: </label>
	            <input type="text" placeholder="description" name="descAdd" class="form-control"/> <br />
	            <label for="weightAdd">Item Weight: </label>
	            <input type="text" placeholder="Item Weight" name="weightAdd" class="form-control"/> <br />
	            <label for="priceAdd">Price: </label>
	            <input type="text" placeholder="Price" name="priceAdd" class="form-control"/> <br />
	            <label for="quantityAdd">Quantity in stock: </label>
	            <input type="text" placeholder="Quantity in stock" name="quantityAdd" class="form-control"/> <br />
	            <button type="reset" class="btn btn-danger">Clear</button>
	            <button type="submit" class="btn btn-success">Submit</button>
	        </form>
        
        </div>
	
	</body>
	
</html>