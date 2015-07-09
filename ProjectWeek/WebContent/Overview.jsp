<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Totalitea ACP</title>
</head>
<body>
<%= hb.getAdminBody() %>
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