<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
     <%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
               <link href="style.css" rel="stylesheet" type="text/css" />
        <title>bb front-end</title>
  <style type="text/css">
            #edit1,#edit2,#edit3,#edit4,#edit5,#edit6,#edit7,#edit8,#edit9{
                display:none;
            }
            #dis1,#dis2,#dis3,#dis4,#dis5,#dis6,#dis7,#dis8{
                display:block;
            }
        </style>
        <script type="text/javascript">
            function edit(){

                <%
                for(int i=1;i<10;i++){%>
                        document.getElementById("dis<%=i%>").style.display="none";

                <%}%>

                <%
                for(int i=1;i<10;i++){%>
                        document.getElementById("edit<%=i%>").style.display="block";

                <%}%>
            }

            function edit2(){
                <%
                for(int i=1;i<10;i++){%>
                        document.getElementById("dis<%=i%>").style.display="block";

                <%}%>

                <%
                for(int i=1;i<10;i++){%>
                        document.getElementById("edit<%=i%>").style.display="none";

                <%}%>
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
			<a href="registration.jsp">Register As Donor!</a>
		</div>

        <ul>
         <li><a href="hoshome.jsp">Back</a></li>
        <li><a href="hosedit.jsp">Edit Profile</a></li>
          
        </ul>
        

</div>
       <div id="content">

		<div id="center">
        <% try {
      String s=(String)session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonordb", "root", "");
     Statement st = conn.createStatement();
     ResultSet r = st.executeQuery("select * from hospitaldetails where uname='"+s+"'");%>
     <form name="f9" action="hospitalupdate.jsp" method="POST">
       
      <%while(r.next())
			{
 				%>

             <table>
                 <tr><th>S.No</th><th>Blood Groups</th><th>Available Units</th></tr>
             <tr><td>1</td><td>O+</td><td><span id="dis1"><%=r.getString("Opos")%></span><input type="text" name="Opos" id="edit1" size="1" value="<%=r.getString("Opos")%>"/></td></tr>
             <tr><td>2</td><td>O-</td><td><span id="dis2"><%=r.getString("Oneg")%></span><input type="text" name="Oneg" id="edit2" size="1" value="<%=r.getString("Oneg")%>"/></td></tr>
             <tr><td>3</td><td>A+</td><td><span id="dis3"><%=r.getString("Apos")%></span><input type="text" name="Apos" id="edit3" size="1" value="<%=r.getString("Apos")%>"/></td></tr>
             <tr><td>4</td><td>A-</td><td><span id="dis4"><%=r.getString("Aneg")%></span><input type="text" name="Aneg" id="edit4" size="1" value="<%=r.getString("Aneg")%>"/></td></tr>
            <tr><td>5</td><td>AB+</td><td><span id="dis5"><%=r.getString("ABpos")%></span><input type="text" name="ABpos" id="edit5" size="1" value="<%=r.getString("ABpos")%>"/></td></tr>
             <tr><td>6</td><td>AB-</td><td><span id="dis6"><%=r.getString("ABneg")%></span><input type="text" name="ABneg" id="edit6" size="1" value="<%=r.getString("ABneg")%>"/></td></tr>
             <tr><td>7</td><td>B+</td><td><span id="dis7"><%=r.getString("Bpos")%></span><input type="text" name="Bpos" id="edit7" size="1" value="<%=r.getString("Bpos")%>"/></td></tr>
             <tr><td>8</td><td>B-</td><td><span id="dis8"><%=r.getString("Bneg")%></span><input type="text" name="Bneg" id="edit8" size="1" value="<%=r.getString("Bneg")%>"/></td></tr>
            </table>
            <%}%>

<input type="button" value="edit"  name="b1" id="dis9" onclick="edit()"/>
         <input type="submit" value="update2" name="b2" id="edit9" onclick="edit2()"/>
         </form>
   
</div>

		<div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>

            <br />

		<%	
}
    catch(Exception e) {
            e.printStackTrace();
            out.println("Error Occured");
        }
     %>
  </body>
    
</html>
