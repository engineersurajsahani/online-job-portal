

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
 * Servlet implementation class edite
 */
@WebServlet("/edite")
public class edite extends HttpServlet {
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		
		 PrintWriter out = resp.getWriter();
			
			Database db = new Database();
			String result = db.Connectdb();
			out.println(result);
			
			String photo = req.getParameter("image");
			String fullname = req.getParameter("fullname");
			String username = req.getParameter("username");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String event = req.getParameter("submit");
			
			out.println(photo);
			out.println(fullname);
			out.println(username);
			out.println(email);
			out.println(phone);
			out.println(event);
			
			if(event.equals("Update"))
			{
				try 
				{
					String update = db.update("update e_signup set  fullname='"+fullname+"', username='"+username+"', email='"+email+"',  phone_no='"+phone+"',  photo='"+photo+"' where id='"+session.getAttribute("user_id")+"'");
				out.println(update);
				
				resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert(' Succsessfully'); ");
				 out.print("location='e_profile.jsp'; ");
				 out.print("</script>");
				
				}catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		
	}

}
