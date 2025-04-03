<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>search</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>
            <%if(session.getAttribute("role")!=null){%>
			 <a href="signout.jsp">Sign Out</a>
                    <% }else{%>
        <a href="registration.jsp">Register As Donor!</a>
                    <%}%>
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
		</ul>
	</div>
	
<div id="content">
	<div id="center">
	
<form name="f6" action="search.jsp" method="post" onSubmit="if(document.f6.d1.value=='' || document.f6.d2.value==''){alert('select data'); return false;}" >
             <center><h1>Search For Donor</h1></center>
             <div id="id1" align="center">
            <table name="t1" align="center" >
                <tr><td>Select blood group:</td><td><select name="d1">
                            <option value="">--Select Group--</option>
                            <option value="A+">A+</option>
                            <option value="A-">A-</option>
                            <option value="B+">B+</option>
                            <option value="B-">B-</option>
                            <option value="AB+">AB+</option>
                            <option value="AB-">AB-</option>
                            <option value="O+">O+</option>
                            <option value="O-">O-</option>
                </select></td></tr>


                <tr>
					<td>Select District:</td>
					<td>
						<select name="d2">
							<option value="">--Select--</option>
							<option value="Adilabad">Adilabad</option>
							<option value="Ananthapur">Ananthapur</option>
							<option value="Chithur">Chithur</option>
							<option value="East Godavari">East Godavari</option>
							<option value="Guntur">Guntur</option>
							<option value="Hyderabad">Hyderabad</option>
							<option value="Kadapa">Kadapa</option>
							<option value="Karimnagar">Karimnagar</option>
							<option value="Khammam">Khammam</option>
							<option value="Krishna">Krishna</option>
							<option value="Kurnool">Kurnool</option>
							<option value="Mehbubnagar">Mehbubnagar</option>
							<option value="Medak">Medak</option>
							<option value="Nalgonda">Nalgonda</option>
							<option value="Nellore">Nellore</option>
							<option value="Nizamabad">Nizamabad</option>
							<option value="Prakasham">Prakasham</option>
							<option value="Rangareddi">Rangareddi</option>
							<option value="Srikakulam">Srikakulam</option>
							<option value="Vishakapatnam">Vishakapatnam</option>
							<option value="Warangal">Warangal</option>
							<option value="West Godavari">West Godavari</option>
						</select>
					</td>
				</tr>
           </table>
             <br>
             <input type="submit" value="search>>" name="s1"/>
             </div>
             <br><br>
            



        </form>
			
		</div>

		

		<div id="footerline"></div>
	
</div>
	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
       
    </body>
</html>