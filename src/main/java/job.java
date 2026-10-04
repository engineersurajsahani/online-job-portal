

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
 * Servlet implementation class job
 */
@WebServlet("/job")
public class job extends HttpServlet {
	
	
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		 PrintWriter out = resp.getWriter();
			
			Database db = new Database();
			String result = db.Connectdb();
			out.println(result);
			
			
			String job_id = req.getParameter("job_id");
			String r_id = req.getParameter("r_id");
		
			
			String jobtitle = req.getParameter("jobtitle");
			String companyname = req.getParameter("companyname");
			String jobtype = req.getParameter("jobtype");
			String Position = req.getParameter("Position");
			String qualification = req.getParameter("qualification");
			String location = req.getParameter("location");
			String salary = req.getParameter("salary");
			String jobdiscription = req.getParameter("jobdiscription");
			String image = req.getParameter("companylogo");
			String requirement = req.getParameter("requirement");
			
		
			
			String event = req.getParameter("submit");
			
			out.println(r_id);
	
			out.println(jobtitle);
			out.println(companyname);
			out.println(jobtype);
			out.println(Position);
			out.println(qualification);
			out.println(location);
			out.println(salary);
			out.println(jobdiscription);
			out.println(image);
			out.println(requirement);
			out.println(event);
			
			if(event.equals("Applay Now"))
			{
				
				session.setAttribute("r_id", r_id);
				session.setAttribute("image", image);
				
				session.setAttribute("jobtype", jobtype);
				session.setAttribute("jobtitle", jobtitle);
				session.setAttribute("companyname", companyname);
				session.setAttribute("job_id", job_id);
				session.setAttribute("location", location);
				session.setAttribute("salary", salary);
				
				resp.sendRedirect("e_apply_job.jsp");
			}
		
	}

}
