<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="5;url='StockReport.jsp'" />
<title>Insert title here</title>
<jsp:useBean id="beanUse" class = "model.StockReportBean" scope = "page"/>
    <%@ page import = "service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
</head>
<body>
<%= hb.getAdminBody() %>
<body>
		<h1>Updating Quantity!</h1>
		<%String id = (String) request.getSession().getAttribute("updateID");
		  String newTotal = (String) request.getSession().getAttribute("updateTotal");
		  beanUse.updateItemTotal(id, newTotal); %>
		<jsp:forward page="StockReport.jsp"></jsp:forward>
</body>
</html>