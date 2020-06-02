package org.datafetching;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class FetchData
 */
@WebServlet("/FetchData")
public class FetchData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		String path = "jdbc:mysql://localhost:3306/appin";
		String username = "root";
		String password = "shashwat";
		try
		{
			response.setContentType("text/html");
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(path,username,password);
			PreparedStatement ps = con.prepareStatement("select * from cust_reg");
			ResultSet rs = ps.executeQuery();
			PrintWriter out = response.getWriter();
			out.println("<html><body style='background: yellow'><table border='1'><tr><td>name</td><td>email</td><td>mobile</td><td>password</td><td>sex</td></tr>");
			
			while(rs.next())
			{
				out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td></tr>");
			}
			out.println("</table></body></html>");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
