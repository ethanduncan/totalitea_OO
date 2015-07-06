<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>TotaliTEA - Error</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="./css/normalize.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="./css/styles.css" type="text/css">
</head>
<body class="content">
	<nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><img src="./css/img/brand.png" alt="Logo" /></a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li><a href="login.jsp">You can't navigate from the error page.  Please log in again in order to access the site.</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container">
    	<h1 align="center">
    		<br /><br />
    		<i class="fa fa-exclamation-triangle fa-5x"></i><br />
    		<span style="font-size:48pt;">Oops</span>
    	</h1>
    	<h3 align="center">
    		Something went wrong while processing your request. <br />
    		Please try again, making sure your information is correct.
    	</h3>
    	<a href="login.jsp">
    		<button class="btn btn-info" style="margin-left: 37.5%; margin-right: auto; width: 25%; height: 50px; font-size: 16pt; font-weight: 400;">
    			Return to login screen
    		</button>
    	</a>
    </div><!-- /.container -->
</body>
</html>