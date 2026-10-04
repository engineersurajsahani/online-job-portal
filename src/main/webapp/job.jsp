<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
     <link rel="stylesheet" type="text/css" href="css/job.css">
<style><%@include file="css/job.css"%></style>
 <jsp:include page="e_navbar.jsp"/>
    <title>Jobs - Online Job Portal</title>
    
</head>
<body>

    <section class="jobs">
        <div class="container">
            <h1>Available Jobs</h1>
            <p>Browse the latest job opportunities and apply now.</p>
            
                 <div class="row">
             <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from r_add_job where category='"+session.getAttribute("categoryName")+"'" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
        
			   %>
            <form name=job action=job method=post>
             <input type="hidden" value="<%=rs.getString("r_id") %>" name="r_id">
            <input type="hidden" value="<%=rs.getString("job_id") %>" name="job_id">
             <input type="hidden" value="<%=rs.getString("jobtitle") %>" name="jobtitle">
			<input type="hidden" value="<%=rs.getString("companylogo") %>" name="companylogo">
			<input type="hidden" value="<%=rs.getString("companyname") %>" name="companyname">
			<input type="hidden" value="<%=rs.getString("location") %>" name="location">
			<input type="hidden" value="<%=rs.getString("salary") %>" name="salary">
			<input type="hidden" value="<%=rs.getString("experience") %>" name="experience">
			<input type="hidden" value="<%=rs.getString("jobtype") %>" name="jobtype">
			<input type="hidden" value="<%=rs.getString("Position") %>" name="Position">
			<input type="hidden" value="<%=rs.getString("job_discription") %>" name="job_discription">
			
	           
            
            
            <div class="col-sm-4">      
		                <div class="job-card">
		                    <h2><%=rs.getString("jobtitle") %></h2>
		                    <p><img src="images/<%=rs.getString("companylogo") %>"></p>
		                    <p><strong>Company:</strong> <%=rs.getString("companyname") %>.</p>
		                    <p><strong>Location:</strong> <%=rs.getString("location") %>.</p>
		                    <p><strong>Package:</strong> <%=rs.getString("salary") %></p>
		                     <p><strong>Experience</strong> <%=rs.getString("Experience") %></p>
		                      <p><strong>Job Type:</strong> <%=rs.getString("JobType") %></p>
		                      <p><strong>Job position:</strong> <%=rs.getString("position") %></p>
  							<p class="desc"><strong>job_discription:</strong><%=rs.getString("job_discription") %></p><br>	
  							 <p class="desc"><strong>requirement:</strong><%=rs.getString("requirement") %></p><br>	                    
  							                    
  						     <input type="submit" name="submit" value="Applay Now">
		                </div>
		       </div>
		           </form>
		       <%} %>      
             </div>
            </div>
    </section>
    <footer>
        <p>&copy; 2025 OKP Online Job Portal. All Rights Reserved.</p>
    </footer>

</body>
</html>
