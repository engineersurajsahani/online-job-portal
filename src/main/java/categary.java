

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

/**
 * Servlet implementation class categary
 */
@WebServlet("/categary")
public class categary extends HttpServlet {
	
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		 PrintWriter out = resp.getWriter();
			
			Database db = new Database();
			String result = db.Connectdb();
			out.println(result);
			
			String categoryName = req.getParameter("categoryName");
		
			
			String event = req.getParameter("submit");
			
			out.println(categoryName);
			out.println(event);
			
			if(event.equals(" "))
			{
				session.setAttribute("categoryName", categoryName);
				resp.sendRedirect("job.jsp");
			}
		
	}

}
