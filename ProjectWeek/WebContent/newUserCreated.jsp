<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>		
	    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	    <link rel="stylesheet" href="./css/normalize.css" type="text/css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	    <link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,300' rel='stylesheet' type='text/css'>
	    <link rel="stylesheet" href="./css/styles.css" type="text/css">
		<title>TotaliTEA - Registered</title>
		
		<jsp:useBean id="beanUse" class = "model.CreateUserBean" scope = "page"/>
	
	</head>
	
	<body class="content">
	
		<nav class="navbar navbar-inverse">
	        <div class="container-fluid">
	            <div class="navbar-header">
	                <a class="navbar-brand" href="#"><img src="./css/img/brand.png" alt="Logo" /></a>
	            </div>
	            <div>
	                <ul class="nav navbar-nav">
	                    <li><a href="login.jsp">You can't navigate from this page.  Please log in again in order to access the site.</a></li>
	                </ul>
	            </div>
	        </div>
	    </nav>
	
		<div class="container">
	
			<%String usernameReg = (String) request.getSession().getAttribute("usernameReg"); %> <!-- retrieves the searchText and searchType variables from the session data -->
			<%String passwordReg = (String) request.getSession().getAttribute("passwordReg"); %>
			<%String firstNameReg = (String) request.getSession().getAttribute("firstNameReg"); %>
			<%String lastNameReg = (String) request.getSession().getAttribute("lastNameReg"); %>
			<%String birthDateReg = (String) request.getSession().getAttribute("birthDateReg"); %>
			<%String emailAddressReg = (String) request.getSession().getAttribute("emailAddressReg"); %>
			<%String addressLine1Reg = (String) request.getSession().getAttribute("addressLine1Reg"); %>
			<%String addressLine2Reg = (String) request.getSession().getAttribute("addressLine2Reg"); %>
			<%String addressLine3Reg = (String) request.getSession().getAttribute("addressLine3Reg"); %>
			<%String postcodeReg = (String) request.getSession().getAttribute("postcodeReg"); %>
			<% beanUse.createUser(addressLine1Reg, addressLine2Reg, addressLine3Reg, birthDateReg, emailAddressReg, firstNameReg, lastNameReg, passwordReg, postcodeReg, usernameReg); %>
			
			<h1 align="center">
				<br /><br />
				<i class="fa fa-check-circle-o fa-5x"></i><br /><br />
				<span style="font-size: 45pt">Success</span>
			</h1>
			<h3 align="center">Your account has been created successfully.  <br />Please go back and login using the form to access the site.</h3>
			<button class ="btn btn-default" style="position: absolute; left: 42.5%; top: 75%; font-size: 16pt; font-weight: 400;">Return to login page</button>
		
		</div>
	
	</body>

</html>