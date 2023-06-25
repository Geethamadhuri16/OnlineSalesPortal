package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class verify extends HttpServlet {


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail=request.getParameter("E-mail");
		String password=request.getParameter("password");
		UserDao u=new UserDao();
		User user=u.login(mail, password);
		String pass=user.getPassword();
		String uid=user.getUserid();
		PrintWriter out=response.getWriter();
		String uname=user.getName();

		if(password.equals(pass)) {

			request.getSession().setAttribute("uid",uid );
			request.getSession().setAttribute("uname", uname);
			request.getSession().removeAttribute("adminLogged");

			response.sendRedirect("home.jsp");

		}else {	
			String dis="wrong password or e-mail!";
			/*
			 * out.println("<html> <body>"); 
			 * 
			 * out.println("<script> alert("+dis+");");
			 * out.println("</script> </body> </html>");
			 */

			response.sendRedirect("login.jsp?msg="+dis);

		}







	}


}
