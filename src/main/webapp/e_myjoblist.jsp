<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Applied Job List - Admin</title>

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/r_applied_list.css">

    <!-- Navbar -->
    <jsp:include page="e_navbar.jsp"/>
    <style >
    .img 
    {
    height: 100px;
    width: 100px;
    }
    </style>
</head>
<body>

<div class="container">
    <h2>Applied Job List</h2>

    <table>
        <tr>
            <th>Job title</th>
            <th> Job Type</th>
            <th>Company</th>
            <th>Location</th>
            <th>Salary</th>
            <th>Image</th>
            <th>Applay Date</th>
			<th>status</th>
            
        </tr>
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
			  
			    <input type="hidden" name="a_id" value="<%=rs.getString("a_id") %>">
		        <tr>
		            <td><%=rs.getString("job_title") %></td>
		            <td><%=rs.getString("job_type") %></td>
		            <td><%=rs.getString("company") %></td>
		            <td><%=rs.getString("location") %></td>
		            <td><%=rs.getString("salary") %></td>
		            <td><img src="images/<%=rs.getString("image") %>" class="img"></td>
		            <td><%=rs.getString("applay_date") %></td>
		            
		              <td><%=rs.getString("status") %></td>
		            
		        </tr>
	
		     <%} %>

        
    </table>
</div>

</body>
</html>
