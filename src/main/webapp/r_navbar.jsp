<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/r_navbar.css">
</head>
<body>

<nav>
    <ul class="navbar">
        <li class="left-item">Online Job Portal</li>

        <li><a href="r_homepage.jsp">Home</a></li>
          <li><a href="r_add_job.jsp">Add Job</a></li>
        <!-- Application List Dropdown -->
        <li class="dropdown">
            <a href="#" class="dropbtn">Application List ⌄</a>
            <div class="dropdown-content">
                <a href="r_applied_list.jsp">All Applications</a>
                <a href="recruiter_accept_list.jsp">Accepted</a>
                <a href="recruiter_reject_list.jsp">Rejected</a>
            </div>
        </li>

        <li><a href="r_profile.jsp">Profile</a></li>
        <li><a href="index.jsp">Logout</a></li>
    </ul>
</nav>

</body>
</html>
