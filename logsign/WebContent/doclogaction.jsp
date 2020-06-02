<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="com.database.*" %>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" type="text/css" href="css/doclogactionstyle.css">
</head>
<body>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("psw");
	Connection con = DbConnection.takeConnection();
	String query = "select * from docregtbl where email=? and password=?";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, email);
	ps.setString(2, password);
	ResultSet rs = ps.executeQuery();

		
		if(rs.next())
		{
			%>
			<script type="text/javascript">
				alert('You are successfully logged in');
			</script>
			<div class="topnav" style="background: lightgrey">
				  <div class ="logo">
				    	<a href="home.html"><img src ="access-512.png"></a>
				  </div>
				  <a href="home.html">Home</a>
				  <a href="#" class="active">Doctor</a>
				  <a href="docreg.html">Are you a doctor</a>
  				  <a href="pathoreg.html">Add your pathology</a>
  				  <a href="doclog.html">Log out</a>
				  <h3 align="right" style="background-color: orange"><a href="#">Welcome Dr.<%out.println(rs.getString("name"));%></a></h3>
			</div>
			
			
			<div class="dropdown">
			  <button class="dropbtn">More</button>
			  <div class="dropdown-content">
			    <a href="appointsearch.jsp">Book appointment</a>
		  	    <a href="booktest.html">Book tests & checkups</a>
		  	    <a href="#">Read articles</</a>
			    <a href="contact.html">Contact us</a>
			    <a href="about.html">About us</a>
		  	  </div>
		   </div> 
		
			
			<form action="doclogaction1.jsp" >
		   <input type="text" value="<%out.println(rs.getString("name"));%>" name="name" style="color:black" hidden>
			<h2><b>Choose Filter Option:</b></h2>
				
   				<input type="submit" class="btn btn-success" style="background-color:orange;color:white;margin-left:43%;margin-top:5%;font-size:23px" value="Watch Your Patient"/>
			
			</form>		
			<%
		}
		else
		{
			%>
			<script type="text/javascript                                                                                                                                                       ">
				alert('You have entered wrong details');
			</script>
			<%
			response.sendRedirect("doclog.html");
		}

con.close();
%>
</body>
</html>