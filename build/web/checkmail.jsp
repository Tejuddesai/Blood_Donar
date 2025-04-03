<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <%@page import="java.sql.*"%>
    <body>
<div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>
			 <a href="signout.jsp">SignOut</a>&nbsp; <a href="bulk_mail.jsp">Send Bulk Mail</a>
		</div> <ul>
            <li><a href="donorhome.jsp">Back</a></li>
          </ul>
          </div>
    <div id="content">


		<div id="center">
    <%
    String uname="svalues";
     if(session.getAttribute("uname")!=null){
       uname=session.getAttribute("uname").toString();
       }
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb","root","root");

    Statement st=conn.createStatement();
    ResultSet rs=st.executeQuery("select body from mailmessages where svalues='"+uname+"'");


    while(rs.next())
    { 
    %>
    <h2>Messages for you </h2>
    <table border="1">
        <tr><td><b>Message</b></td></tr>
        <tr><td><%=rs.getString(1)%></td></tr>
    </table>
     <%   }  
    %>
    
    
     </div>
              <div id="footerline"></div>


    </div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
    
    </body>
</html>
