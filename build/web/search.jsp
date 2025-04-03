
<html>
   <head>
       
   <%@ page import="java.sql.*" %>
   <%@ page import="java.lang.*"%>
<title>authenticate page </title>
<link href="style.css" rel="stylesheet" type="text/css" />
   </head>
<body>
    <div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>
			<a href="registration.jsp">Register As Donor!</a>
		</div>
         <ul>
         <li><a href="searchreg.jsp">Back</a></li>
         </ul>
         
	</div>
        <div id="content">

		<div id="center">
    <table border="1" ID="tid">
        <tr><th>DonorName</th><th>Availability</th><th>Gender</th><th>Age</th><th>E-Mail</th><th>Address</th><th>District</th><th>Area</th><th>Zip</th><th>PhNo</th></tr>
<%
	try

{
      
         String district=request.getParameter("d2");
          String bgroup=request.getParameter("d1");
         String area=request.getParameter("t3");
         System.out.println("bgroup="+bgroup+"district="+district+":end");
         Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb","root","root");
           Statement st = conn.createStatement();
          
           String sql="select * from donorprofile where bgroup='"+bgroup+"' and district='"+district+"'";
           System.out.println("hello");
           
       
           ResultSet rs=st.executeQuery(sql);
        while(rs.next())
            {
            int avail=rs.getInt("Availability");
           System.out.println(avail);
            String av="";
            if(avail==0)
                     {           
                av="Unavailable";
                     }
                      
            else
                               {
                               
                av="Available";
                               }
            %>
            
            
                <tr>
                
            <td><%= rs.getString("name") %></td><td><%=av %></td><td><%=rs.getString("gen")%></td><td><%=rs.getString("age")%></td><td><%=rs.getString("email")%></td><td><%=rs.getString("address")%></td><td><%=rs.getString("district")%></td><td><%=rs.getString("area")%></td><td><%=rs.getInt("zip")%></td><td><%=rs.getString("phno") %></td>
</tr>


                   <%



                      
                       }

    }
		catch(SQLException e)
		{
			e.printStackTrace();
             %><%

		}
		catch(Exception e)
		{
			%><%= "other error" %><%
            e.printStackTrace();
		}

%>

</table>
    </div>

		<div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>


    </body>
</html>
