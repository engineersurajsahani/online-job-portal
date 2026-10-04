

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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class r_add_job
 */
@WebServlet("/r_add_job")
public class r_add_job extends HttpServlet {
	
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		
		PrintWriter out = resp.getWriter();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		String Category = req.getParameter("Category");
		String jobtitle = req.getParameter("jobtitle");
		String companyname = req.getParameter("companyname");
		String jobtype = req.getParameter("jobtype");
		String Position = req.getParameter("Position");
		String experience = req.getParameter("experience");
		String qualification = req.getParameter("qualification");
		String location = req.getParameter("location");
		String salary = req.getParameter("salary");
		String jobdiscription = req.getParameter("jobdiscription");
		String image = req.getParameter("image");
		String requirement = req.getParameter("requirement");
		String event = req.getParameter("submit");
		
		out.println(Category);
		out.println(jobtitle);
		out.println(companyname);
		out.println(jobtype);
		out.println(Position);
		out.println(experience);
		out.println(qualification);
		out.println(location);
		out.println(salary);
		out.println(jobdiscription);
		out.println(image);
		out.println(requirement);
		out.println(event);
		
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String c_date = formatter.format(date);
		
		if(event.equals("Add Job"))
		{
			try
			{
				 String insert = db.Insert("insert into r_add_job( category, jobtitle, companyname, JobType, position, Experience, Qualification, location, salary, job_discription, companylogo, requirement,job_upload_date,r_id)values('"+Category+"','"+jobtitle+"','"+companyname+"','"+jobtype+"','"+Position+"','"+experience+"','"+qualification+"','"+location+"','"+salary+"','"+jobdiscription+"','"+image+"','"+requirement+"','"+c_date+"','"+session.getAttribute("r_id")+"') ");
				 out.println(insert);
				 
				 resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert('add job Succsessfully'); ");
				 out.print("location='r_joblist.jsp'; ");
				 out.print("</script>");
				 
				 
				
			}catch(Exception ex)
			{
				out.println(ex.toString());
			}
		}
		
	}

}
