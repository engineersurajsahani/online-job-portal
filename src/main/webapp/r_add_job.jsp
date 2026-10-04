<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="r_navbar.jsp"/>
<link rel="stylesheet" type="text/css" href="css/r_add_job.css">
<style><%@include file="css/r_add_job.css"%></style>
<title>Insert title here</title>
</head>
<body>
<a href="r_joblist.jsp"><input type="submit" value="View Job List"></a>
<form name=r_add_job action=r_add_job method=post>

	<div class="mydiv">
		<h1>Add Job</h1>
		
		 <label>Category</label>
            <select name="Category" required>
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
                <option><%=rs.getString("categoryName") %></option>
                <%} %>
            </select>
		
			<label>Job Title</label>
			<input type="text" name="jobtitle" required>
			
			<label>Company Name</label>
			<input type="text" name="companyname" required>
			
			<label>Job Type</label>
			<select name="jobtype" required>
			    <option value="">-- Select Job Type --</option>
			    <option value="Full Time">Full Time</option>
			    <option value="Part Time">Part Time</option>
			    <option value="Internship">Internship</option>
			    <option value="Contract">Contract</option>
			</select>
			
			<label>Position</label>
			
			<input type="number" name="Position" required>
			<label>Experience (Years)</label>
			<input type="number" name="experience" min="0" max="20" required>
			
			<label>Qualification</label>
			<select name="qualification" required>
			    <option value="">-- Select Qualification --</option>
			    <option value="10th Pass">10th Pass</option>
			    <option value="12th Pass">12th Pass</option>
			    <option value="Diploma">Diploma</option>
			    <option value="Graduate">Graduate</option>
			    <option value="Post Graduate">Post Graduate</option>
			    <option value="Any">Any</option>
			</select>
			
			<label>Location</label>
			<input type="text" name="location" required>
			
			<label>Salary</label>
			<input type="text" name="salary" required>
			
			<label>Job Description</label>
			<textarea rows="10" name="jobdiscription" required></textarea>
			
			<label>Company Logo</label>
			<input type="file" name="image" required>
			
			<label>Requirement</label>
			<input type="text" name="requirement" required>
			
					
		<input type="submit" value="Add Job"  name="submit">
		<input type="submit" value="Cancle"  name="submit">
	
	</div>
</form>
</body>
</html>