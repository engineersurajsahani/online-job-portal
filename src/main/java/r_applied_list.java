

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
 * Servlet implementation class r_applied_list
 */
@WebServlet("/r_applied_list")
public class r_applied_list extends HttpServlet {
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		PrintWriter out = resp.getWriter();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		String a_id = req.getParameter("a_id");
		String job_title = req.getParameter("job_title");
		String name = req.getParameter("name");
		String event = req.getParameter("submit");
		String email = req.getParameter("email");
		
		out.println(a_id);
		out.println(job_title);
		out.println(name);
		out.println(email);
		
		out.println(event);
		
		if(event.equals("Accept"))
		{
			session.setAttribute("a_id", a_id);
			session.setAttribute("job_title", job_title);
			session.setAttribute("name", name);
			session.setAttribute("email", email);
			
			resp.sendRedirect("r_interview_schedule.jsp");
		}
		
		if(event.equals("Accept"))
		{
			try
			{
				
				String update = db.update("update e_apply_job set status='Accept' where a_id='"+a_id+"'");
				out.println(update);
				
				 session.setAttribute("email", email);
				 resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert('Accepted Succsessfully'); ");
				 out.print("location='r_applied_list.jsp'; ");
				 out.print("</script>");
				
			}catch(Exception ex)
			{
				out.println(ex.toString());
			}
		}
		
		
		if(event.equals("Reject"))
		{
			try
			{
				
				String update = db.update("update e_apply_job set status='Reject' where a_id='"+a_id+"'");
				out.println(update);
				
				resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert('Rejected Succsessfully'); ");
				 out.print("location='r_applied_list.jsp'; ");
				 out.print("</script>");
				
			}catch(Exception ex)
			{
				out.println(ex.toString());
			}
		}
		
	}

}