<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Home - Job Portal</title>
    <jsp:include page="e_navbar.jsp"/>
   <link rel="stylesheet" type="text/css" href="css/u_homepage.css">
      <style><%@include file="css/e_homepage.css"%></style>
</head>
<body>


<div class="hero">
    <h1>Find Your Dream Job Today</h1>
    <p>Search thousands of jobs from top companies</p>

  <form name=e_homepage action=e_homepage method=post>
        <input type="text" placeholder="search  job" name="job_name">
        <input type="text" placeholder="Location" name="location">
        <button type="submit" name="submit" value="Search">Search</button>
    </form>
</div>
<div class="section">
    <h2>Job Categories</h2>
    <div class="categories">
        <div class="job">
			<div class="job">
			    <button type="button" onclick="location.href='job.jsp?category=IT'">IT</button>
			
			    <button type="button" onclick="location.href='job.jsp?category=Banking'">Banking</button>
			
			    <button type="button" onclick="location.href='job.jsp?category=Teaching'">Teaching</button>
			
			    <button type="button" onclick="location.href='job.jsp?category=Government'">Government</button>
			
			    <button type="button" onclick="location.href='job.jsp?category=SugarIndustry'"> Sugar Industry</button>
			
			    <button type="button" onclick="location.href='job.jsp?category=DigitalMarketer'">Digital Marketer </button>
           </div>
        </div>
       </div>
</div>


<div class="section">
  
    <div class="jobs">
    
       <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from r_add_job where location='"+session.getAttribute("location")+"' OR jobtitle='"+session.getAttribute("jobtitle")+"'" ;  
		   
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
		                    <p><img src="images/<%=rs.getString("companylogo") %>" height="100px;"></p>
		                    <p><strong>Company:</strong> <%=rs.getString("companyname") %>.</p>
		                    <p><strong>Location:</strong> <%=rs.getString("location") %>.</p>
		                    <p><strong>Package:</strong> <%=rs.getString("salary") %></p>
		                     <p><strong>Experience</strong> <%=rs.getString("Experience") %></p>
		                      <p><strong>Job Type:</strong> <%=rs.getString("JobType") %></p>
		                      <p><strong>Job position:</strong> <%=rs.getString("position") %></p>
  							
  						                 
  							                    
  						     <input type="submit" name="submit" value="Applay Now">
		                </div>
		       </div>
		           </form>
		       <%} %>  

      
    </div>
</div>


<div class="section">
    <h2>Latest Jobs</h2>
  <div class="jobs">
    
       <%
       
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql1 = "select * from r_add_job LIMIT 4 " ;  
		   
		   ResultSet rs1 = st.executeQuery(sql1);
		   while(rs1.next())
		   {
        
			   %>
			     
            <form name=job action=job method=post>
             <input type="hidden" value="<%=rs1.getString("r_id") %>" name="r_id">
            <input type="hidden" value="<%=rs1.getString("job_id") %>" name="job_id">
             <input type="hidden" value="<%=rs1.getString("jobtitle") %>" name="jobtitle">
			<input type="hidden" value="<%=rs1.getString("companylogo") %>" name="companylogo">
			<input type="hidden" value="<%=rs1.getString("companyname") %>" name="companyname">
			<input type="hidden" value="<%=rs1.getString("location") %>" name="location">
			<input type="hidden" value="<%=rs1.getString("salary") %>" name="salary">
			<input type="hidden" value="<%=rs1.getString("experience") %>" name="experience">
			<input type="hidden" value="<%=rs1.getString("jobtype") %>" name="jobtype">
			<input type="hidden" value="<%=rs1.getString("Position") %>" name="Position">
			<input type="hidden" value="<%=rs1.getString("job_discription") %>" name="job_discription">
			
	           
            
            
            <div class="col-sm-4">      
		                <div class="job-card">
		                    <h2><%=rs1.getString("jobtitle") %></h2>
		                    <p><img src="images/<%=rs1.getString("companylogo") %>" height="100px;"></p>
		                    <p><strong>Company:</strong> <%=rs1.getString("companyname") %>.</p>
		                    <p><strong>Location:</strong> <%=rs1.getString("location") %>.</p>
		                    <p><strong>Package:</strong> <%=rs1.getString("salary") %></p>
		                     <p><strong>Experience</strong> <%=rs1.getString("Experience") %></p>
		                      <p><strong>Job Type:</strong> <%=rs1.getString("JobType") %></p>
		                      <p><strong>Job position:</strong> <%=rs1.getString("position") %></p>
  							
  						                 
  							                    
  						     <input type="submit" name="submit" value="Applay Now">
		                </div>
		       </div>
		           </form>
		               
		       <%} %>  

      </div>

</div>


<div class="about">
    <h2>About Online Job Portal</h2>
    <p>
        Online Job Portal helps job seekers find suitable jobs
        and allows employers to post vacancies easily.
        It provides a simple and effective platform for recruitment.
    </p>
</div>


<div class="footer">
    <p>© 2025 Online Job Portal | All Rights Reserved</p>
</div>
</form>
</body>
</html>
