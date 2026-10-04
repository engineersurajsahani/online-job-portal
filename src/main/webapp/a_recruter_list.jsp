 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Recruiter List - Admin</title>
    <link rel="stylesheet" type="text/css" href="css/a_recruter_list.css">
</head>
<body>

<jsp:include page="a_navbar.jsp"/>
<form name=a_recruter_list action=a_recruter_list method=post>

<div class="container">
    <h2>Recruiter List</h2>

    <table>
        <tr>
            <th>r_id</th>
            <th>fullname</th>
            <th>companyname</th>
            <th>email</th>
            <th>password</th>
            <th>gender</th>
            <th>phone_no</th>
            
            
        </tr>

       <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from r_signup";  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
        
			   %>
		        <tr>
		            <td><%=rs.getString("r_id") %></td>
		            <td><%=rs.getString("fullname") %></td>
		            <td><%=rs.getString("companyname") %></td>
		            <td><%=rs.getString("email") %></td>
		            <td><%=rs.getString("password") %></td>
		            <td><%=rs.getString("gender") %></td>
		            <td><%=rs.getString("phone_no") %></td>
		           
		         
		            
		            
		        </tr>
		     <%} %>
    </table>
</div>
</form>
</body>
</html>
