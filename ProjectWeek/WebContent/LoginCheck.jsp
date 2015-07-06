<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<jsp:useBean id="bean" class="model.LoginBean" scope="page"/>
		<%@ page import="dto.Customer" %>
		<!-- This jsp is used to set the username and password attributes
			 It then checks the database using the LoginBean and either
			 allows the user to go to the search.jsp or an error page if
			 incorrect. -->
	</head>
	<body>
		<form form action="ControllingServlet" method="GET">
		<%
	        String username=(String)request.getSession().getAttribute("uName");
	        String password=(String)request.getSession().getAttribute("password");
	       
	        if(bean.checkUsernameAndPassword(username, password))
	            {
	        	
	        	request.getSession().setAttribute("customer",bean.createCustomerOnLogin(username, password));
	            response.sendRedirect("search.jsp");
	         	
	        }else{
	        	
	            response.sendRedirect("Error.jsp");
	            
	        }
	       %>
        </form>
	</body>
</html>