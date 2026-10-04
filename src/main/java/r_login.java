

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class r_login
 */
@WebServlet("/r_login")
public class r_login extends HttpServlet {
	
	
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
				try
				{
					Statement st =null;
cn = util.DB.get();
					   st = cn.createStatement();
					String sql = "select * from r_signup where email='"+username+"' AND password='"+password+"'" ;  
					   
					   ResultSet rs = st.executeQuery(sql);
					   if(rs.next())
					   {
						   
						   session.setAttribute("r_id", rs.getString("r_id"));
						   resp.setContentType("text/html");
							 out.print("<script type='text/javascript'>");
							 out.print("alert('Login Succsessfully'); ");
							 out.print("location='r_homepage.jsp'; ");
							 out.print("</script>");
					   }
					   else
					   {
						   resp.setContentType("text/html");
							 out.print("<script type='text/javascript'>");
							 out.print("alert('Login Unsuccsessfully'); ");
							 out.print("location='r_login.jsp'; ");
							 out.print("</script>");
					   }
					  
				}catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
			
		}

}
