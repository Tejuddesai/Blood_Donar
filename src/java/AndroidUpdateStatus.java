

import java.io.IOException;
import java.sql.DriverManager;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AndroidUpdateStatus extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public int USHealth,USAvail;
           
    public AndroidUpdateStatus() 
    {
        super();        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Android Update Status Servlet Started.");
		
		Connection AndroidSCon;
		Statement AndroidSSt;
		PrintWriter AndroidSPW = response.getWriter();
		
		
		String UpdateSUserName = request.getParameter("Username");
		String UpdateSHealthStatus = request.getParameter("HealthSt");
		String UpdateSAvailStatus = request.getParameter("AvailSt");
		String UpdateSLBDDate = request.getParameter("LastBloodDonationStatus");
						
		System.out.println("Update Status Data :: "+UpdateSUserName+"~"+UpdateSHealthStatus+"~"+UpdateSAvailStatus+"~"+UpdateSLBDDate);
		
		if(UpdateSHealthStatus.equals("Healthy"))
		{
			USHealth = 0;
		}
		else
		{
			USHealth = 1;
		}
		
		if(UpdateSAvailStatus.equals("Available"))
		{
			USAvail = 0;
		}
		else
		{
			USAvail = 1;		
		}
		
		System.out.println("Health Status : "+USHealth+", Availability Status : "+USAvail);
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			AndroidSCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/BloodDonorDB","root","");
			if(AndroidSCon != null)
			{
				System.out.println("Connection Established.");
				AndroidSSt = AndroidSCon.createStatement();
				int x = AndroidSSt.executeUpdate("UPDATE blooddonorreg SET LastDonationDate='"+UpdateSLBDDate+"',HealthStatus="+USHealth+",Availability="+USAvail+" WHERE UserName='"+UpdateSUserName+"'");
				if(x>0)
				{
					System.out.println("User Status Updated");
					AndroidSPW.print("UserStatusUpdated");
				}
				else
				{
					System.out.println("User Status Not Updated");
					AndroidSPW.print("UserStatusNotUpdated");
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
