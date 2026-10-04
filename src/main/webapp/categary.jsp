
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Job Categories - Job Portal</title>
    <jsp:include page="e_navbar.jsp"/>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">  
    <style ><%@include file="css/categary.css"%></style> 
</head>

<body>

    <div class="container">
        <h1>Select a Job Category</h1>
        
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
        <form name=categary action=categary method=post>
        <input type="hidden" value="<%=rs.getString("categoryName") %>" name="categoryName">
         <div class="row">
        <div class="col-sm-4">
       
            <div class="card">
                <button class="btn" name="submit" value=" ">
                  <img  src="images/<%=rs.getString("categoryImage") %>">
                    <h2><%=rs.getString("categoryName") %></h2>
                    <p style=""><%=rs.getString("categoryInfo") %></p>
                
               </button>
                </div>
        
           </div>
       </form>
        <%}%>
              </div>
    </div>
  
</body>
</html>
