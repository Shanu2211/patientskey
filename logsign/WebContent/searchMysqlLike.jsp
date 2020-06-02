<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search data in jsp using LIKE operator</title>
<link href = "css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<form action="" method="post">
<div class = "container">
	<div class = "form-group">
		<div class = "col-sm-5">
			<div class = "input-group">
				<input type="text" name="search" class="form-control" placeholder="search here" autocomplete="off">
				<div class = "input-group-btn">
					<button type="submit" value ="search" class="btn btn primary"><span class="glyphicon glyphicon-search"></span>Search</button>
				</div>
			</div>
		</div>
	</div>
	<br><br><br>
	<table class="table table-bordered table-striped">
		<tr>
			<th>name</th>
			<th>email</th>
			<th>mobile</th>
			<th>sex</th>
			<th>address</th>
			<th>state</th>
			<th>city</th>
			<th>proffessions</th>
			<th>clinic</th>
			<th>amount</th>
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
			String Query = "select * from docregtbl where name like'%"+request.getParameter("search")+"%'";
			
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(Query);
			while(rs.next())
			{
				%>
					<tr>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("email")%></td>
						<td><%=rs.getString("mobile")%></td>
						<td><%=rs.getString("sex")%></td>
						<td><%=rs.getString("address") %></td>
						<td><%=rs.getString("state") %></td>
						<td><%=rs.getString("city") %></td>
						<td><%=rs.getString("proffession") %></td>
						<td><%=rs.getString("clinic") %></td>
						<td><%=rs.getString("amount") %></td>
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
</body>
</html>