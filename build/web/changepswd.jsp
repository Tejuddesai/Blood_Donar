<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>changepassword</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <style  type="text/css" >
           
            #pass2{
                display:none;
            }
            #secret{
                display:none;
            }

        </style>
        <script type="text/javascript">
           

            

            
            function validate(){
                if(document.fpass.t1.value==""){
                    alert("Current Password cannot be empty");
                }else{
                    document.fpass.method="post";
                    document.fpass.action="passupdate.jsp";
                }
            }
        </script>
    </head>
    <body>
        <!--  <input type="button" value="About Blood" name="b1"/>
            <input type="button" value="Edit Profile" name="b2"/>
            <input type="button" value="Search" name="b3"/>
            <input type="button" value="Home" name="b4"/><br>
           -->
           <div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>
			<a href="signout.jsp">Signout!</a>
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
            <li><a href="hoshome.jsp">My Homepage</a></li>

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
           <!-- <a href="hoshome.jsp">Back</a>
            <li><a href="homepage.jsp">Home</a></li>

			<li><a href="searchreg.jsp">Search</a></li>
			<li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
			<li><a href="todayspostreg1.jsp">Todays Posts</a></li>
			<li><a href="docarticles.jsp">Doctor Articles</a></li> -->
		</ul>
	</div>
    <div id="content">


		<div id="center">
        <%@page import="java.sql.*"%>

        <% try {
             String s = (String)session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb", "root", "root");
            Statement st = conn.createStatement();
            ResultSet r = st.executeQuery("select * from donorprofile where uname='"+s+"';");
            r.next();
            %>
        <form name="fpass"  onsubmit="validate()">
           
            
            <center><h2>change password</h2></center>

            <%if(request.getAttribute("wrongpwd")!=null){%>
                <font color="red">Enter correct password</font>
                <%}%>
            <table>
                
               <tr><TD>CurrentPassword:</TD>
               <TD><input type="password" name="t1"/></TD><td></td></tr>
            </table>
            <table>
                <TR><TD>New Password:</TD><TD> <input type="password" name="t2"/></TD></TR>
                <TR><TD>Confirm Password:</TD><TD><input type="password" name="t3" /></TD></TR>
               </table>
    <input  type = "submit" value = "update" name = "b1" />
        </form>

        </div>
  
     	<div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2009 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
    <%

 } catch (SQLException e) {
     e.printStackTrace();
                   %><%

 } catch (Exception e) {
                   %><%= "other error"%><%
            e.printStackTrace();
        }

                   %>    
    </body>
</html>