

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AndroidDonorSearch extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public AndroidDonorSearch() 
    {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Android Search Donors Servlet Started.");
		
		Connection AndroidSearchCon;
		Statement AndroidSearchPs;
		ResultSet AndroidSearchRs;
		PrintWriter AndroidSearchPW = response.getWriter();
		String SearchResult = "";
		
		String AndroidSearchBG = request.getParameter("SearchBloodGroup");
		String AndroidSearchDistrict = request.getParameter("SearchDistrict");
		String AndroidSearchArea = request.getParameter("SearchArea");
		String AndroidSearchBloodGroup;
		
		if(AndroidSearchBG.equals("1"))
			AndroidSearchBloodGroup="A+";
		else if(AndroidSearchBG.equals("2"))
			AndroidSearchBloodGroup="A-";
		else if(AndroidSearchBG.equals("3"))
			AndroidSearchBloodGroup="B+";
		else if(AndroidSearchBG.equals("4"))
			AndroidSearchBloodGroup="B-";
		else if(AndroidSearchBG.equals("5"))
			AndroidSearchBloodGroup="O+";
		else if(AndroidSearchBG.equals("6"))
			AndroidSearchBloodGroup="O-";
		else if(AndroidSearchBG.equals("7"))
			AndroidSearchBloodGroup="AB+";
		else
			AndroidSearchBloodGroup="AB-";
		
		
		System.out.println("Search Data Send to Servelet are :: "+AndroidSearchBloodGroup+"~"+AndroidSearchDistrict+"~"+AndroidSearchArea);
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			AndroidSearchCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/BloodDonorDB","root","");
			if(AndroidSearchCon!=null)
			{
				System.out.println("Connection Established.");
				AndroidSearchPs = AndroidSearchCon.createStatement();				
				AndroidSearchRs = AndroidSearchPs.executeQuery("SELECT DonorName,MobileNo FROM blooddonorreg WHERE BloodGroup='"+AndroidSearchBloodGroup+"' AND CurrentDistrict='"+AndroidSearchDistrict+"' AND CurrentArea='"+AndroidSearchArea+"' AND HealthStatus=0 AND Availability=0");
				int i=0;
				while(AndroidSearchRs.next())
				{
					i++;
					System.out.println("Record : "+i);
					String EachRecord = "";
					EachRecord += AndroidSearchRs.getString("DonorName")+" ";
					EachRecord += AndroidSearchRs.getString("MobileNo");
					SearchResult += EachRecord+"~";
				}
				AndroidSearchPW.print(SearchResult);
				System.out.println("The Search Result :: "+SearchResult);
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
