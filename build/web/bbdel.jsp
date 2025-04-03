<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body bgcolor="lightblue">
        <div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>

		</div>
        <ul >
            <li><a href="admin.jsp">Back</a></li>
		</ul>
        </div>
        <div id="content">
		<div id="center">
<%@page import="java.sql.*"%>

        <% try {
      String a = "";
            Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb", "root", "root");
     Statement st = conn.createStatement();
     System.out.println("hello");
     ResultSet r = st.executeQuery("select bbname,uname from bloodbankdetails ");%>
      <form name="f10" action="bbdelete.jsp" method="POST">


             <table>
                 <tr><th>S.No</th><th>BloodBanks</th></tr>
                 <%
                 int i=1;
                 while(r.next())
			{
                     
 				%>
                <tr><td><%=(i++)%></td><td><%=r.getString("bbname")%></td><td><a href="bbdelete.jsp?bb=<%=r.getString("bbname")%>">delete</a></td></tr>
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
 </form>
  </div>
		<div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
</body>

</html>
