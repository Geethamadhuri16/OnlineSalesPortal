package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Cart.CartDao;

/**
 * Servlet implementation class RemoveFromCart
 */

public class RemoveFromCart extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getSession().getAttribute("uid").toString();
		CartDao c=new CartDao();
		String pid=request.getParameter("product_id");
		c.remove(pid, uid);
		PrintWriter out = response.getWriter();
    	out.println("Removed From Cart");

	}

}
