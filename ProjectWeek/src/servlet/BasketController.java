package servlet;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Basket;
import dto.Item;

public class BasketController extends HttpServlet {
	/*
	 * (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 * 
	 * This is the Controlling Servlet for the basket.
	 * 
	 * The servlet checks if there is a cart object in the session already and if not creates one.
	 * It then creates item objects and adds it to the basket. 
	 * 
	 * 
	 */
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException
    	{
			doProcessing(req,resp);
    	}
    
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException
    	{
			doProcessing(req,resp);
    	}
	
	//
	// This is the processing method that is called in the doGet and doPost overridden methods.
	// doProcessing is responsible for creating the basket, adding items and then dispatching to the
	// cart.jsp.
	//
	public void doProcessing(HttpServletRequest req, HttpServletResponse resp)
			 throws ServletException, IOException{
		
		RequestDispatcher disp;
    	
    	HttpSession session = req.getSession(true); 
    	Basket basket = (Basket) session.getAttribute("cart");
    	
    	if(basket == null){
    		
    		basket = new Basket();
    		session.setAttribute("cart", basket);
    		
    		}
    	
		basket.addItem(createItem(req));
		
		disp = req.getRequestDispatcher("Cart.jsp");
		disp.forward(req, resp);
		
		
	}
	//
	// This method creates item objects by gathering information from hidden fields in the search results jsp.
	//
    public Item createItem(HttpServletRequest req){
    	
    	Item item = new Item();
    	
    	String id = req.getParameter("basketID");
		req.setAttribute("basketID", id);
		Long idL = Long.parseLong(id, 10); 
		item.setId(idL);
		
		String weight = req.getParameter("basketWeight");
		req.setAttribute("basketWeight", weight);
		Double weightD = Double.parseDouble(weight);
		item.setItemWeight(weightD);
		
		String description = req.getParameter("basketDescription");
		req.setAttribute("basketDescription", description);
		item.setDescription(description);
		
		String price = req.getParameter("basketPrice");
		req.setAttribute("basketprice", price);
		BigDecimal priceBD = new BigDecimal(price);
		item.setPrice(priceBD);
		
		return item;
    	
    }
	
}
