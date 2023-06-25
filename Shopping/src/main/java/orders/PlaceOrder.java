package orders;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Cart.CartDao;
import product.Product;
/**
 * Servlet implementation class PlaceOrder
 */

public class PlaceOrder extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getSession().getAttribute("uid").toString();
		OrderDao o=new OrderDao();
		CartDao c=new CartDao();
		ArrayList<Product> list=c.getCartItems(uid);
		String oid=o.generateOrderId();
		
		while(!list.isEmpty()) {
			Product p=list.remove(0);
			String PID=p.getProductid();
			o.placeOrder(oid, uid, PID);
		}
		String dis="order placed!";
		response.sendRedirect("DisplayCartItems.jsp?msg="+dis);
		
	}

	

}
