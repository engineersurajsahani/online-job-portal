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
    <link rel="stylesheet" type="text/css" href="css/a_applied_list.css">

    <!-- Navbar -->
    <jsp:include page="a_navbar.jsp"/>
</head>
<body>
<form action="a_applied_list" method="post">
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
			<th>Action</th>
            
        </tr>
<%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from e_apply_job" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
        
			   %>
		        <tr>
		            <td><%=rs.getString("e_id") %></td>
		            <td><%=rs.getString("name") %></td>
		            <td><%=rs.getString("mobilenumber") %></td>
		            <td><%=rs.getString("email") %></td>
		            <td><%=rs.getString("jobtitle") %></td>
		            <td><%=rs.getString("company") %></td>
		            <td><%=rs.getString("resume") %></td>
		            
		             <td><input type="submit" name="submit" value="Accept" class="btn">
		            <input type="submit" name="submit" value="Reject" class="btn" style="background-color: red">
		            </td>  
		            
		        </tr>
		     <%} %>

        
    </table>
</div>
</form>
</body>
</html>
