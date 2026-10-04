

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
 * Servlet implementation class r_signup
 */
@WebServlet("/r_signup")
public class r_signup extends HttpServlet {
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		
        PrintWriter out = resp.getWriter();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		String fullname = req.getParameter("fullname");
		String companyname = req.getParameter("companyname");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String phone = req.getParameter("phone");
		String password = req.getParameter("password");
		String cpassword = req.getParameter("cpassword");
		String event = req.getParameter("submit");
		
		out.println(fullname);
		out.println(companyname);
		out.println(email);
		out.println(gender);
		out.println(phone);
		out.println(password);
		out.println(cpassword);
		out.println(event);
		
		if(event.equals("SUBMIT"))
		{
			try
			{
				 String insert = db.Insert("insert into r_signup(fullname, companyname, email, gender, phone_no, password)values('"+fullname+"','"+companyname+"','"+email+"','"+gender+"','"+phone+"','"+password+"') ");
				 out.println(insert);
				
				 
				 resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert(' registretion Succsessfully'); ");
				 out.print("location='r_login.jsp'; ");
				 out.print("</script>");
				 
			}catch(Exception ex)
			{
				out.println(ex.toString());
			}
		}
		
	}

}
