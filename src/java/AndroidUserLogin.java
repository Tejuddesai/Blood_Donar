

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AndroidUserLogin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    
    public AndroidUserLogin() 
    {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Android Login Servlet Started.");
		
		Connection AndroidLoginCon;
		PreparedStatement AndroidLoginPs;
		ResultSet AndroidLoginRs;
		PrintWriter AndroidLoginPW = response.getWriter();
				
		String AndroidLoginUserName = request.getParameter("Username");
		String AndroidLoginPassword = request.getParameter("Password");
						
		System.out.println("In Servlet :: "+AndroidLoginUserName+"~"+AndroidLoginPassword);
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			AndroidLoginCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/BloodDonorDB","root","");
			if(AndroidLoginCon != null)
			{
				System.out.println("Connection Established.");
				
				AndroidLoginPs = AndroidLoginCon.prepareStatement("SELECT * FROM LoginTable where UserName=? and Password=?");
				AndroidLoginPs.setString(1, AndroidLoginUserName);
				AndroidLoginPs.setString(2, AndroidLoginPassword);
												
				AndroidLoginRs = AndroidLoginPs.executeQuery();
											
				if(AndroidLoginRs.next())
				{
					AndroidLoginPW.print("ValidUser");
				}
				else
				{
					AndroidLoginPW.print("InvalidUser");
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
