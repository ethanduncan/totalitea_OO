<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	    <title>TotaliTEA - Login</title>
	    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="./styles.css">
	
	</head>
	
	<body>
	
		<div class="container">
		
			<h1>Register for a new account</h1>
	
			<form form action="ControllingServlet" method="GET">
	            <input type="hidden" name="page" value="3"/>
	            <label for="usernameReg">Username: </label>
	            <input type="text" placeholder="Username" name="usernameReg" class="form-control"/> <br />
	            <label for="passwordReg">Password: </label>
	            <input type="text" placeholder="Password" name="passwordReg" class="form-control"/> <br />
	            <label for="firstNameReg">First Name: </label>
	            <input type="text" placeholder="FirstName" name="firstNameReg" class="form-control"/> <br />
	            <label for="lastNameReg">Last Name: </label>
	            <input type="text" placeholder="LastName" name="lastNameReg" class="form-control"/> <br />
	            <label for="birthDateReg">Birth date (YYYY-MM-DD): </label>
	            <input type="text" placeholder="BirthDate" name="birthDateReg" class="form-control"/> <br />
	            <label for="emailAddressReg">Email Address: </label>
	            <input type="text" placeholder="EmailAddress" name="emailAddressReg" class="form-control"/> <br />
	            <label for="addressLine1Reg">Address Line 1: </label>
	            <input type="text" placeholder="AddressLine1" name="addressLine1Reg" class="form-control"/> <br />
	            <label for="addressLine2Reg">Address Line 2: </label>
	            <input type="text" placeholder="AddressLine2" name="addressLine2Reg" class="form-control"/> <br />
	            <label for="addressLine3Reg">Address Line 3: </label>
	            <input type="text" placeholder="AddressLine3" name="addressLine3Reg" class="form-control"/> <br />
	            <label for="postcodeReg">Postcode: </label>
	            <input type="text" placeholder="postcode" name="postcodeReg" class="form-control"/> <br />
	            <button type="reset" class="btn btn-danger">Clear</button>
	            <button type="submit" class="btn btn-success">Submit</button>
	        </form>
        
        </div>
	
	</body>
	
</html>