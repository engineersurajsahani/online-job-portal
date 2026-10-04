

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
 * Servlet implementation class e_homepage
 */
@WebServlet("/e_homepage")
public class e_homepage extends HttpServlet {

	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		 PrintWriter out = resp.getWriter();
			
			Database db = new Database();
			String result = db.Connectdb();
			out.println(result);
			
			
			String job_name = req.getParameter("job_name");
			String location = req.getParameter("location");
		
			
			String event = req.getParameter("submit");
		
			
			if(event.equals("Search"))
			{
				
				session.setAttribute("job_name",job_name );
				session.setAttribute("location",location );
				
				resp.sendRedirect("e_homepage.jsp");
			}
		
	}

}