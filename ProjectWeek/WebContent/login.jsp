<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>TotaliTEA - Login</title>
    <%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
	<%= hb.getHeader() %>   
    <link rel="stylesheet" type="text/css" href="./css/forValidating.css">
</head>
<body class="landing">

	<div class="container">
		<div class="large box">
	        <form form action="ControllingServlet" method="GET" id="form-login">
	        	<h2 align="center">Please log in to browse our collection</h3>
	            <input type="hidden" name="page" value="1"/>
	            <input type="text" placeholder="Your username" name="uName" class="form-control" id="login-username"/> <br />
	            <input type="password" placeholder="Your password" name="password" class="form-control" id="login-password"/> <br /><br />
	            <button type="submit" class="base-button">Log in</button>
	            <br /><br />
	            <h2 align="center" class="holder">Don't have an account?  <a href="register.jsp">Register here!</a></h3>
	        </form>
        </div>
        
        <a href="AdminLogin.jsp" id="adminPortal"><button class="btn btn-default">Admin portal</button></a>
        
	</div>
	<script src="./js/jquery.js" type="text/javascript"></script>
	<script src="./js/jquery.form.js" type="text/javascript"></script>
</body>
</html>
