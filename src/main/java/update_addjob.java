

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
 * Servlet implementation class update_addjob
 */
@WebServlet("/update_addjob")
public class update_addjob extends HttpServlet {
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
		String Category = req.getParameter("Category");
		String jobtitle = req.getParameter("jobtitle");
		String companyname = req.getParameter("companyname");
		String location = req.getParameter("location");
		String salary = req.getParameter("salary");
		String jobtype = req.getParameter("jobtype");
		String Position = req.getParameter("Position");
		String qualification = req.getParameter("qualification");
		String jobdiscription = req.getParameter("jobdiscription");
		String image = req.getParameter("image");
		String requirement = req.getParameter("requirement");
		String event = req.getParameter("submit");
		
		
		out.println(Category);
		out.println(jobtitle);
		out.println(companyname);
		out.println(location);
		out.println(salary);
		out.println(jobtype);
		out.println(Position);
		out.println(qualification);
		out.println(jobdiscription);
		out.println(image);
		out.println(requirement);
		out.println(event);
		
		
		
		if(event.equals("update Job"))
		{
			try
			{
				String update = db.update("update r_add_job set category='"+Category+"',jobtitle='"+jobtitle+"', companyname='"+companyname+"', location='"+location+"', salary='"+salary+"', job_discription='"+jobdiscription+"', companylogo='"+image+"', requirement='"+requirement+"' where job_id='"+job_id+"'");
				 out.println(update);
				
			 resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert(' Succsessfully'); ");
				 out.print("location='r_joblist.jsp'; ");
				 out.print("</script>");
				 
			}catch(Exception ex)
			{
				out.println(ex.toString());
			}
		}
	}



}
