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
<title>Edit Recruiter Profile</title>
  <jsp:include page="r_navbar.jsp"/>

<link rel="stylesheet" type="text/css" href="css/r_edite_profile.css">
</head>
<body>
  <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from r_signup where r_id='"+session.getAttribute("r_id")+"'" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
        
			 %>
<div class="edit-profile-container">
    <h2>Edit Profile</h2>

    <form action="r_edit_profile" method="post" >

        <!-- Profile Image -->
        <div class="image-box">
            <img src="images/03.jpg" id="profilePic" alt="Profile Image">

            <label for="uploadPhoto" class="camera-icon">
                📷
            </label>
            <input type="file" id="uploadPhoto" accept="image/*"
                   onchange="previewImage(event)" name="photo">
        </div>

        <div class="input-group">
            <label>Full Name</label>
            <input type="text" placeholder="Enter full name" value="<%=rs.getString("fullname")%>" name="fullname">
        </div>

        <div class="input-group">
            <label>Email</label>
            <input type="email" placeholder="Enter email" value="<%=rs.getString("email")%>" name="email">
        </div>

        <div class="input-group">
            <label>Phone</label>
            <input type="text" placeholder="Enter phone number" value="<%=rs.getString("phone_no")%>" name="phone_no">
        </div>

        <div class="input-group">
            <label>Company Name</label>
            <input type="text" placeholder="Enter company name" value="<%=rs.getString("companyname")%>" name="companyname">
        </div>

        <div class="input-group">
            <label>Address</label>
            <textarea placeholder="Enter address" name="address"><%=rs.getString("address")%></textarea>
        </div>

        <div class="btn-group">
            <button class="save-btn" name="submit" value="Update">Update</button>
            <button type="button" class="cancel-btn"
                onclick="location.href='r_profile.jsp'">Cancel</button>
        </div>

    </form>
</div>

<%} %>
<script>
function previewImage(event) {
    const image = document.getElementById("profilePic");
    image.src = URL.createObjectURL(event.target.files[0]);
}
</script>

</body>
</html>
