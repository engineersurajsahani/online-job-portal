<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <jsp:include page="a_navbar.jsp"/>
    <title>Admin Home - Job Portal</title>
    <link rel="stylesheet" type="text/css" href="css/a_homepage.css">
      <style><%@include file="css/a_homepage.css"%></style>
    
</head>
<body>

<form name=a_homepage action=a_homepage method=post>
    <section class="dashboard">
        <div class="container">
            <h1>Welcome, Admin</h1>
            <p>Here you can manage all job postings, employers, and candidates.</p>

            <div class="cards">
               
               <div class="card">
			        <h2>Post New catagory</h2>
			        <p>Create and publish new job vacancies</p>
			        <a href="add_catagory.jsp">Post Job</a>
    		   </div> 
               
                <div class="card">
                    <h2>Manage Users</h2>
                    <p>Manage registered job seekers and employers.</p>
                    <a href="a_employee_list.jsp">Go</a>
                </div>

                <div class="card">
                    <h2>Feedback List</h2>
                    <p>Check user feedback and improve services.</p>
                    <a href="feedback_list.jsp">Go</a>
                </div>
                 <div class="card">
                    <h2>Recruiter List</h2>
                    <p>Check user feedback and improve services.</p>
                    <a href="a_recruter_list.jsp">Go</a>
                </div>
                 <div class="card">
                    <h2>Contact List</h2>
                    <p>Check user feedback and improve services.</p>
                    <a href="contact_list.jsp">Go</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Job Portal Admin Dashboard. All Rights Reserved.</p>
    </footer>
    </form>
</body>
</html>
