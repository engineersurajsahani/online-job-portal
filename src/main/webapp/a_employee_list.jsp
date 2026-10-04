<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List - Admin</title>
    <link rel="stylesheet" type="text/css" href="css/a_employee_list.css">
</head>
<body>

<jsp:include page="a_navbar.jsp"/>
<form name=a_employee_list action=a_employee_list method=post>

<div class="container">
    <h2>User List</h2>

    <table>
        <tr>
            <th>id</th>
            <th>fullname</th>
            <th>username</th>
            <th>email</th>
            <th>gender</th>
            <th>phone_no</th>
            <th>password</th>
        </tr>

        <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from e_signup" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
        
			   %>
		        <tr>
		            <td><%=rs.getString("id") %></td>
		            <td><%=rs.getString("fullname") %></td>
		            <td><%=rs.getString("username") %></td>
		            <td><%=rs.getString("email") %></td>
		            <td><%=rs.getString("gender") %></td>
		            <td><%=rs.getString("phone_no") %></td>
		            <td><%=rs.getString("password") %></td>
		           
		            
		        </tr>
		     <%} %>
    </table>
</div>
</form>
</body>
</html>
