<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scheduled Interview List</title>
<link rel="stylesheet" type="text/css" href="css/shedule_interview_list.css">
</head>
<body>

<div class="container">
    <h1>📋 Scheduled Interview List</h1>

    <!-- Search Bar -->
    <div class="search-box">
        <input type="text" placeholder="Search Candidate Name">
        <input type="date">
        <input type="submit" value="Search" class="search-btn">
    </div>

    <!-- Interview Table -->
    <div class="table-wrapper">
        <table>
            <tr>
				<th>User Id</th>
                <th>Candidate Name</th>
                <th>Job Title</th>
                <th>Date</th>
                <th>Time</th>
                <th>Location</th>
                <th>Status</th>
				<th>Action</th>
                
            </tr>

            <!-- Sample Data -->
            <tr>
                <td>1</td>
                <td>Rahul Sharma</td>
                <td>Java Developer</td>
                <td>05 Feb 2026</td>
                <td>10:30 AM</td>
                <td>Zoom Meeting</td>
                <td><span class="status scheduled">Scheduled</span></td>
                <td>
                    <button class="btn view">View</button>
                    <button class="btn cancel">Cancel</button>
                </td>
            </tr>

            <tr>
                <td>2</td>        
                <td>Priya Mehta</td>
                <td>UI/UX Designer</td>
                <td>06 Feb 2026</td>
                <td>02:00 PM</td>
                <td>Pune Office</td>
                <td><span class="status completed">Completed</span></td>
                <td>
                    <button class="btn view">View</button>
                </td>
            </tr>

            <tr>
                <td>3</td>
                <td>Amit Verma</td>
                <td>Backend Developer</td>
                <td>07 Feb 2026</td>
                <td>11:15 AM</td>
                <td>Google Meet</td>
                <td><span class="status cancelled">Cancelled</span></td>
                <td>
                    <button class="btn view">View</button>
                </td>
            </tr>

        </table>
    </div>
</div>

</body>
</html>
