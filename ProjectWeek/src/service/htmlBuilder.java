package service;

public class htmlBuilder {
	
	String header = "<meta name='viewport' content='width=device-width, initial-scale=1, user-scalable=no'>"
				+ "<link rel='stylesheet' type='text/css' href='./css/normalize.css'>"
				+ "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>"
				+ "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>"
				+ "<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>"
				+ "<link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,300' rel='stylesheet' type='text/css'>"
				+ "<link rel='stylesheet' href='./css/styles.css'>";
		
	String body = "<nav class='navbar navbar-inverse'>"
		 			+ "<div class='container-fluid'>"
			 			+ "<div class='navbar-header'>"
			 				+ "<a class='navbar-brand' href='#'><img src='./css/img/brand.png' alt='Logo' /></a>"
			 			+ "</div>"
			 			+ "<div>"
			 				+ "<ul class='nav navbar-nav'>"
				 				+ "<li><a href='search.jsp'>Search</a></li>"
				 				+ "<li><a href='Cart.jsp'>Basket</a></li>"
				 				+ "<li><a href='Order.jsp'>Checkout</a></li>"
				 				+ "<li>"
				 					+ "<form class='navbar-form navbar-left' role='search' action='ControllingServlet' method='post'>"
				 						+ "<div class='form-group'>"
				 							+ "<input type='hidden' name='page' value='2'>" 
				 							+ "<input type='hidden' name='searchType' value='name'>"
				 							+ "<input type='text' class='form-control' name='searchText' id='constSearch' placeholder='Search for an item'>"
				 							+ "<button type='submit' class='btn btn-success' id='constBtn'>Search</button>"
				 						+ "</div>"
				 						+ "<!-- /.form-group -->"
				 					+ "</form>"
				 					+ "<!-- /.navbar-form -->"
				 				+ "</li>"
			 				+ "</ul><!-- /.navbar-nav -->"
			 			+ "</div><!-- /div -->"
		 			+ "</div><!-- /.container-fluid -->"
		 		+ "</nav>";
	
	String adminBody = "<nav class='navbar navbar-inverse'>"
						  + "<div class='container-fluid'>"
						    + "<div class='navbar-header'>"
						      + "<a class='navbar-brand' href='#'>Admin Control Panel</a>"
						    + "</div>"
						    + "<div>"
						      + "<ul class='nav navbar-nav'>"
						        + "<li class='active'><a href='Overview.jsp'>Home</a></li>"
						        + "<li><a href='addItem.jsp'>Add Item</a></li>"
						        + "<li><a href='StockReport.jsp'>Stock Report</a></li>" 
						        + "<li><a href='AdminLogin.jsp'>Logout[admin]</a></li>" 
						      + "</ul>"
						    + "</div>"
						  + "</div>"
						+ "</nav>";

	public String getHeader() {
		return header;
	}

	public String getBody() {
		return body;
	}

	public String getAdminBody() {
		return adminBody;
	}

	public htmlBuilder() {
		super();
	}
		
	

}