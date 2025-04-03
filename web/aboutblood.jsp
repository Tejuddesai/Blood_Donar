
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title> ABOUT BLOOD</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="lightblue">

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

          <!--   <li><a href="homepage.jsp">Home</a></li>
			
			<li><a href="searchreg.jsp">Search</a></li>
			<li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
			<li><a href="todayspostreg1.jsp">Todays Posts</a></li>
			<li><a href="docarticles.jsp">Doctor Articles</a></li> -->
		</ul>
	</div>
	<div id="content">
		

		<div id="center">
          <center>  <h2>About Blood</h2></center>
			<p>Blood is the river of life that flows through the human body. We cannot live without it. The heart pumps blood to all our body cells, supplying them with oxygen and food. At the same time, blood carries carbon dioxide and other waste products from the cells. Blood also fights infection, keeps our temperature steady, and carries chemicals that regulate many body functions. Finally, blood even has substances that plug broken blood vessels and so prevent us from bleeding to death.

            The amount of blood in our body depends on our size and the altitude at which we live. An adult who weighs 160 pounds (73 kilograms) has about 5 quarts (4.7 liters) of blood. An 80-pound (36-kilogram) child has about half that amount, and an 8-pound (3.6-kilogram) infant has about 81/2 ounces (250 milliliters). People, who live at high altitudes, where the air contains less oxygen, may have upto 2 quarts (1.9 liters) more blood than people who live in low regions.</p>
<font color="red">THE COMPOSITION OF BLOOD</font><BR><BR>
Blood consists of cells that move about in a watery liquid called Plasma.<BR> Three types of cells make up the formed elements::<BR>
(1) Blood Drop<BR>
(2) Red Blood Cells<BR>
(3) White Blood Cells<BR>
(4) Platelets<BR>

AA microliter (1/30,000 of an ounce) of blood normally contains about 4 million to 6 million red blood cells, <BR>5,000 to 10,000 white blood cells, and 150,000 to 500,000 platelets.<BR> The red and white blood cells are also called Corpuscles.

plasma<BR>
Plasma is the liquid, straw-colored part of blood.  It makes up about 50 to 60 per cent of the total volume of blood.

Red blood cells<BR>
Red blood cells, also called erythrocytes, carry oxygen to body tissues and remove carbon dioxide.

White blood cells <BR>
White blood cells, also called leukocytes, fight infections and harmful substances that invade the body.

Platelets<BR>
Platelets, also known as thrombocytes, are disk like structures that help stop bleeding.<BR><BR>

<font color="red">What blood does in the body?</font><BR><BR>
The major jobs of blood are to transport oxygen and nutrients to body tissues and to remove wastes.<BR> To accomplish those tasks, blood must flow to all parts of the body. It does so by means of our circulatory system, <BR>which consists of the heart, a vast network of blood vessels, and the blood itself. It does a variety of jobs in the body such as-

    * Carrying oxygen &amp; carbon dioxide<BR>
    * Transporting nutrients &amp; wastes<BR>
    * Protecting against disease<BR>
    * Carrying hormones<BR>
    * Distributing body heat<BR><BR>


<font color="red">How the body maintains its blood supply?</font><BR><BR>
We cannot live without a proper supply of healthy blood. In addition, the amounts of the various blood components (parts) must<BR> change constantly as the needs of our body change. Our body maintains Blood Dropits blood supply by:<BR>


    * Regulating the volume of blood components<BR>
    * Controlling bleeding<BR>
    * Replacing worn-out blood components<BR><BR>


<font color="red">BLOOD GROUPS</font><BR><BR>
The membranes of red blood cells contain proteins called antigens.  More than 300 red-cell antigens have been identified.<BR>  Based on the presence or absence of particular antigens, scientists have classified human blood into various groups.A, B &amp; O<BR><BR>

<font color="red">The Rh blood types</font><BR><BR>
Rh blood types form the second major blood-group system.  People who have Rh antigens on their red blood cells are Rh positive.  The antigen itself is called the Rh factor.  People who lack the factor are Rh negative.  Most people are Rh positive.<BR><BR>

<font color="red">Blood transfusion</font><BR><BR>
Blood transfusion is the transfer of whole blood or blood components into a person's bloodstream. People who lose large amounts of blood in accidents, during surgery or due to some illnesses often need blood transfusions.  Blood Transfusion is a safe and effective medical procedure that saves many lives.

Blood Drop After donating blood the donor (if properly selected) does not feel any weakness and the donated amount of blood is replaced with in 24 hours to one week. Blood donation can be repeated safely after 2 to 3 months.

Most people need only some parts of blood in a transfusion.  For example, in a disease called hemophilia, blood does not clot normally. A person with hemophilia can receive a transfusion of clotting factors, the plasma proteins that cause blood to clot.  Another person can receive a transfusion of red blood cells from the same unit of blood.

		</div>

		<div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>


  


</body>
</html>
