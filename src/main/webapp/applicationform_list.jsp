<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application List</title>
<jsp:include page="a_navbar.jsp" />
<link rel="stylesheet" href="css/application_list.css">
<style><%@include file="css/applicationform_list.css"%></style>
</head>
<body>

<form name=applicationform_list action=applicationform_list method=post>

<div class="container">
    <h2>Job Application List</h2>

    <table>
        <tr>
            <th>e_id</th>
            <th>fullname</th>
            <th>email</th>
            <th>mobilenumber</th>
            <th>qualification</th>
            <th>skills</th>
            <th>expectedsalary</th>
        </tr>
<%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from e_applicationform" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
           
        %>
        <tr>
            <td><%=rs.getString("e_id") %></td>
            <td><%=rs.getString("fullname") %></td>
            <td><%=rs.getString("email") %></td>
            <td><%=rs.getString("mobilenumber") %></td>
            <td><%=rs.getString("qualification") %></td>
            <td><%=rs.getString("skills") %></td>
            <td><%=rs.getString("expectedsalary") %></td>
            
        </tr>
     <%} %>

        

    </table>
</div>
</form>
</body>
</html>
