<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>TotaliTEA - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="./css/normalize.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="http://fonts.googleapis.com/css?family=Fira+Sans:400,300" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="./css/styles.css">
</head>
<body class="landing">

	<div class="container">
		<br /><br />
        <form form action="ControllingServlet" method="GET" align="center">
        	<h3 align="center">Please log in to browse our collection</h3>
            <input type="hidden" name="page" value="1"/>
            <input type="text" placeholder="Your username" name="uName" class="form-control" id="search"/> <br />
            <input type="password" placeholder="Your password" name="password" class="form-control" id="search"/> <br /><br />
            <button type="submit" class="btn btn-success" style="font-size: 16pt; font-weight: 400; padding-left: 20px; padding-right: 20px;">Log in</button>
            <br /><br />
            <h3 align="center">Don't have an account?  <a href="register.jsp">Register here!</a></h3>
        </form>
        
        <a href="AdminLogin.jsp" id="adminPortal"><button class="btn btn-default">Admin portal</button></a>
        
	</div>
</body>
</html>
