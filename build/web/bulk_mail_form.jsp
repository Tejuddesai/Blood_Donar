<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%

String selvalues=request.getParameter("selvalues");

System.out.println("sel values in jsp "+selvalues);
request.setAttribute("selvalues", selvalues);

	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bulk Mail</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
    function validateMail(){
       
        if(document.invite.body.value==""){
            alert("Message body cannot be empty!");
            exit(0);
        }
       else{
           document.invite.method="post";
           document.invite.action="bulk_mail_action.jsp";
           document.invite.submit();
       }
    }

</script>
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
            <li><a href="bulk_mail.jsp">Back</a></li>
          </ul>
          </div>
    <div id="content">


		<div id="center">

	
		<td width="400"><!-- content -->
			<form name="invite" onsubmit="validateMail()">
			
			<table>
				
				<tr>
					<td>Mail:</td>
					<td><textarea name="body"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" name="submit" value="Send Mail" /></td>
				</tr>
			</table>
            <input type="hidden" name="sel" value="<%=selvalues%>">
			</form>
        </div>
              <div id="footerline"></div>
    

    </div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>

	
</body>
</html>
