

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
 * Servlet implementation class r_joblist
 */
@WebServlet("/r_joblist")
public class r_joblist extends HttpServlet {
	
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
		String event = req.getParameter("submit");
		
		
		out.println(job_id);
		out.println(event);
		
		
		
		if(event.equals("Delete"))
		{
		   try 
		   {
			   String delete = db.delete("delete from r_add_job where job_id='"+job_id+"'");
			   
			   resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert(' Deleted Succsessfully'); ");
				 out.print("location='r_joblist.jsp'; ");
				 out.print("</script>");
			   
		   }catch(Exception ex)
		   {
			   out.print(ex.toString());
		   }
		}
		
		
		if(event.equals("Update"))
		{
			
			session.setAttribute("job_id", job_id);
			resp.sendRedirect("update_addjob.jsp");
			
		}
		
		
	}

}
