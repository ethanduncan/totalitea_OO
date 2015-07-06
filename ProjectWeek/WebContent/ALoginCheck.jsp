<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<!--  gary -->
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<jsp:useBean id="bean2" class="model.ACPLoginBean" scope="session"/>
	</head>
	<body>
		<form form action="ControllingServlet" method="GET">
		<%
	        String aLogin=(String)request.getSession().getAttribute("aLogin"); //Gets the username from AdminLogin in the aLogin Form
	        String aPass=(String)request.getSession().getAttribute("aPass"); //Gets the password from AdminLogin in the aPass Form
	       
	        if(bean2.LOGIN(aLogin, aPass))
	            {
	        	
	            response.sendRedirect("Overview.jsp"); //If username and password correct goto this page
	         	
	        }else{
	        	
	            response.sendRedirect("AdminError.jsp"); //If username and password incorrect goto this page
	            
	        }
	        
	       %>
        </form>
	</body>
</html>