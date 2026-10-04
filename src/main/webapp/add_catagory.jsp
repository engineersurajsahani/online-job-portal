<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
    
    <jsp:include page="a_navbar.jsp" />
    <link rel="stylesheet" type="text/css" href="css/add_catagory.css">
    <style><%@include file="css/add_catagory.css"%></style>
</head>
<body>

<div class="container">
    <h2>Add Category</h2>

    <form name=add_catagory action=add_catagory method=post>
        
        <label>Category Name</label>
        <input type="text" name="categoryName" placeholder="Enter category name" required>

        <label>Category Info</label>
        <textarea name="categoryInfo" rows="4" placeholder="Enter category information" required></textarea>

        <label>Category Image</label>
        <input type="file" name="categoryImage" accept="image/*" required>

        <button type="submit" name="submit" value="Add Category">Add Category</button>

    </form>
</div>

</body>
</html>
