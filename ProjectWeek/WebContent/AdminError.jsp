<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Error</title>
		<%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
	</head>
	<body>
		<h1 align="center"><br /><br /><i class="fa fa-times-circle fa-5x style="color:red""></i></h1>
		<h2 align="center">Something went wrong with your login.</h2>
		<h4 align="center">Are you sure you are an admin!?</h4>
		<p align="center"><a class="btn btn-default" href="AdminLogin.jsp">Return to login page</a></p>
	</body>
</html>