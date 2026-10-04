

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
 * Servlet implementation class r_catagory_list
 */
@WebServlet("/r_catagory_list")
public class r_catagory_list extends HttpServlet {
	
	
	Connection cn= null;
	Statement st =null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		PrintWriter out = resp.getWriter();
		
		Database db = new Database();
		String result = db.Connectdb();
		out.println(result);
		
		
		String id = req.getParameter("id");
		String event = req.getParameter("submit");
		
		
		out.println(id);
		out.println(event);
		
		
		
		if(event.equals("Delete"))
		{
		   try 
		   {
			   String delete = db.delete("delete from add_catagory where id='"+id+"'");
			   
			   resp.setContentType("text/html");
				 out.print("<script type='text/javascript'>");
				 out.print("alert(' Deleted Succsessfully'); ");
				 out.print("location='r_catagory_list.jsp'; ");
				 out.print("</script>");
			   
		   }catch(Exception ex)
		   {
			   out.print(ex.toString());
		   }
		}
		
		
		if(event.equals("Update"))
		{
			
			session.setAttribute("id", id);
			resp.sendRedirect("update_add_category.jsp");
			
		}
		
		
	}

}
