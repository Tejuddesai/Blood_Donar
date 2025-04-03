

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AndroidUpdateProfile extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
          
    public AndroidUpdateProfile() 
    {
        super();       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Android Update Profile Servlet Started.");
		
		Connection AndroidUpdateCon;
		Statement AndroidUpdateSt;
		PrintWriter AndroidUpdatePW = response.getWriter();
		
		
		String UpdateUserName = request.getParameter("Username");
		String UpdateDonorName = request.getParameter("Donorname");
		String UpdateEmailID = request.getParameter("EmailId");
		String UpdateMobileNo = request.getParameter("MobileNo");
		String UpdateDistrict = request.getParameter("UDistrict");
		String UpdateArea = request.getParameter("UArea");
		
		String NewDonorName = UpdateDonorName.replace('.', ' ').toString();
		
		System.out.println("Update Profile Data :: "+UpdateUserName+"~"+NewDonorName+"~"+UpdateEmailID+"~"+UpdateMobileNo+"~"+UpdateDistrict+"~"+UpdateArea);
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			AndroidUpdateCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/BloodDonorDB","root","");
			if(AndroidUpdateCon != null)
			{
				System.out.println("Connection Established.");
				AndroidUpdateSt = AndroidUpdateCon.createStatement();
				int x = AndroidUpdateSt.executeUpdate("UPDATE blooddonorreg SET DonorName='"+NewDonorName+"',Email='"+UpdateEmailID+"',District='"+UpdateDistrict+"',Area='"+UpdateArea+"',MobileNo='"+UpdateMobileNo+"' WHERE UserName='"+UpdateUserName+"'");
				if(x>0)
				{
					System.out.println("Profile Updated");
					AndroidUpdatePW.print("ProfileUpdated");
				}
				else
				{
					System.out.println("Profile Not Updated");
					AndroidUpdatePW.print("ProfileNotUpdated");
				}

			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
}
