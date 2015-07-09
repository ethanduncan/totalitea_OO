<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body background="http://midwestteafest.com/wp-content/uploads/2015/02/tea1.jpg">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>TotaliTEA - Admin Login</title>
    <%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
</head>
<body>
<!--  Login -->

</br>
<div class="panel panel-danger">
    <div class="panel-heading">
        <h1 class="panel-title">TotaliTEA - ACP</h1>
      </div>
     <div class="panel-body">
	<div class="container">
        <h3>Please log in using the form below</h3>
        <form form action="ControllingServlet" method="GET">
            <input type="hidden" name="page" value="4"/>
            <label for="aLogin">Username: </label>
            <input type="text" placeholder="Username" name="aLogin" class="form-control"/> <br />
            <label for="aPass">Password: </label>
            <input type="password" placeholder="Password" name="aPass" class="form-control"/> <br /><br />
            <button type="reset" class="btn btn-danger">Clear</button>
            <button type="submit" class="btn btn-success">Submit</button>
        </form>
	</div>
	</div>
	</div>
</body>
</html>