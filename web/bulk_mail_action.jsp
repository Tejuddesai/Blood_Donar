<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
    <%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>
			 <a href="signout.jsp">SignOut</a>&nbsp; <a href="bulk_mail.jsp">Send Bulk Mail</a>
		</div> <ul>
            <li></li>
          </ul>
          </div>
    <div id="content">


		<div id="center">


 <%

    String selvalues=request.getParameter("sel");

    System.out.print("sel values in action "+selvalues);
    String body=request.getParameter("body");
     System.out.print("body in action "+body);
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb","root","root");

    Statement st=conn.createStatement();
    String svalues[]=selvalues.split(",");

    PreparedStatement pst=conn.prepareStatement("insert into mailmessages values(?,?)");
    
    for(int i=0;i<svalues.length;i++)
        {
        System.out.println("value i "+svalues[i]);
         pst.setString(1,svalues[i]);
         pst.setString(2,body);
         pst.addBatch();
        }
   int j[]=pst.executeBatch();
    
 
       request.setAttribute("mailed","mailed"); %>
       <jsp:forward page="admin.jsp"></jsp:forward>
   <%    
    
 %>
    
    
    </div>
              <div id="footerline"></div>


    </div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
    
    </body>
</html>
