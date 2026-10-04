<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Recruiter - Category List</title>

    <!-- CSS Link -->
    <link rel="stylesheet" type="text/css" href="css/r_catagory_list.css">

    <!-- If you use navbar -->
  <jsp:include page="a_navbar.jsp"/>
</head>
<body>

<div class="container">
    <h2>Job Categories</h2>

    <table>
        <thead>
            <tr>
                <th>id</th>
                <th>category Name</th>
                <th>category Info</th>
                <th>category Image</th>
                 <th>Action</th>
                
            </tr>
        </thead>
        <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from add_catagory" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   { 
		   
		   %>
		   <form action="r_catagory_list" method="post">
		     <input type="hidden" value="<%=rs.getString("id") %>" name="id">
		   
		        <tr>
		            <td><%=rs.getString("id") %></td>
		            <td><%=rs.getString("categoryName") %></td>
		            <td><%=rs.getString("categoryInfo") %></td>
		            <td><img src="images/<%=rs.getString("categoryImage") %>" class="img"></td>
		            
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
