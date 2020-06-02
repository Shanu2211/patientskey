<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/appointsearchstyle.css">
<link href = "css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>


<div class="topnav" style="background: lightgrey">
  <div class ="logo">
      <a href="home.html"><img src ="access-512.png"></a>
  </div>
  <a href="home.html">Home</a>
  <a class="active" href="appointsearch.jsp">Book appointment</a>
  <a href="pathosearch.jsp">Book tests & checkups</a>
</div>

<br><br><br><br>


<div class="second">
	<h1 style="color: orange"><b>Search here for doctors and clinics</b></h1>
	<div class="dropdown">
	  <button class="dropbtn">More</button>
	  <div class="dropdown-content">
	  	<a href="docreg.html">Are you a doctor</</a>
	  	<a href="pathoreg.html">Add your pathology</</a>
	    <a href="#">Read articles</</a>
	    <a href="contact.html">Contact us</a>
	    <a href="about.html">About us</a>
  	  </div>
   </div> 
<br><br><br><br>		
<form action="" method="post">
<div class = "container">
	<div class = "form-group">
		<div class = "col-sm-5">
			<div class = "input-group">
				<input type="text" name="search" class="form-control" placeholder="Search your preffered city, doctors name or clinics name" autocomplete="off">
				<div class = "input-group-btn">
					<button type="submit" value ="search" class="btn btn primary"><span class="glyphicon glyphicon-search"></span>Search</button>
				</div>
			</div>
		</div>
	</div>
	<br><br><br>
	<table class="table table-bordered table-striped">
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Sex</th>
			<th>Address</th>
			<th>City</th>
			<th>Type</th>
			<th>Clinic Name</th>
			<th>Fees</th>
		</tr>
		<%
		Connection con = null;
		String path = "jdbc:mysql://localhost:3306/appin";
		String username = "root";
		String password = "shashwat";
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(path,username,password);
			String Query = "select * from docregtbl where city like'%"+request.getParameter("search")+"%' or name like'%"+request.getParameter("search")+"%'or clinic like'%"+request.getParameter("search")+"%'or type like'%"+request.getParameter("search")+"%'";
			
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(Query);
			while(rs.next())
			{
				%>
					<tr>
						<td><a href="bookappoint.html"><b>Dr.<%=rs.getString("name")%></b></a></td>
						<td><%=rs.getString("email")%></td>
						<td><%=rs.getString("mobile")%></td>
						<td><%=rs.getString("sex")%></td>
						<td><%=rs.getString("address")%></td>
						<td><%=rs.getString("city")%></td>
						<td><%=rs.getString("type")%></td>
						<td><%=rs.getString("clinic")%></td>
						<td><%=rs.getString("amount")%></td>
						<td><a  href="bookappoint.jsp" style="color: green" ><b>Book now</b></a></td>
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
</form>
	
</div>
</body>
</html>