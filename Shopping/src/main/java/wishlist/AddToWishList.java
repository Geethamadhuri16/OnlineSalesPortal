package wishlist;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddToWishList
 */

public class AddToWishList extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getSession().getAttribute("uid").toString();
		String pid=request.getParameter("product_id").toString();
		WishlistDao w=new WishlistDao();
		w.AddTOWishlist(uid, pid);
		PrintWriter out = response.getWriter();
    	out.println("Added To wishlist");
	}

}
