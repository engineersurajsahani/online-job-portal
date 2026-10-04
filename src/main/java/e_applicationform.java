

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
 * Servlet implementation class e_applicationform
 */
@WebServlet("/e_applicationform")
public class e_applicationform extends HttpServlet {
	
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
			String email = req.getParameter("email");
			String mobile = req.getParameter("mobile");
			String qualification = req.getParameter("qualification");
			String experience = req.getParameter("experience");
			String skills = req.getParameter("skills");
			String salary = req.getParameter("salary");
			String event = req.getParameter("submit");
			
			out.println(fullname);
			out.println(email);
			out.println(mobile);
			out.println(qualification);
			out.println(experience);
			out.println(skills);
			out.println(salary);
			out.println(event);
			
			
			if(event.equals("Apply"))
			{
				try
				{
					 String insert = db.Insert("insert into e_applicationform(fullname,email,mobilenumber,qualification,skills,expectedsalary)values('"+fullname+"','"+email+"','"+mobile+"','"+qualification+"','"+skills+"','"+salary+"')");
					 out.println(insert);
					
					 resp.setContentType("text/html");
					 out.print("<script type='text/javascript'>");
					 out.print("alert(' Succsessfully'); ");
					 out.print("location='r_joblist.jsp'; ");
					 out.print("</script>");
					 
				}catch(Exception ex)
				{
					out.println(ex.toString());
				}
			}
		
	}

}
