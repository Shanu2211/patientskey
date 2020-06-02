package com.database;
import java.sql.*;

public class DbConnection {
	
	public static Connection takeConnection()
	{
		Connection con = null;
		String path = "jdbc:mysql://localhost:3306/appin";
		String username = "root";
		String password = "shashwat";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(path,username,password);
			return con;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
}
