

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AndroidUserReg extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;
       
    
    public AndroidUserReg() 
    {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Android Registration Servlet Started.");
		
		Connection AndroidRegCon = null;
		Statement AndroidRegSt = null;
		PrintWriter AndroidRegPW = response.getWriter();
		
		String DonorUserName = request.getParameter("Username");
		//System.out.println("Donor User Name : "+DonorUserName);
		String DonorPassword = request.getParameter("Password");
		//System.out.println("Donor Password : "+DonorPassword);
		String DonorGender = request.getParameter("Gender");
		//System.out.println("Donor Gender : "+DonorGender);
		String DonorFullname = request.getParameter("Fullname");
		//System.out.println("Donor Full Name : "+DonorFullname);
		String DonorDOBDate = request.getParameter("Dob");
		//System.out.println("Donor DOB : "+DonorDOBDate);
		String DonorEmailID = request.getParameter("EmailID");
		//System.out.println("Donor Email-ID : "+DonorEmailID);
		String DonorDistrict = request.getParameter("District");
		//System.out.println("Donor District : "+DonorDistrict);
		String DonorArea = request.getParameter("Area");
		//System.out.println("Donor Area : "+DonorArea);
		String DonorMobileNo = request.getParameter("MobileNo");
		//System.out.println("Donor Mobile NO : "+DonorMobileNo);
		String DonorBG = request.getParameter("BloodGrp");
		//System.out.println("Donor Blood Group : "+DonorBG);
		String DonorLBDDate = request.getParameter("LbdDate");
		//System.out.println("Donor LBDDate : "+DonorLBDDate);
		String DonorBloodGroup;
		String NewDonorFullName = DonorFullname.replace('.', ' ').toString();
		
		if(DonorBG.equals("1"))
			DonorBloodGroup="A+";
		else if(DonorBG.equals("2"))
			DonorBloodGroup="A-";
		else if(DonorBG.equals("3"))
			DonorBloodGroup="B+";
		else if(DonorBG.equals("4"))
			DonorBloodGroup="B-";
		else if(DonorBG.equals("5"))
			DonorBloodGroup="O+";
		else if(DonorBG.equals("6"))
			DonorBloodGroup="O-";
		else if(DonorBG.equals("7"))
			DonorBloodGroup="AB+";
		else
			DonorBloodGroup="AB-";
		
		//System.out.println("Donor Blood Group :: "+DonorBloodGroup);
		System.out.println("In REG Servlet :: "+DonorUserName+"~"+DonorPassword+"~"+DonorGender+"~"+NewDonorFullName+"~"+DonorDOBDate+"~"+DonorEmailID+"~"+DonorDistrict+"~"+DonorArea+"~"+DonorMobileNo+"~"+DonorBloodGroup+"~"+DonorLBDDate);
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			AndroidRegCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/BloodDonorDB","root","");
			if(AndroidRegCon != null)
			{
				System.out.println("Connection Established.");
				int DonorHealth = 0;
				int DonorAvail = 0;
				
				AndroidRegSt = AndroidRegCon.createStatement();
				int x = AndroidRegSt.executeUpdate("INSERT INTO BloodDonorReg VALUES('"+DonorUserName+"','"+NewDonorFullName+"','"+DonorGender+"','"+DonorDOBDate+"','"+DonorEmailID+"','xyz','"+DonorDistrict+"','"+DonorArea+"','"+DonorMobileNo+"','123','"+DonorBloodGroup+"','"+DonorLBDDate+"','"+DonorDistrict+"','"+DonorArea+"',"+DonorHealth+","+DonorAvail+")");
				if(x>0)
				{
					int y=AndroidRegSt.executeUpdate("INSERT INTO LoginTable VALUES('"+DonorUserName+"','"+DonorPassword+"','donor')");
					if(y>0)
					{
						System.out.println("Donor Registered.");
						AndroidRegPW.print("Registered");
					}
					else
					{
						System.out.println("Donor Not Registered.");
						AndroidRegPW.print("NotRegistered");
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			AndroidRegPW.close();
			try 
			{
				AndroidRegSt.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			try 
			{
				AndroidRegCon.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
}
