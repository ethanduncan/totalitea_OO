package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Customer;

public class ControllingServlet extends HttpServlet {

	/**
	 * 
	 * Controlling Servlet.
	 * 
	 */

	String searchText = "";
	String searchType = "";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doProcessing(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doProcessing(req, resp);
	}

	private void doProcessing(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		RequestDispatcher disp;
		String pageNum = req.getParameter("page");
		String button = req.getParameter("button1");
		final String username, password;
		String usernameReg, passwordReg, addressLine1Reg, addressLine2Reg, addressLine3Reg, birthDateReg, emailAddressReg, firstNameReg, lastNameReg, postcodeReg;
		String aLogin, aPass;
		String deliveryInstructions;
		String catAdd, descAdd, weightAdd, priceAdd, quantityAdd, updateID, updateTotal;
		String updateSID, updateTotalRatings;
		

		if (pageNum == null) {

			disp = req.getRequestDispatcher("login.jsp");
			disp.forward(req, resp);

		} else if (pageNum.equals("1")) {

			username = req.getParameter("uName");
			req.getSession().setAttribute("uName", username);
			password = req.getParameter("password");
			req.getSession().setAttribute("password", password);
			disp = req.getRequestDispatcher("LoginCheck.jsp");
			disp.forward(req, resp);
			
		} else if (pageNum.equals("2")) {

			searchText = req.getParameter("searchText");
			req.getSession().setAttribute("searchText", searchText);
			searchType = req.getParameter("searchType");
			req.getSession().setAttribute("searchType", searchType);
			disp = req.getRequestDispatcher("SearchResults.jsp");
			disp.forward(req, resp);

		} else if (pageNum.equals("3")) {

			usernameReg = req.getParameter("usernameReg");
			req.getSession().setAttribute("usernameReg", usernameReg);
			passwordReg = req.getParameter("passwordReg");
			req.getSession().setAttribute("passwordReg", passwordReg);
			addressLine1Reg = req.getParameter("addressLine1Reg");
			req.getSession().setAttribute("addressLine1Reg", addressLine1Reg);
			addressLine2Reg = req.getParameter("addressLine2Reg");
			req.getSession().setAttribute("addressLine2Reg", addressLine2Reg);
			addressLine3Reg = req.getParameter("addressLine3Reg");
			req.getSession().setAttribute("addressLine3Reg", addressLine3Reg);
			birthDateReg = req.getParameter("birthDateReg");
			req.getSession().setAttribute("birthDateReg", birthDateReg);
			emailAddressReg = req.getParameter("emailAddressReg");
			req.getSession().setAttribute("emailAddressReg", emailAddressReg);
			birthDateReg = req.getParameter("birthDateReg");
			req.getSession().setAttribute("birthDateReg", birthDateReg);
			firstNameReg = req.getParameter("firstNameReg");
			req.getSession().setAttribute("firstNameReg", firstNameReg);
			lastNameReg = req.getParameter("lastNameReg");
			req.getSession().setAttribute("lastNameReg", lastNameReg);
			postcodeReg = req.getParameter("postcodeReg");
			req.getSession().setAttribute("postcodeReg", postcodeReg);
			disp = req.getRequestDispatcher("newUserCreated.jsp");

			disp.forward(req, resp);

		} else if (pageNum.equals("4")) {
			
			aLogin = req.getParameter("aLogin");
			req.getSession().setAttribute("aLogin", aLogin);
			aPass = req.getParameter("aPass");
			req.getSession().setAttribute("aPass", aPass);
			disp = req.getRequestDispatcher("ALoginCheck.jsp");
			disp.forward(req, resp);
			
			
		} else if (pageNum.equals("5")) {

			catAdd = req.getParameter("catAdd");
			req.getSession().setAttribute("catAdd", catAdd);
			descAdd = req.getParameter("descAdd");
			req.getSession().setAttribute("descAdd", descAdd);
			weightAdd = req.getParameter("weightAdd");
			req.getSession().setAttribute("weightAdd", weightAdd);
			priceAdd = req.getParameter("priceAdd");
			req.getSession().setAttribute("priceAdd", priceAdd);
			quantityAdd = req.getParameter("quantityAdd");
			req.getSession().setAttribute("quantityAdd", quantityAdd);
			disp = req.getRequestDispatcher("newItemAdded.jsp");
			disp.forward(req, resp);

		} else if (pageNum.equals("6"))  {
			
			deliveryInstructions = req.getParameter("deliveryInstructions");
			req.getSession().setAttribute("deliveryInstructions", deliveryInstructions);
			disp = req.getRequestDispatcher("OrderConfirm.jsp");
			disp.forward(req, resp);	
			
		} else if (pageNum.equals("7")) {
		
			updateID = req.getParameter("updateID");
			req.getSession().setAttribute("updateID", updateID);
			updateTotal = req.getParameter("updateTotal");
			req.getSession().setAttribute("updateTotal", updateTotal);
			disp = req.getRequestDispatcher("StockUpdated.jsp");
			disp.forward(req, resp);
	
		} else if (pageNum.equals("8")) {
		
		updateSID = req.getParameter("starId");
		req.getSession().setAttribute("updateSID", updateSID);
		updateTotalRatings = req.getParameter("star");
		req.getSession().setAttribute("updateTotalRatings", updateTotalRatings);
		disp = req.getRequestDispatcher("Rated.jsp");
		disp.forward(req, resp);

		}

		
		if(button != null){
			
			if(req.getSession() != null)
				req.getSession().invalidate();
				req.getRequestDispatcher("login.jsp").forward(req,resp);
				return;
		}
	}
}
