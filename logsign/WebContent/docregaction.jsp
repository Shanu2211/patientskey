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
	String address = request.getParameter("add");
	String state = request.getParameter("state");
	String city = request.getParameter("city");
	String proffession = request.getParameter("prof");
	String type = request.getParameter("type");
	String clinic = request.getParameter("clnc");
	String amount = request.getParameter("fee");
	String password = request.getParameter("psw");
	String image = request.getParameter("img");
	
	
	Connection con = DbConnection.takeConnection();
	String query = "insert into docregtbl(name,email,mobile,dob,sex,address,state,city,proffession,type,clinic,amount,password,image) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, mobile);
	ps.setString(4, dob);
	ps.setString(5, sex);
	ps.setString(6, address);
	ps.setString(7, state);
	ps.setString(8, city);
	ps.setString(9, proffession);
	ps.setString(10, type);
	ps.setString(11, clinic);
	ps.setString(12, amount);
	ps.setString(13, password);
	ps.setString(14, image);
	ps.executeUpdate();
	%>
	<script type="text/javascript">
		alert('Please login once to continue');
	</script>
	<%
	response.sendRedirect("doclog.html");
	con.close();
%>
</body>
</html>