package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateUserBean implements Serializable {

	public void createUser(String addressLine1Reg, String addressLine2Reg, String addressLine3Reg, String birthDateReg, String emailAddressReg, String firstNameReg, String lastNameReg, String passwordReg, String postcodeReg, String usernameReg) {

		String idReg = "";
		String goldMemberReg = "0";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/totalitea", "root", "teatime"); // connects
																					// to
																					// local
																					// server
			Statement stat = con.createStatement();
			
			ResultSet res1 = stat.executeQuery("select max(id) as highest from customer;");
			
			if (res1.next()) {
				
				int temporary = res1.getInt("highest") + 1;
				idReg += temporary;
				
			}
			
			int res = stat.executeUpdate("insert into customer (id, addressLine1, addressLine2, addressLine3, birthDate, emailAddress, firstName, goldMember, lastName, password, postcode, username) values ('"
							+ idReg
							+ "', '"
							+ addressLine1Reg
							+ "', '"
							+ addressLine2Reg
							+ "', '"
							+ addressLine3Reg
							+ "', '"
							+ birthDateReg
							+ "', '"
							+ emailAddressReg
							+ "', '"
							+ firstNameReg
							+ "', 0 , '"
							+ lastNameReg
							+ "', '"
							+ passwordReg
							+ "', '"
							+ postcodeReg
							+ "', '" + usernameReg + "');"); // queries category
															// column for
															// anything matching
															// the search text

		} catch (SQLException exception) {
			System.out.println(exception.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} // catches exceptions

		System.out.println(idReg + " " + addressLine1Reg + " " + addressLine2Reg + " " + addressLine3Reg + " " + birthDateReg + " " + emailAddressReg + " " + firstNameReg + " " + lastNameReg + " " + passwordReg + " " + usernameReg);
		
	}
}
