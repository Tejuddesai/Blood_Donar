<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
         <link href="style.css" rel="stylesheet" type="text/css" />
        <title>doctors talk</title>
<script language="JavaScript">
    function validateArticle(){
        if(document.f8.title.value=="" || document.f8.a1.value==""){
            alert("\nEnter Title and Content");
            exit(0);
        }
        document.f8.method="post";
        document.f8.action="doctortalk.jsp";
        document.f8.submit();
    }
    </script>
    </head>
    <body bgcolor="lightblue">

        <div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>
			<a href="signout.jsp">Signout</a>
		</div>
         <ul >
			
               
                <li><a href="docedit.jsp">Edit Profile</a></li>
        </ul>
	</div>
    <div id="content">
		<div id="center">


        <center><h2>DOCTORS TALK</h2></center> <br><br>
            

       <%@page import="java.sql.*"%>

        <% try {
        String s = (String)session.getAttribute("uname");
      Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb", "root", "root");
     Statement st = conn.createStatement();
     ResultSet r = st.executeQuery("select * from doctortalk");%>
     <h4>welcome</h4> <%=s%>
     
      <table><tr><th>id</th><th>title</th><th>content</th></tr>
             
     <%while(r.next())
			{

          %>

<tr><td><%=r.getString("doctorid")%></td><td><%=r.getString("articletitle")%></td><td><%=r.getString("content")%></td></tr>
        
         <%	}%> </table>
        <form name="f8" onsubmit="validateArticle()" >

     <h4>Title:</h4>  <input type="text" name="title">
        <h3>post articles</h3>
       <textarea name="a1" rows="10" cols="45"></textarea><br><br>
        <input type="submit" value="Add" size="4" name="b1"/> 
        </form>

                <%
}
    catch (Exception e) {
            e.printStackTrace();
            out.println("Error Occured");
        }
     %>
     </div>




		<div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
  
    </body>
</html>
