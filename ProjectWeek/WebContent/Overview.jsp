<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Totalitea ACP</title>
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
<div class="alert alert-success" role="alert">
  <a href="#" class="alert-link">You have successfully connected to the ACP!</a>
</div>
<div class="bs-example" data-example-id="contextual-panels">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">Customers Registered</h3>
      </div>
      <div class="panel-body">
        Panel content
      </div>
    </div>
    <div class="panel panel-success">
      <div class="panel-heading">
        <h3 class="panel-title">Number of Products</h3>
      </div>
      <div class="panel-body">
        Panel content
      </div>
    </div>
    <div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">Orders Placed</h3>
      </div>
      <div class="panel-body">
        Panel content
      </div>
    </div>
</body>
</html>