<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Job List</title>
<jsp:include page="r_navbar.jsp" />
<link rel="stylesheet" type="text/css" href="css/r_joblist.css">
<style><%@include file="css/r_joblist.css"%></style>

</head>
<body>



<div class="container">
    <h2>My Posted Jobs</h2>

    <table>
        <tr>
            <th>job_id</th>
            <th>category</th>
            <th>jobtitle</th>
            <th>companyname</th>
            <th>location</th>
            <th>salary</th>
            <th>job_discription</th>
            <th>companylogo</th>
            <th>requirement</th>
            <th>Action</th>
            
            
            
        </tr>

       
       <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from r_add_job where r_id='"+session.getAttribute("r_id")+"'" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
			   %>
			   <form action="r_joblist" method="post">		   
			   <input type="hidden" value="<%=rs.getString("job_id") %>" name="job_id">
			   
		        <tr>
		            <td><%=rs.getString("job_id") %></td>
		            <td><%=rs.getString("category") %></td>
		            <td><%=rs.getString("jobtitle") %></td>
		            <td><%=rs.getString("companyname") %></td>
		            <td><%=rs.getString("location") %></td>
		            <td><%=rs.getString("salary") %></td>
		            <td><%=rs.getString("job_discription") %></td>
		            <td><%=rs.getString("companylogo") %></td>
		            <td><%=rs.getString("requirement") %></td>
		            
		             <td><input type="submit" name="submit" value="Update" class="btn">
		            <input type="submit" name="submit" value="Delete" class="btn" style="background-color: red">
		            </td>   
		        </tr>
		        </form>
		     <%} %>
    </table>
</div>

</body>
</html>
