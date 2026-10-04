

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
 * Servlet implementation class e_feedback
 */
@WebServlet("/e_feedback")
public class e_feedback extends HttpServlet {
	
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
			String email = req.getParameter("email");
			String rating = req.getParameter("rating");
			String feedback = req.getParameter("feedback");
			String event = req.getParameter("submit");
			
			out.println(name);
			out.println(email);
			out.println(rating);
			out.println(feedback);
			out.println(event);
		
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			String c_date = formatter.format(date);
			
			if(event.equals("submit"))
			{
				try
				{
					 String insert = db.Insert("insert into e_feedback(name, email, rating,feedback,date)values('"+name+"','"+email+"','"+rating+"','"+feedback+"','"+c_date+"')");
					 out.println(insert);
			
					 resp.setContentType("text/html");
					 out.print("<script type='text/javascript'>");
					 out.print("alert('Feedback Succsessfully'); ");
					 out.print("location='e_homepage.jsp'; ");
					 out.print("</script>");
				 
				}catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
	}

}
