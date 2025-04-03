<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home page</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>
			<a href="signout.jsp">Signout</a>
		</div>
          <ul >
			<li><a href="hospitalfrontend.jsp">My HomePage</a></li>
			<li><a href="aboutblood.jsp">About Blood</a></li>
			<li><a href="searchreg.jsp">Search</a></li>
			<li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
			<li><a href="docarticles.jsp">Doctor Articles</a></li>
		
        </ul>
	</div>
         <div id="content">
		<div id="center">
        <%@page import="java.sql.*"%>
        <%  try {
              String s = (String)session.getAttribute("uname");

     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonordb", "root", "");
     Statement st = conn.createStatement();
     ResultSet r = st.executeQuery("select * from todaysreq");%>
    <form name="hoshome">
            <center><h2>welcome&nbsp;<%=s%></h2></center><br>

<h2 align="center">Todays Posts</h2><br>
<table><tr><th>Date</th><th>PostedBy</th><th>Age</th><th>Address</th><th>PhNo</th><th>BloodGroup</th><th>ReqUnits</th></tr>

     <%while(r.next())
			{
             java.util.Date d=new java.util.Date();
            int currDay=d.getDate();
            int currMonth=d.getMonth()+1;
            int currYear=d.getYear()+1900;
           // out.println(currDay);

           // out.println(currMonth);

          //  out.println(currYear);

            String dbdate=r.getString("date");
            String[] dates=dbdate.split("/");
            int dbday=Integer.parseInt(dates[0]);
            int dbmonth=Integer.parseInt(dates[1]);
            int dbyear=Integer.parseInt(dates[2]);
          if(dbday==currDay && dbmonth==currMonth && dbyear==currYear){
          %>

<tr><td><%=r.getString("date")%></td><td><%=r.getString("name")%></td><td><%=r.getString("age")%></td><td><%=r.getString("address")%></td><td><%=r.getString("phno")%></td><td><%=r.getString("bgrp")%></td><td><%=r.getString("requnits")%></td></tr>

         <%}	}%> </table>
        </form>
         </div>




		<div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>



     <%
}
    catch (Exception e) {
            e.printStackTrace();
            out.println("Error Occured");
        }
     %>
    </body>
</html>