<html>
    <head>
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
     ResultSet r = st.executeQuery("select hName,uname from hospitaldetails ");%>
      <form name="f10" action="delete.jsp" method="POST">
      
         
             <table>
                 <tr><th>S.No</th><th>HOSPITALS</th></tr>
                 <%
                 int i=1;
                 while(r.next())
			{
             
 				%>
             <tr><td><%=i++%></td><td><%=r.getString("hName")%></td><td><a href="delete.jsp?hosp=<%=r.getString("hName")%>">delete</a></td></tr>
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