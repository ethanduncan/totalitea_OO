<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>TotaliTEA - StockReport</title>
    <%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
	<jsp:useBean id="beanUse" class = "model.StockReportBean" scope = "page"/>
	
	</head>
	<body>
<%= hb.getAdminBody() %>
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