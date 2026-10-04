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
<title>Contact List</title>

<link rel="stylesheet" type="text/css" href="css/contact_list.css">

</head>

<body>

<jsp:include page="a_navbar.jsp" />

<div class="container">
    <h2>Contact List</h2>

    <table>
        <thead>
            <tr>
                <th>e_id</th>
                <th>name</th>
                <th>contactnumber</th>
                <th>email</th>
                <th>message</th>
            </tr>
        </thead>

        <%
         Connection cn =null;
        Statement st =null;
cn = util.DB.get();
		   st = cn.createStatement();
		   String sql = "select * from e_contactus" ;  
		   
		   ResultSet rs = st.executeQuery(sql);
		   while(rs.next())
		   {
           
        %>
        <tr>
            <td><%=rs.getString("e_id") %></td>
            <td><%=rs.getString("name") %></td>
            <td><%=rs.getString("contactnumber") %></td>
            <td><%=rs.getString("email") %></td>
            <td><%=rs.getString("message") %></td>
        </tr>
     <%} %>
    </table>
</div>

</body>
</html>
