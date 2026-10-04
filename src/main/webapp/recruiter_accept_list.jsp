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
    <jsp:include page="r_navbar.jsp"/>
</head>
<body>

<div class="container">
    <h2>Applied Job List</h2>

    <table>
        <tr>
            <th>e_id</th>
            <th> name</th>
            <th>mobilenumber</th>
            <th>email</th>
            <th>jobtitle</th>
            <th>company</th>
            <th>resume</th>
			<th>Status</th>
            
        </tr>
<%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from e_apply_job where r_id='"+session.getAttribute("r_id")+"' AND status='Accept'";  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
			  
			   %>
			    <form action="r_applied_list" method="post">
			    <input type="hidden" name="a_id" value="<%=rs.getString("a_id") %>">
		        <tr>
		            <td><%=rs.getString("user_id") %></td>
		            <td><%=rs.getString("name") %></td>
		            <td><%=rs.getString("mobilenumber") %></td>
		            <td><%=rs.getString("email") %></td>
		            <td><%=rs.getString("job_title") %></td>
		            <td><%=rs.getString("company") %></td>
		            <td><%=rs.getString("resume") %></td>
		             <td><%=rs.getString("status") %></td>
		          
		            
		        </tr>
		        </form>
		     <%} %>

        
    </table>
</div>

</body>
</html>
