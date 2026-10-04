

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
 * Servlet implementation class r_edit_profile
 */
@WebServlet("/r_edit_profile")
public class r_edit_profile extends HttpServlet {
	
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		
		 PrintWriter out = resp.getWriter();
			
			Database db = new Database();
			String result = db.Connectdb();
			out.println(result);
			
			String photo = req.getParameter("photo");
			String fullname = req.getParameter("fullname");
			String email = req.getParameter("email");
			String companyname = req.getParameter("companyname");
			String address = req.getParameter("address");
			String phone_no = req.getParameter("phone_no");
			String event = req.getParameter("submit");
			
			out.println(photo);
			out.println(fullname);
			out.println(email);
			out.println(companyname);
			out.println(address);
			out.println(phone_no);
			out.println(event);
			
			if(event.equals("Update"))
			{
				try 
				{
					String update = db.update("update r_signup set  fullname='"+fullname+"', companyname='"+companyname+"', email='"+email+"',  phone_no='"+phone_no+"', address='"+address+"', photo='"+photo+"' where r_id='"+session.getAttribute("r_id")+"'");
				out.println(update);
				
				resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert(' Succsessfully'); ");
				 out.print("location='r_profile.jsp'; ");
				 out.print("</script>");
				
				}catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		
	}

}
