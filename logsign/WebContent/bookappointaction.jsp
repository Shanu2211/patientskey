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
	String disease = request.getParameter("dis");
	String doctor = request.getParameter("doc");
	String other = request.getParameter("other");
	String appoint_date = request.getParameter("appdate");
	String timeslot = request.getParameter("ts");
	String address = request.getParameter("add");
	String state = request.getParameter("state");
	String city = request.getParameter("city");
	String booking_date = request.getParameter("cdate");
	
	Connection con = DbConnection.takeConnection();
	String query = "insert into appointments(name,email,mobile,dob,sex,disease,doctor,other,appoint_date,timeslot,address,state,city,booking_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, mobile);
	ps.setString(4, dob);
	ps.setString(5, sex);
	ps.setString(6, disease);
	ps.setString(7, doctor);
	ps.setString(8, other);
	ps.setString(9, appoint_date);
	ps.setString(10, timeslot);
	ps.setString(11, address);
	ps.setString(12, state);
	ps.setString(13, city);
	ps.setString(14, booking_date);
	ps.executeUpdate();
	response.sendRedirect("bookappoint.html");
	con.close();
	%>
	<script type="text/javascript">
		alert('You are successfully logged in');
	</script>
</body>
</html>