
<html>
    <head>
        <script type="text/javascript" src="calendarDateInput.js"></script>
       <link href="style.css" rel="stylesheet" type="text/css" />
       <script language="JavaScript" >
           function validate(){

           var errorMsg="";
           	var name=document.req.t2.value;
            var namecheck = new RegExp("^[a-zA-Z]+$","g");

	if(name == "")
	{
		errorMsg += "\nNAME: Provide your first name\n";
	}

	else if(name.length<3 || name.length >30)
	{

		errorMsg += "\nNAME: Name lenght MAX 30 MIN 3 Chars\n";
	}

	else if(!name.match(namecheck))
	{

		errorMsg += "\nNAME: Your name should not contain any special characters\n";

	}
    var phone = document.req.t5.value;
	if(phone == "")
	{

		errorMsg += "\nPHONE: Enter phone no.\n";
	}
	else if(isNaN(phone))
	{

		errorMsg += "\nPHONE: Enter valid phone no.\n";
	}

    var address = document.req.t4.value;
	if(address == "")
	{

		errorMsg += "\nADDRESS: Enter address\n";
	}
     var ru = document.req.t7.value;
	if(isNaN(ru)){

                 errorMsg +="\nRequired Units: Enter valid no.\n";

                 }
      var age = document.req.t3.value;
	if(isNaN(age)){

                 errorMsg +="\nAge: Enter valid age.\n";

                 }

          if(document.req.t1.value=="" || document.req.t3.value=="" || document.req.t6.value=="" || document.req.t7.value=="" || document.req.t5.value==""){
          alert(" please enter all the details Properly");
          exit(0);
          }
          
          else{
              if(!errorMsg == ""){
               alert(errorMsg);
               return false;
              }else{
              document.req.method="post";
              document.req.action="todayspost.jsp";
              document.req.submit();
              }
          }
            }
   </script>

    </head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.sql.*"%>
        <% try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb", "root", "root");
     Statement st = conn.createStatement();
     ResultSet r = st.executeQuery("select * from todaysreq");%>

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
            <li><a href="homepage.jsp">Home</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="aboutblood.jsp">AboutBlood</a></li>
            <li><a href="searchreg.jsp">Search</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
			<li><a href="blood.jsp">Todays Posts</a></li>
			<li><a href="docarticles.jsp">Doctor Articles</a></li>
		</ul>
	</div>

  
    <div id="content">

		<div id="center">
    <form name="req" onsubmit="javascript:validate()">

<h4>Todays Requirements</h4>
<table border="1" id="tid"><tr><th>Date</th><th>PostedBy</th><th>Age</th><th>Address</th><th>PhNo</th><th>BloodGroup</th><th>ReqUnits</th></tr>

     <%while(r.next())
			{

            java.util.Date d=new java.util.Date();
            int currDay=d.getDate();
            int currMonth=d.getMonth()+1;
            int currYear=d.getYear()+1900;
           // out.println(currDay);

           // out.println(currMonth);

          //  out.println(currYear);

            String dbdate=r.getString("date");
            String[] dates=dbdate.split("/");
            int dbday=Integer.parseInt(dates[0]);
            int dbmonth=Integer.parseInt(dates[1]);
            int dbyear=Integer.parseInt(dates[2]);
          if(dbday==currDay && dbmonth==currMonth && dbyear==currYear){
          %>

<tr><td><%=r.getString("date")%></td><td><%=r.getString("name")%></td><td><%=r.getString("age")%></td><td><%=r.getString("address")%></td><td><%=r.getString("phno")%></td><td><%=r.getString("bgrp")%></td><td><%=r.getString("requnits")%></td></tr>

         <%	}}%> </table><br>
<h4>Post Requirements</h4>
             <table border="1">
             <tr><td>date:</td><td><script>DateInput('t1', true, 'DD/MM/YYYY')</script></td></tr>
             <tr><td>name:</td><td><input type="text" name="t2" value="" /></td></tr>
             <tr><td>age:</td><td><input type="text" name="t3" value="" /></td></tr>
             <tr><td>address:</td><td><input type="text" name="t4" value="" /></td></tr>
             <tr><td>PhNo:</td><td><input type="text" name="t5" value="" /></td></tr>
              <tr><td>Blood Group:</td><td><select name="t6">
                            <option value="">--select--</option>
                            <option value="A+">A+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="A-">A-</option>
                            <option value="B+">B+</option>
                            <option value="A+">B-</option>
                           <option value="AB+">AB+</option>
                           <option value="AB-">AB-</option>
                           <option value="O+">O+</option>
                           <option value="O-">O-</option>
                           </select></td></tr>
             <tr><td>Required Units:</td><td><input type="text" name="t7" value="" /></td></tr>
            </table><br>
              <input type="button" onclick="javascript:validate()" value="Add" size="4" name="b1"/>
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
