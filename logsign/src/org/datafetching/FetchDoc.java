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
 * Servlet implementation class FetchDoc
 */
@WebServlet("/FetchDoc")
public class FetchDoc extends HttpServlet {
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
			PreparedStatement ps = con.prepareStatement("select * from docregtbl");
			ResultSet rs = ps.executeQuery();
			PrintWriter out = response.getWriter();
			out.println("<html><body style='background: antiquewhite'><table border='1'><tr><td>name</td><td>email</td><td>mobile</td><td>sex</td><td>address</td><td>state</td><td>city</td><td>proffession</td><td>clinic</td><td>amount</td><td>image</td></tr>");
			
			while(rs.next())
			{
				out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td><td>"+rs.getString(11)+"</td></tr>");
			}
			out.println("</table></body></html>");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
