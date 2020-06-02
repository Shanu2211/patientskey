<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="com.database.*" %>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pathology</title>
<link rel="stylesheet" type="text/css" href="css/doclogactionstyle.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>

			<div class="topnav" style="background: lightgrey">
				  <div class ="logo">
				    	<a href="home.html"><img src ="access-512.png"></a>
				  </div>
				  <a href="home.html">Home</a>
				  <a href="#" class="active">Pathology</a>
				  <a href="docreg.html">Are you a doctor</a>
  				  <a href="pathoreg.html">Add your pathology</a>
			</div>
	

<br><br>			
<h2 style="color:green"><b>Your Customers:</b></h2>
<br><br>

<div class="container" >
<table class="table table-bordered table-striped">
		<tr>
			<th>Patient Name</th>
			<th>Mobile no</th>
			<th>DOB</th>
			<th>Gender</th>
			<th>Test</th>
			<th>Time-Slot</th>

		</tr>
		<%
		String name = request.getParameter("name");
		String date = request.getParameter("date");
		Connection con = null;
		String path = "jdbc:mysql://localhost:3306/appin";
		String username = "root";
		String password = "shashwat";
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(path,username,password);
			String Query = "select name,mobile,dob,sex,type,timeslot from tests where lab like'%"+request.getParameter("name")+"%'" ;
			
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(Query);
			while(rs.next())
			{
				%>
					<tr>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("mobile")%></td>
						<td><%=rs.getString("dob")%></td>
						<td><%=rs.getString("sex")%></td>
						<td><%=rs.getString("type")%></td>
						<td><%=rs.getString("timeslot")%></td>

					</tr>
				<%
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		%>
	</table>
			
</div>
		
</body>
</html>