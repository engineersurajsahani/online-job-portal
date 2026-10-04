

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
 * Servlet implementation class r_interview_schedule
 */
@WebServlet("/r_interview_schedule")
public class r_interview_schedule extends HttpServlet {
	
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		PrintWriter out = resp.getWriter();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		String interview_date = req.getParameter("interview_date");
		String interview_time = req.getParameter("interview_time");
		String interview_location = req.getParameter("interview_location");
		String event = req.getParameter("submit");
		
		String email = session.getAttribute("email").toString();
		
		out.println(interview_date);
		out.println(interview_time);
		out.println(interview_location);
		out.println(email);
		out.println(event); 
		
		
		if(event.equals("Schedule Interview"))
		{
			try
			{
				
				String update = db.update("update e_apply_job set status='Accept', interview_date='"+interview_date+"',interview_time='"+interview_time+"',interview_location='"+interview_location+"' where a_id='"+session.getAttribute("a_id")+"'");
			    out.println(update);
				
				
				 String insert = db.Insert("insert into interview_schedule(a_id, candudate_name, interview_time, interview_date, interview_location, status)values('"+session.getAttribute("a_id")+"','"+session.getAttribute("name")+"','"+interview_time+"','"+interview_date+"','"+interview_location+"','Pending') ");
				 out.println(insert);
				 
				 Send_Mail.sendPassword(email, interview_date, interview_time, interview_location);

				 out.println(result);
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
		
		
	}	



}
