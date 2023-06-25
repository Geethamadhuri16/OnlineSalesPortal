package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserDao;

/**
 * Servlet implementation class averify
 */

public class averify extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail=request.getParameter("E-mail");
		String password=request.getParameter("password");
		AdminDao a=new AdminDao();
		Admin admin=a.login(mail, password);
		String pass=admin.getAdminPassword();
		String aid=admin.getAdminId();
		PrintWriter out=response.getWriter();
		String aname=admin.getAdminName();

		if(password.equals(pass)) {

			request.getSession().setAttribute("aid",aid );
			request.getSession().setAttribute("uname", aname);
			request.getSession().setAttribute("adminLogged", "true");

			response.sendRedirect("adminPortal.jsp");

		}else {	
			String dis="wrong password or e-mail!";
			/*
			 * out.println("<html> <body>"); 
			 * 
			 * out.println("<script> alert("+dis+");");
			 * out.println("</script> </body> </html>");
			 */

			response.sendRedirect("alogin.jsp?msg="+dis);

		}




		
	}

	

}
