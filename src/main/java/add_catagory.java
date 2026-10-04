

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
 * Servlet implementation class add_catagory
 */
@WebServlet("/add_catagory")
public class add_catagory extends HttpServlet {
	
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		
		PrintWriter out = resp.getWriter();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		
		String categoryName = req.getParameter("categoryName");
		String categoryInfo = req.getParameter("categoryInfo");
		String categoryImage = req.getParameter("categoryImage");
		String event = req.getParameter("submit");
		
		
		out.println(categoryName);
		out.println(categoryInfo);
		out.println(categoryImage);
		out.println(event);
		
		
		
		if(event.equals("Add Category"))
		{
			try
			{
				 String insert = db.Insert("insert into add_catagory( categoryName, categoryInfo, categoryImage)values('"+categoryName+"','"+categoryInfo+"','"+categoryImage+"')");
				 out.println(insert);
				
				 resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert(' Succsessfully'); ");
				 out.print("location='r_catagory_list.jsp'; ");
				 out.print("</script>");
				 
			}catch(Exception ex)
			{
				out.println(ex.toString());
			}
		}
	}

}
