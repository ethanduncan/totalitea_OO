<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:useBean id="beanUse" class = "model.StarRatingBean" scope = "page"/>
</head>
<body>

	<%String id = (String) request.getSession().getAttribute("updateSID");
	  String newTotal = (String) request.getSession().getAttribute("updateTotalRatings");;
	  beanUse.updateStarSystem(id, newTotal); %>
	  <jsp:forward page="search.jsp"></jsp:forward>

</body>
</html>
