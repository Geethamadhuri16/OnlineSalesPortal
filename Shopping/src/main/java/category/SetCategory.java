package category;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SetCategory
 */

public class SetCategory extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao c=new CategoryDao();
		String cate_Name=request.getParameter("name");
		String desc=request.getParameter("desc");
		c.setCategory(cate_Name, desc);
		PrintWriter out=response.getWriter();
		
		
//		  out.println("<html> <body>"); 
//		  
//		  out.println("<script> alert("+"Insertion is successful"+");");
//		  out.println("</script> </body> </html>");
		request.getSession().setAttribute("successfull", "true");
		response.sendRedirect("setCategory.jsp");
		 
	    
		
	}
	

	

}
