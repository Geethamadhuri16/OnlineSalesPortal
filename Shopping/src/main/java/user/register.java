package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */

public class register extends HttpServlet {
	
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao u=new UserDao();
		String mail=request.getParameter("E-mail");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("password");
		String address=request.getParameter("address");
		String mobile=request.getParameter("mobile");
		boolean bool=u.registration(uname, mobile, pass, address, mail);
		if(bool==true) {
			response.sendRedirect("home.jsp");
		}else {
			response.sendRedirect("signup.jsp");
		}
		
		
	}

	
	

}
