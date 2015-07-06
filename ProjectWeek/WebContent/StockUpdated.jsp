<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="5;url='StockReport.jsp'" />
<title>Insert title here</title>
<jsp:useBean id="beanUse" class = "model.StockReportBean" scope = "page"/>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./styles.css">
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Admin Control Panel</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="Overview.jsp">Home</a></li>
        <li><a href="addItem.jsp">Add Item</a></li>
        <li><a href="StockReport.jsp">Stock Report</a></li> 
        <li><a href="AdminLogin.jsp">Logout[admin]</a></li> 
      </ul>
    </div>
  </div>
</nav>
<body>
		<h1>Updating Quantity!</h1>
		<%String id = (String) request.getSession().getAttribute("updateID");
		  String newTotal = (String) request.getSession().getAttribute("updateTotal");
		  beanUse.updateItemTotal(id, newTotal); %>
		<jsp:forward page="StockReport.jsp"></jsp:forward>
</body>
</html>