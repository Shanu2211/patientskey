<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import ="com.database.*" %>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String mobile = request.getParameter("mob");
	String dob = request.getParameter("dob");
	String sex = request.getParameter("sex");
	String type = request.getParameter("type");
	String lab = request.getParameter("lab");
	String other = request.getParameter("other");
	String appoint_date = request.getParameter("appdate");
	String timeslot = request.getParameter("ts");
	String state = request.getParameter("state");
	String city = request.getParameter("city");
	String address = request.getParameter("add");
	String booking_date = request.getParameter("cdate");
	
	
	Connection con = DbConnection.takeConnection();
	String query = "insert into tests(name,email,mobile,dob,sex,type,lab,other,appoint_date,timeslot,state,city,address,booking_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, mobile);
	ps.setString(4, dob);
	ps.setString(5, sex);
	ps.setString(6, type);
	ps.setString(7, lab);
	ps.setString(8, other);
	ps.setString(9, appoint_date);
	ps.setString(10, timeslot);
	ps.setString(11, state);
	ps.setString(12, city);
	ps.setString(13, address);
	ps.setString(14, booking_date);
	ps.executeUpdate();
	response.sendRedirect("booktest.html");
	con.close();
%>
</body>
</html>