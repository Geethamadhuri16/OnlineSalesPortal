package product;

import java.io.IOException;
import admin.AdminDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addProduct
 */

public class addProduct extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDao a=new AdminDao();
		String cname=request.getParameter("cname");
		String pname=request.getParameter("name");
		String pdesc=request.getParameter("desc");
		String price=request.getParameter("price");
		String inventory=request.getParameter("inventory");
		String img=request.getParameter("img");
		a.add(cname, pname, pdesc, price, inventory, img);
		String disc="successful";
		response.sendRedirect("addProduct.jsp?msg="+disc);
		
	}

	

}
