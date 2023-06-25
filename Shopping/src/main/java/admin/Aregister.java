package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDao;

/**
 * Servlet implementation class Aregister
 */

public class Aregister extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDao a=new AdminDao();
		String mail=request.getParameter("E-mail");
		String pass=request.getParameter("password");
		boolean bool=a.aregistration(mail, pass);
		
		
		if(bool==true) {
			response.sendRedirect("adminPortal.jsp");
		}else {
			response.sendRedirect("aSignup.jsp");
		}
		
		
	}

	
	

}
