package service;

public class htmlBuilder {
	
	public String headerCreator(){
		
		return "<meta name='viewport' content='width=device-width, initial-scale=1, user-scalable=no'>"
				+ "<link rel='stylesheet' type='text/css' href='./css/normalize.css'>"
				+ "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>"
				+ "<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>"
				+ "<link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,300' rel='stylesheet' type='text/css'>"
				+ "<link rel='stylesheet' href='./css/styles.css'>";
		
	}
	
	public String bodyCreator() {
		
		return "<nav class='navbar navbar-inverse'>"
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
		
	}

}