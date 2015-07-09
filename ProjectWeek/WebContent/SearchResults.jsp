<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>TotaliTEA - Results</title>
    <%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>

	<jsp:useBean id="beanUse" class = "model.SearchBean" scope = "page"/>

</head>

<body class="content">

	<%= hb.getBody() %>

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
