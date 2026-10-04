<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Interview Schedule</title>
    <jsp:include page="r_navbar.jsp" />

<link rel="stylesheet" type="text/css" href="css/r_interview_schedule.css">
</head>
<body>

<div class="container">
    <h1>📅 Interview Scheduling Panel</h1>

    <!-- Schedule Interview Form -->
    <div class="form-box">
        <h2>Schedule Interview</h2>
        <form action="r_interview_schedule" method="post">
            
           
            
            <!-- Interview Date Textbox -->
            <input type="date" name="interview_date" required>
            
            <!-- Interview Time Textbox -->
            <input type="time" name="interview_time" required>
            
            <!-- Interview Location Textbox -->
            <input type="text" name="interview_location" placeholder="Interview Location / Meeting Link" required>
            
            <input type="submit" value="Schedule Interview" class="btn-schedule" name="submit">
        </form>
    </div>

     
    </div>
</div>

</body>
</html>
