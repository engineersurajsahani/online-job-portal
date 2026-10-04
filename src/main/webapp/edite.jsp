<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
  <jsp:include page="e_navbar.jsp"/>

<link rel="stylesheet" type="text/css" href="css/edite.css">
</head>
<body>

<div class="edit-profile-container">
    <h2>Edit Profile</h2>

    <form name="edite" action="edite" method="post" >

        <!-- Profile Image -->
        <div class="image-box">
            <img src="images/03.jpg" id="profilePic" alt="Profile Image" >

            <label for="uploadPhoto" class="camera-icon">
                📷
            </label>
            <input type="file" id="uploadPhoto" accept="image/*" onchange="previewImage(event)" name="image" required="required">
        </div>

        <div class="input-group">
            <label>User Name</label>
            <input type="text" placeholder="Enter user name" name="fullname">
        </div>

        <div class="input-group">
            <label>Email</label>
            <input type="email" placeholder="Enter email" name="username">
        </div>

        <div class="input-group">
            <label>Phone</label>
            <input type="text" placeholder="Enter phone number" name="phone">
        </div>

       

       <div class="btn-group">
            <button class="save-btn" name="submit" value="Update">Update</button>
            <button type="button" class="cancel-btn"
                onclick="location.href='e_profile.jsp'">Cancel</button>
        </div>
    </form>
</div>

<script>
function previewImage(event) {
    const image = document.getElementById("profilePic");
    image.src = URL.createObjectURL(event.target.files[0]);
}
</script>

</body>
</html>
y