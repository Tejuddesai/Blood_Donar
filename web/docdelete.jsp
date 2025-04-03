<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
         <div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>

		</div>
        <ul >
            <li><a href="doctordel.jsp">Back</a></li>
		</ul>
        </div>
        <div id="content">
		<div id="center">
        <%@page import="java.sql.*" %>
       <h1>Are u sure u want to delete</h1><br><br>
           <%
           String s=request.getParameter("doc");

               session.setAttribute("docname",s);
               String a ="";


               Class.forName("com.mysql.jdbc.Driver");
             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb", "root", "root");
             Statement st = conn.createStatement();
             ResultSet r = st.executeQuery("select uname from doctorprofile where dname='"+s+"'");
             while(r.next())
			{
                a = r.getString("uname");
                session.setAttribute("un",a);
               
 			}

           %>
          <a href="dyes.jsp">YES</a>
          <a href="dno.jsp">NO</a>
 </div>
		<div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>

