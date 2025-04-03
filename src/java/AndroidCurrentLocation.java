

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AndroidCurrentLocation extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
          
    public AndroidCurrentLocation() 
    {
        super();        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Android Update Current Location Servlet Started.");
		
		Connection AndroidCLCon;
		Statement AndroidCLSt;
		PrintWriter AndroidCLPW = response.getWriter();
		
		String UpdateCLUserName = request.getParameter("Username");
		String UpdateCLDistrict = request.getParameter("CLDistrict");
		String UpdateCLArea = request.getParameter("CLArea");
		
		String NewUpdateCLArea = UpdateCLArea.replace('.', ' ').toString();
		
		System.out.println("Update Current Location Data :: "+UpdateCLUserName+"~"+UpdateCLDistrict+"~"+NewUpdateCLArea);
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			AndroidCLCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/BloodDonorDB","root","");
			if(AndroidCLCon != null)
			{
				System.out.println("Connection Established.");
				AndroidCLSt = AndroidCLCon.createStatement();
				int x = AndroidCLSt.executeUpdate("UPDATE blooddonorreg SET CurrentDistrict='"+UpdateCLDistrict+"',CurrentArea='"+NewUpdateCLArea+"' WHERE UserName='"+UpdateCLUserName+"'");
				if(x>0)
				{
					System.out.println("Current Location Updated");
					AndroidCLPW.print("CurrentLocationUpdated");
				}
				else
				{
					System.out.println("Current Location Not Updated");
					AndroidCLPW.print("CurrentLocationNotUpdated");
				}
				
			}
				
		}
		catch(Exception e)
		{
			
		}
		finally
		{
			
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
}
