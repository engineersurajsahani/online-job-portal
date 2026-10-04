<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet" %><%
    response.setHeader("Cache-Control", "no-store");
    try {
        Connection cn = util.DB.get();
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM r_add_job");
        rs.next();
        out.println("OK - jobs=" + rs.getInt(1) + " db=" + util.DB.getPath());
        rs.close(); st.close(); cn.close();
    } catch (Exception e) {
        response.setStatus(500);
        out.println("FAIL: " + e.toString());
    }
%>
