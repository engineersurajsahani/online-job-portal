
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
  <jsp:include page="e_navbar.jsp"/>
<link rel="stylesheet" type="text/css" href="css/e_profile.css">
    <style><%@include file="css/e_profile.css"%></style></head>
<body>

  <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from e_signup where id='"+session.getAttribute("user_id")+"'" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
        
			   %>

<div class="profile-container">

    <div class="profile-header">
        <img src="images/<%=rs.getString("photo") %>" >
        <h2><%=rs.getString("fullname") %></h2>
        
    </div>

    <div class="profile-details">
    
    <div class="detail-row">
            <span>User Name</span>
            <p><%=rs.getString("username") %></p>
        </div>
    

        <div class="detail-row">
            <span>Email</span>
            <p><%=rs.getString("email") %></p>
        </div>

        <div class="detail-row">
            <span>Phone</span>
            <p><%=rs.getString("phone_no") %></p>
        </div>


      

    </div>

    <div class="btn-group">
        <a href="edite.jsp" class="edit-btn">Edit Profile</a>
    </div>

</div>
<%} %>
</body>
</html>
