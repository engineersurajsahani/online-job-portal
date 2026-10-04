<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <title>Recruiter Home - Job Portal</title>
    <link rel="stylesheet" type="text/css" href="css/r_homepage.css">
      <style><%@include file="css/r_homepage.css"%></style>
   <jsp:include page="r_navbar.jsp" />
   </head>
<body>
<form name=r_homepage action=r_homepage method=post>
    


<div class="welcome">
    <h1>Welcome, Recruiter</h1>
    <p>Manage your job postings and view candidates efficiently</p>
</div>


<div class="dashboard">

    <div class="card">
        <h2>Post New Job</h2>
        <p>Create and publish new job vacancies</p>
        <a href="r_add_job.jsp">Post Job</a>
    </div>

    <div class="card">
        <h2>Manage Jobs</h2>
        <p>Edit or delete your posted jobs</p>
        <a href="r_joblist.jsp">Manage</a>
    </div>

    <div class="card">
        <h2>Applications</h2>
        <p>View applied candidates</p>
        <a href="r_applied_list.jsp">View</a>
    </div>

                <div class="card">
                    <h2>Feedback List</h2>
                    <p>Check user feedback and improve services.</p>
                    <a href="r_feedback_list.jsp">Go</a>
                </div>
</div>





<div class="footer">
    <p>© 2025 Online Job Portal | Recruiter Panel</p>
</div>
    </form>
</body>
</html>
