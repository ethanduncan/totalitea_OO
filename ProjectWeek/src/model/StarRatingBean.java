package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class StarRatingBean {

public void updateStarSystem(String updateSID, String updateTotalRatings ) {
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/totalitea",
														"root", "teatime"); //connects to local server
		Statement stat = con.createStatement();
		int res = stat.executeUpdate("UPDATE item set total_ratings = total_ratings + " + updateTotalRatings + " WHERE id = " + updateSID + ";");
		res = stat.executeUpdate("UPDATE item set ratings_count = ratings_count + 1 WHERE id = " + updateSID + ";");
		res = stat.executeUpdate("UPDATE item set average_ratings = total_ratings / ratings_count WHERE id = " + updateSID + ";");
				
		
		} 
		catch (SQLException exception){ System.out.println(exception.getMessage());}
		catch (ClassNotFoundException e){ e.printStackTrace(); }
	}
}
