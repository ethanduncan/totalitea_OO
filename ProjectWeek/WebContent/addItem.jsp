<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	    <title>TotaliTEA - Add an item</title>
	    <%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
	
	</head>
	
	<body>

		<%= hb.getAdminBody() %>
		
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