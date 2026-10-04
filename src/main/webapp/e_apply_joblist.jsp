<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Applied Jobs</title>
    <link rel="stylesheet" href="css/e_apply_joblist.css">
    <jsp:include page="e_navbar.jsp" />
</head>
<body>

<div class="container">
    <h2>Applied Job List</h2>

    <table>
        <thead>
            <tr>
                <th>A_Id</th>
                <th>Job Title</th>
                <th>Job TYpe</th>
                <th>Company</th>
                <th>Location</th>
                <th> Salary</th>
                <th>Image</th>
				<th>Apply Date</th>
                <th>Status</th>
                
            </tr>
        </thead>


    
         <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from e_apply_job where user_id='"+session.getAttribute("user_id")+"'";  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
        
			   %>
		        <tr>
		            <td><%=rs.getString("a_id") %></td>
		            <td><%=rs.getString("job_title") %></td>
		            <td><%=rs.getString("job_type") %></td>
		            <td><%=rs.getString("company") %></td>
		            <td><%=rs.getString("location") %></td>
		            <td><%=rs.getString("salary") %></td>
		            <td><%=rs.getString("image") %></td>
		            <td><%=rs.getString("applay_date") %></td>
		            <td><%=rs.getString("status") %></td>
		            
		           
		            
		        </tr>
		     <%} %>
    </table>
</div>

</body>
</html>
