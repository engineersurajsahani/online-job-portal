<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback List</title>
<jsp:include page="a_navbar.jsp" />
<link rel="stylesheet" href="css/feedback_list.css">
<style><%@include file="css/feedback_list.css"%></style>
</head>
<body>

<form name="feedback_list" action="feedback_list" method="post">

  <div class="container">
    <h2>User Feedback List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Message</th>
            <th>feedback</th>
            <th>Date</th>
            
        </tr>
        <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from e_feedback" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
           
        %>
        <tr>
            <td><%=rs.getString("e_id") %></td>
            <td><%=rs.getString("name") %></td>
            <td><%=rs.getString("email") %></td>
            <td><%=rs.getString("rating") %></td>
            <td><%=rs.getString("feedback") %></td>
            <td><%=rs.getString("date") %></td>
        </tr>
     <%} %>
       
    </table>
  </div>
</form>

</body>
</html>
