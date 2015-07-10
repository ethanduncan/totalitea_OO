<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ page import="service.htmlBuilder" %>
		<% htmlBuilder hb = new htmlBuilder(); %>
		<%= hb.getHeader() %>
		<title>Basket</title>
		
		<jsp:useBean id="bean" class="model.BasketBean" scope="page"/>
		
	</head>
	<body class="content">
	
		<%= hb.getBody() %>

    <div class="container">
        <h1 align="center"><br />This is the content of your basket<br /><br /></h1>
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>Item ID</th>
    				<th>Item name</th> <!-- Creates table and a row for column titles -->
    				<th>Item price</th>
    				<th>Stock</th>
                </tr>
            </thead>
            <tbody>
                <tr>
					<%= bean.displayCart(request) %> <!--  loop through the basket list and show all the items -->
				</tr>
				<tr>
					<th colspan="3"><p align="right">Total price</p></th>
					<td>£<%= bean.displayTotal() %></td>
				</tr>		
            </tbody>
        </table><!-- /.table -->
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4">
                <br /><br />
                <form action="Order.jsp" method="post" style="background-color: rgba(0,0,0,0); display: inline-block; position: absolute; top: 20%;">
                	 <a href="./search.jsp">
	                	<button class="btn btn-default" type="submit" style="margin-right: 0px; ">Continue shopping</button>
	                </a>
                	<button class="btn btn-success" id="checkout" type="submit" style="margin-right: 0px;">Confirm and buy</button>
                </form>
            </div><!-- /.col-lg-4 -->
        </div>
    </div> <!-- /.container -->