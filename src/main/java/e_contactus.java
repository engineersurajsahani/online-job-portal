

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
 * Servlet implementation class e_contactus
 */
@WebServlet("/e_contactus")
public class e_contactus extends HttpServlet {
	
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		
		 PrintWriter out = resp.getWriter();
			
			Database db = new Database();
			String result = db.Connectdb();
			out.println(result);
			
			String username = req.getParameter("username");
			String contact = req.getParameter("contact");
			String email = req.getParameter("email");
			String Message = req.getParameter("Message");
			String event = req.getParameter("submit");
			
			out.println(username);
			out.println(contact);
			out.println(email);
			out.println(Message);
			out.println(event);

			if(event.equals("SUBMIT"))
			{
				try
				{
					 String insert = db.Insert("insert into e_contactus(name,contactnumber,email,message)values('"+username+"','"+contact+"','"+email+"','"+Message+"')");
					 out.println(insert);
					 
					 resp.setContentType("text/html");
					 out.print("<script type='text/javascript'>");
					 out.print("alert(' Succsessfully'); ");
					 out.print("location='index.jsp'; ");
					 out.print("</script>");
					 
					
				}catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		
	}

}
