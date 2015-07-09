<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>		
	    <%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
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