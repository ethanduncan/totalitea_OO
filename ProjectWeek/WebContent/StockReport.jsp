<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>TotaliTEA - StockReport</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./styles.css">
	<jsp:useBean id="beanUse" class = "model.StockReportBean" scope = "page"/>
	
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
<div class="alert alert-danger" role="alert">
  <a href="#" class="alert-link">Please do not update the quantity BEFORE you have reordered!</a>
</div>
		<FORM action="ControllingServlet" METHOD="GET" name="6">
			<h1>All Stock</h1>
			<%String ID = (String)request.getSession().getAttribute("ID"); %>
				<table class="table">
				<thread>
				<tr>
					<th>Product ID</th>
					<th>Category</th>
					<th>Description</th>
					<th>Quantity</th>
					<th>Update total</th>
					<td></td>
					<th>Restock</th>
				</tr>
				</thread>
				<tbody>
				<%=beanUse.getItems()%>
				</tbody>
			</table>
		</FORM>
	</body>
</html>