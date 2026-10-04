

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
 * Servlet implementation class e_apply_job
 */
@WebServlet("/e_apply_job")
public class e_apply_job extends HttpServlet {
	
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		
		 PrintWriter out = resp.getWriter();
			
			Database db = new Database();
			String result = db.Connectdb();
			out.println(result);
		
		String name = req.getParameter("name");
		String mobile = req.getParameter("mobile");
		String email = req.getParameter("email");
		String jobtitle = req.getParameter("jobtitle");
		String company = req.getParameter("company");
		String resume = req.getParameter("resume");
		String event = req.getParameter("submit");
		
		out.println(name);
		out.println(mobile);
		out.println(email);
		out.println(jobtitle);
		out.println(company);
		out.println(resume);
		out.println(event);
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String c_date = formatter.format(date);
		
		if(event.equals("Apply Now"))
		{
			try
			{
				 String insert = db.Insert("insert into e_apply_job(job_id, job_title, job_type, company, location, salary, image, applay_date, user_id, name, mobilenumber, email, resume, status,r_id)values('"+session.getAttribute("job_id")+"','"+session.getAttribute("jobtitle")+"','"+session.getAttribute("jobtype")+"','"+session.getAttribute("companyname")+"','"+session.getAttribute("location")+"','"+session.getAttribute("salary")+"','"+session.getAttribute("image")+"','"+c_date+"','"+session.getAttribute("user_id")+"','"+name+"','"+mobile+"','"+email+"','"+resume+"','Pending','"+session.getAttribute("r_id")+"')");
				 out.println(insert);
				 
				 resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert('apply job Succsessfully'); ");
				 out.print("location='e_apply_joblist.jsp'; ");
				 out.print("</script>");
				
			}catch(Exception ex)
			{
				out.println(ex.toString());
			}
		}
		
	}

}
