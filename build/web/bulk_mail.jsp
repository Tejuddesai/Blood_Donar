<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <%@ page import="java.sql.*" %>



<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bulk Mail</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
    var selectedvalues="";
    function sendMail(){
        
        for(var i=0;i<document.bulk_mail.checkval.length;i++)
	 	 if(document.bulk_mail.checkval[i].checked==true){
	 	   selectedvalues+=document.bulk_mail.checkval[i].value;
	 	   selectedvalues+=',';
	 	 }
     if(selectedvalues==""){
         alert("Select atleast one donor");
     }
     else{document.bulk_mail.selvalues.value=selectedvalues;
     
     document.bulk_mail.method="post";
     document.bulk_mail.action="bulk_mail_form.jsp";
     document.bulk_mail.submit();
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
            <li><a href="admin.jsp">Back</a></li>
          </ul>
          </div>
    <div id="content">


		<div id="center">

	
			<% try{
				//code to display donors
				ResultSet rsDonor = null;
				Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb", "root", "root");
            Statement st = conn.createStatement();
				//build a query to rerieve donor information
				String sql = "select * from user where role='donor'";
				
				rsDonor = st.executeQuery(sql);
				
				//lets traverse through the record set object to display each
				//in a table row
				//before dynamically creating each row... lets create table first
				%>
				<form name="bulk_mail" onsubmit="sendMail()">
				<table width="500" border="1">
					<tr>
						
						<th>User Name</th>
						
						
						
					</tr>
				<%
				int i=0;
				while(rsDonor.next())
				{
					//we are using uid instead of userid as userid is being used for 
					//session variable
					String uid = rsDonor.getString("uname");
					
					
					%>
					<tr align="center">
						<td><%= uid %></td>
						
						<td><input type="checkbox" name="checkval" value="<%= uid %>" /></td>
					</tr>
					<%
					
				}
				%>
				<tr>
					<td colspan="5">
					
						<input type="submit" name="submit" value="Invite" />
					</td>
				</tr>
				</table>
                <input type="hidden" name="selvalues">
                </form>
	
	</div>
              <div id="footerline"></div>


    </div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
</body>
</html>
<%
}catch(Exception e){
    e.printStackTrace();
    }
%>