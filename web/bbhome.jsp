<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>bb front-end</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
            #edit1,#edit2,#edit3,#edit4,#edit5,#edit6,#edit7,#edit8,#edit9{
                display:none;
            }
            #dis1,#dis2,#dis3,#dis4,#dis5,#dis6,#dis7,#dis8{
                display:block;
            }
        </style>

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

             <%if(session.getAttribute("role")!=null){
            if(session.getAttribute("role").toString().equals("admin")){
                %>
                <li><a href="bbreg.jsp">Add BloodBank</a></li>
            <li><a href="bbdel.jsp">Delete BloodBank</a></li>
            <li><a href="hospitalreg.jsp">Add Hospital</a></li>
			<li><a href="hospitaldel.jsp">Delete Hospital</a></li>
            <li><a href="docreg.jsp">Add Doctor</a></li>
			<li><a href="doctordel.jsp">Delete Doctor</a></li>

                <%}

           else if(session.getAttribute("role").toString().equals("bb admin")){
                %>
            <li><a href="bloodbankhome.jsp">My Homepage</a></li>

            <li><a href="aboutblood.jsp">About Blood</a></li>
            <li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>

                <%}else if(session.getAttribute("role").toString().equals("hos admin")){
                %>
            <li><a href="hoshome.jsp">Back</a></li>
            <li><a href="aboutblood.jsp">About Blood</a></li>
            <li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
             <%}
             else if(session.getAttribute("role").toString().equals("donor")){
                %>
            <li><a href="donorhome.jsp">My Homepage</a></li>
            <li><a href="aboutblood.jsp">About Blood</a></li>
            <li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
             <li><a href="searchreg.jsp">Search</a></li>
              <%}
             else if(session.getAttribute("role").toString().equals("doctor")){
                %>
              <li><a href="doctorstalkreg.jsp">Back</a></li>
            <li><a href="aboutblood.jsp">About Blood</a></li>
            <li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
             <li><a href="searchreg.jsp">Search</a></li>
                <%}}else{%>

            <li><a href="homepage.jsp">Home</a></li>
			<li><a href="login.jsp">Login</a></li>
			<li><a href="aboutblood.jsp">About Blood</a></li>
            <li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
			<li><a href="todayspostreg1.jsp">Todays Posts</a></li>
			<li><a href="docarticles.jsp">Doctor Articles</a></li>
            <%}%>
            
          <!--  <li><a href="homepage.jsp">Home</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="aboutblood.jsp">AboutBlood</a></li>
            <li><a href="searchreg.jsp">Search</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
			<li><a href="todayspostreg1.jsp">Todays Posts</a></li>
			<li><a href="docarticles.jsp">Doctor Articles</a></li> -->
		</ul>
	</div>
        <div id="content">

		<div id="center">
                        <%@page import="java.sql.*"%>

          <%
          try {
            String s=(String)session.getAttribute("uname");
      Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb", "root", "root");
     Statement st = conn.createStatement();
     ResultSet r = st.executeQuery("select * from bloodbankdetails");%>
      <form name="bbdisplay" >
           <center><h1>BLOODBANK DETAILS</h1></center>
      <%while(r.next())
			{

          %>
           <table>
          <tr><td> <b>Name:</b></td>&nbsp;<td><%=r.getString("bbname")%></td></tr>
           <tr><td><b>Address</b>:</td>&nbsp;<td><%=r.getString("address")%></td></tr>
           <tr><td><b>Zip:</b></td><td>&nbsp;<%=r.getString("zip")%></td></tr>
           <tr><td><b>E-Mail:</b></td>&nbsp;<td><%=r.getString("email")%></td></tr>
           <tr><td><b>PhNo:</b></td>&nbsp;<td><%=r.getString("phno")%></td></tr>
                
              <tr><th>S.No</th><th>Blood Groups</th><th>Available Units</th></tr>
             <tr><td>1</td><td>O+</td><td><span id="dis1"><%=r.getString("Opos")%></span><input type="text" name="Opos" id="edit1" size="1" value="<%=r.getString("Opos")%>"/></td></tr>
             <tr><td>2</td><td>O-</td><td><span id="dis2"><%=r.getString("Oneg")%></span><input type="text" name="Oneg" id="edit2" size="1" value="<%=r.getString("Oneg")%>"/></td></tr>
             <tr><td>3</td><td>A+</td><td><span id="dis3"><%=r.getString("Apos")%></span><input type="text" name="Apos" id="edit3" size="1" value="<%=r.getString("Apos")%>"/></td></tr>
             <tr><td>4</td><td>A-</td><td><span id="dis4"><%=r.getString("Aneg")%></span><input type="text" name="Aneg" id="edit4" size="1" value="<%=r.getString("Aneg")%>"/></td></tr>
            <tr><td>5</td><td>AB+</td><td><span id="dis5"><%=r.getString("ABpos")%></span><input type="text" name="ABpos" id="edit5" size="1" value="<%=r.getString("ABpos")%>"/></td></tr>
             <tr><td>6</td><td>AB-</td><td><span id="dis6"><%=r.getString("ABneg")%></span><input type="text" name="ABneg" id="edit6" size="1" value="<%=r.getString("ABneg")%>"/></td></tr>
             <tr><td>7</td><td>B+</td><td><span id="dis7"><%=r.getString("Bpos")%></span><input type="text" name="Bpos" id="edit7" size="1" value="<%=r.getString("Bpos")%>"/></td></tr>
             <tr><td>8</td><td>B-</td><td><span id="dis8"><%=r.getString("Bneg")%></span><input type="text" name="Bneg" id="edit8" size="1" value="<%=r.getString("Bneg")%>"/></td></tr>
             <%}%>
            </table>
            </form>
</div>

		<div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>




           
		<%	
}
    catch (Exception e) {
            e.printStackTrace();
            out.println("Error Occured");
        }
     %>

    </body>
</html>
