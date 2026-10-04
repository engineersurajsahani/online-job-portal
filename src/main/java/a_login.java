

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
 * Servlet implementation class a_login
 */
@WebServlet("/a_login")
public class a_login extends HttpServlet {
	
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
		String password = req.getParameter("password");
		String event = req.getParameter("submit");
		
		out.println(username);
		out.println(password);
		out.println(event);
		
		if(event.equals("Login"))
		{
			// Admin credentials: same defaults as before, overridable via env (Render)
		String adminUser = System.getenv().getOrDefault("ADMIN_USERNAME", "Omkar");
		String adminPass = System.getenv().getOrDefault("ADMIN_PASSWORD", "82081");
		if(adminUser.equals(username) && adminPass.equals(password))
			{
				resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert('Login Succsessfully'); ");
				 out.print("location='a_homepage.jsp'; ");
				 out.print("</script>");
			}
			else
			{
				resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert('Login Unsuccsessfully'); ");
				 out.print("location='a_login.jsp'; ");
				 out.print("</script>");
			}
		}
		
	}

}
