
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
			 <a href="signout.jsp">SignOut</a>&nbsp;<a href="bulk_mail.jsp">Send Bulk Mail</a>
        
        <ul>
            <li><a href="bbreg.jsp">Add BloodBank</a></li>
            <li><a href="bbdel.jsp">Delete BloodBank</a></li>
            <li><a href="hospitalreg.jsp">Add Hospital</a></li>
			<li><a href="hospitaldel.jsp">Delete Hospital</a></li>
            <li><a href="docreg.jsp">Add Doctor</a></li>
			<li><a href="doctordel.jsp">Delete Doctor</a></li>

	
		</ul>
	</div>
    <div id="content">


		<div id="center">

        <center><h1>welcome Admin!</h1></center>
        
        <%if(request.getAttribute("bbadded")!=null){ %>
           Blood bank added successfully!
       <%}%>
        <%if(request.getAttribute("hosadded")!=null){ %>
           Hospital added successfully!
       <%}%>
        <%if(request.getAttribute("docadded")!=null){ %>
           Doctor added successfully!
       <%}%>
        <%if(request.getAttribute("mailed")!=null){ %>
           Mail sent successfully!
       <%}%>
        </div>
        <div id="footerline"></div>
    </div>
		
	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
</div>

    </body>
</html>

