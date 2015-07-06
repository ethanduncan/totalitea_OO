<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>TotaliTEA - Results</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="./css/styles.css">

	<jsp:useBean id="beanUse" class = "model.SearchBean" scope = "page"/>

</head>

<body class="content">

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><img src="./css/img/brand.png"
					alt="Logo" /></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="search.jsp">Search</a></li>
					<li><a href="Cart.jsp">Basket</a></li>
					<li><a href="Order.jsp">Checkout</a></li>
					<li>
						<form class="navbar-form navbar-left" role="search"
							action="ControllingServlet" method="post">
							<div class="form-group">
								<input type="hidden" name="page" value="2"> <input
									type="hidden" name="searchType" value="name"> <input
									type="text" class="form-control" name="searchText"
									id="constSearch" placeholder="Search for an item">
								<button type="submit" class="btn btn-success" id="constBtn">Search</button>
							</div>
							<!-- /.form-group -->
						</form>
						<!-- /.navbar-form -->
					</li>
				</ul><!-- /.navbar-nav -->
			</div><!-- /div -->
		</div><!-- /.container-fluid -->
	</nav>

	<div class="container">
		<% String searchText = (String) request.getSession().getAttribute("searchText"); %> <!-- retrieves the searchText and searchType variables from the session data -->
		<% String searchType = (String) request.getSession().getAttribute("searchType"); %>
		<h1 align="center"><br />Here are your search results<br /><br /></h1>
        <table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>Item name</th>
					<th>Item category</th> <!-- Creates table and a row for table titles -->
					<th>Item price</th>
					<th>Stock</th>
					<th> </th>
					<th>Rate item</th>
					<th>Average rating</th>
				</tr>
			</thead>
			<tbody>
				<%=beanUse.getItems(searchText, searchType)  %> <!--  Populate the table with the search results -->
			</tbody>
		</table>
	</div>
</body>
</html>
