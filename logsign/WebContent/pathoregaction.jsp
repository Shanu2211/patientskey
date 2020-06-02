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
	String headpatho = request.getParameter("head");
	String amount = request.getParameter("fee");
	String state = request.getParameter("state");
	String city = request.getParameter("city");
	String address = request.getParameter("add");
	String type = request.getParameter("type");
	String image = request.getParameter("img");
	String password = request.getParameter("psw");
	
	Connection con = DbConnection.takeConnection();
	String query = "insert into pathoregtbl(name,email,mobile,headpatho,amount,state,city,address,type,image,password) values(?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, mobile);
	ps.setString(4, headpatho);
	ps.setString(5, amount);
	ps.setString(6, state);
	ps.setString(7, city);
	ps.setString(8, address);
	ps.setString(9, type);
	ps.setString(10, image);
	ps.setString(11, password);
	ps.executeUpdate();
	%>
	<script type="text/javascript">
		alert('Please login once to continue');
	</script>
	<%
	response.sendRedirect("patholog.html");
	con.close();
%>
</body>
</html>