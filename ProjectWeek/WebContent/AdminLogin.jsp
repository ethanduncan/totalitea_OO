<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body background="http://midwestteafest.com/wp-content/uploads/2015/02/tea1.jpg">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>TotaliTEA - Admin Login</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./styles.css">
</head>
<body>
<!--  Login -->
</br>
<center><img src="logo.png" alt="Smiley face" height="200" width="400"></center>

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