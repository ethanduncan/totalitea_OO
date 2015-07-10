package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import service.DatabaseAlterationService;

public class StarRatingBean {

public void updateStarSystem(String updateSID, String updateTotalRatings ) {
	
		DatabaseAlterationService das = new DatabaseAlterationService();
			
		das.updateDatabase("item", "total_ratings", "total_ratings + " + updateTotalRatings, "id", updateSID);
		das.updateDatabase("item", "ratings_count", "ratings_count + 1", "id", updateSID);
		das.updateDatabase("item", "average_ratings", "total_ratings / ratings_count", "id", updateSID);
				
	}
}
