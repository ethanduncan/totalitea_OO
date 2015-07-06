package model;

import static org.junit.Assert.*;

import org.junit.Test;

public class LoginTest {

	@Test
	public void testCheckUsernameAndPassword() {
		
		LoginBean lb = new LoginBean();
		
		boolean expected = true;
		
		boolean actual = lb.checkUsernameAndPassword("dcam", "password");
		
		assertEquals(expected,actual);
		
	}
	
//	@Test
//	public void testCheckGoldMember() {
//		
//		LoginBean lb = new LoginBean();
//		
//		boolean expected = true;
//		
//		boolean actual = lb.isCustomerGoldMember("dcam", "password");
//		
//		assertEquals(expected,actual);
//		
//	}
	
}
