
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
    <title>Add Category</title>
    <link rel="stylesheet" type="text/css" href="css/add_catagory.css">
    <style><%@include file="css/add_catagory.css"%></style>
</head>
<body>

<div class="container">
    <h2>Add Category</h2>
    
    
     <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from add_catagory where id='"+session.getAttribute("id")+"'" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   if(rs.next())
		   {
        %>

    <form name=update_add_category action=update_add_category method=post>
        <input type="hidden" value="<%=rs.getString("id")%>" name="id">
        <label>Category Name</label>
        <input type="text" name="categoryName" placeholder="Enter category name" required value="<%=rs.getString("categoryName")%>">

        <label>Category Info</label>
        <textarea name="categoryInfo" rows="4" placeholder="Enter category information" required  ><%=rs.getString("categoryInfo")%></textarea>

        <label>Category Image</label>
        <input type="file" name="categoryImage" accept="image/*" required >value="<%=rs.getString("categoryImage")%>

        <button type="submit" name="submit" value="Update Category">Update Category</button>

    </form>
    <%} %>
</div>

</body>
</html>
