package user;

import java.io.IOException;
import java.io.PrintWriter;

import Cart.CartDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addTocart
 */

public class addTocart extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getSession().getAttribute("uid").toString();
		CartDao c=new CartDao();
		String pid=request.getParameter("product_id");
		
		c.addTocart(pid, uid);
        PrintWriter out = response.getWriter();
//        out.println("okay");
        	out.println("Added To Cart");
  /*      out.println("<html> <body>"); 
		  
		  out.println("<script> alert("+"added to cart"+");");
		  out.println("</script> </body> </html>");*/
       

       
		
	}

	
	
}
