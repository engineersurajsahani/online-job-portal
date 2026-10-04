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
<jsp:include page="e_navbar.jsp"/>
<link rel="stylesheet" type="text/css" href="css/r_add_job.css">
<style><%@include file="css/r_add_job.css"%></style>
<title>Insert title here</title>
</head>
<body>



     <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql1 = "select * from r_add_job where job_id='"+session.getAttribute("job_id")+"'" ;  
		   
		   ResultSet rs1 = st.executeQuery(sql1);
		   while(rs1.next())
		   {
        %>
        
        <form name=update_addjob action=update_addjob method=post>
      <input type="hidden" value="<%=rs1.getString("job_id")%>" name="job_id">	
      
      <div class="mydiv">
		<h1>Add Job</h1>
		
                
		 <label>Category</label>
            <select name="Category" required>
                <%
        
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from add_catagory " ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
        
			   %>
                <option ><%=rs.getString("categoryName") %></option>
                <%} %>
            </select>
		
		<label>Job Title</label>
		<input type="text" name="jobtitle" required value="<%=rs1.getString("jobtitle")%>">
		
		<label>Company Name</label>
		<input type="text" name="companyname" required value="<%=rs1.getString("companyname")%>">
		
		<label>Location</label>
		<input type="text" name="location" required value="<%=rs1.getString("location")%>">
		
		<label>Salary</label>
		<input type="text" name="salary" required value="<%=rs1.getString("salary")%>">
		
		<label>Job Type</label>
		<input type="text" name=" jobtype" required value="<%=rs1.getString("jobtype")%>">
		
		<label> Position</label>
		<input type="text" name="Position" required value="<%=rs1.getString("Position")%>">
		
		<label>Experience (Years)</label>
		<input type="text" name="experience" required value="<%=rs1.getString("experience")%>">
		
		<label> Qualification</label>
		<input type="text" name="qualification" required value="<%=rs1.getString("qualification")%>">
		
		<label>Job-Description</label>
		<textarea type="text" rows="6" name="jobdiscription" required><%=rs1.getString("job_discription")%></textarea>
		
		<label>Company Logo</label>
		<input type="file" name="image" required value="<%=rs1.getString("companylogo")%>">
		
		<label>Requirement</label>
		<input type="text" name="requirement" required value="<%=rs1.getString("requirement")%>">
		
		
		<input type="submit" value="update Job"  name="submit">
		<input type="submit" value="Cancle"  name="submit">
	
	</div>
	<%} %>
</form>
</body>
</html>