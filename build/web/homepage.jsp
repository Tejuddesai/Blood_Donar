<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home page</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
       <script type="text/javascript" src="calendarDateInput.js"></script>
          <script language="javascript">
             
  function homeValidate(){
      if(phone == "")
	{

		errorMsg += "\nPHONE: Enter phone no.\n";
	}
	else if(isNaN(phone))
	{

		errorMsg += "\nPHONE: Enter valid phone no.\n";
	}
    if (errorMsg != "")
	{
		alert(errorMsg);
		return false;
	}
	else
	{

		return true;
	}
  }
            function emevalidate()
            {
                 var phone = document.home.t3.value;
                 var ru = document.home.t2.value;
                 var errorMsg="";
                if(document.home.t1.value=="" || document.home.t2.value=="" || document.home.t3.value=="" ||document.home.t4.value==""){
                 alert("Please enter all the details");
                 exit(0);
                } else if(document.home.t1.value=="-1"){
                    alert("Please select a blood group");
                    exit(0);
               }
                if(isNaN(ru)){

                 errorMsg +="\nRequired Units: Enter valid no.\n";

                 }  
               if(isNaN(phone)){

                errorMsg += "\nPHONE: Enter phone no.\n";
                              
               }
               if(phone.length<8){
                    errorMsg += "\nPHONE: Phone no must be valid.\n";
               }
                             
                     if (errorMsg != "")
                        {
                            alert(errorMsg);
                            return false;
                         }
                     else{
                     document.home.method="post";
                     document.home.action="postreq.jsp" ;
                     document.home.submit();
                     }
                }
            
    var digits = "0123456789";
// non-digit characters which are allowed in phone numbers
var phoneNumberDelimiters = "()- ";
// characters which are allowed in international phone numbers
// (a leading + is OK)
var validWorldPhoneChars = phoneNumberDelimiters + "+";
// Minimum no of digits in an international phone no.
var minDigitsInIPhoneNumber = 10;

function isInteger(s)
{   var i;
    for (i = 0; i < s.length; i++)
    {
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}
function trim(s)
{   var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not a whitespace, append to returnString.
    for (i = 0; i < s.length; i++)
    {
        // Check that current character isn't whitespace.
        var c = s.charAt(i);
        if (c != " ") returnString += c;
    }
    return returnString;
}
function stripCharsInBag(s, bag)
{   var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++)
    {
        // Check that current character isn't whitespace.
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function checkInternationalPhone(strPhone){
var bracket=3
strPhone=trim(strPhone)
if(strPhone.indexOf("+")>1) return false
if(strPhone.indexOf("-")!=-1)bracket=bracket+1
if(strPhone.indexOf("(")!=-1 && strPhone.indexOf("(")>bracket)return false
var brchr=strPhone.indexOf("(")
if(strPhone.indexOf("(")!=-1 && strPhone.charAt(brchr+2)!=")")return false
if(strPhone.indexOf("(")==-1 && strPhone.indexOf(")")!=-1)return false
s=stripCharsInBag(strPhone,validWorldPhoneChars);
return (isInteger(s) && s.length >= minDigitsInIPhoneNumber);
}

function ValidateForm(){
	var Phone=document.home.t3.value;

	if ((Phone.value==null)||(Phone.value=="")){
		alert("Please Enter your Phone Number")
		Phone.focus()
		return false
	}
	if (checkInternationalPhone(Phone.value)==false){
		alert("Please Enter a Valid Phone Number")
		Phone.value=""
		Phone.focus()
		return false
	}
	return true
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
            <%if(session.getAttribute("uname")!=null){%>
                <a href="signout.jsp">Sign Out!</a>
<%}else{%>
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
            <li><a href="bbfrontend.jsp">My Homepage</a></li>

            <li><a href="aboutblood.jsp">About Blood</a></li>
            <li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>

                <%}else if(session.getAttribute("role").toString().equals("hos admin")){
                %>
            <li><a href="hospitalfrontend.jsp">My Homepage</a></li>
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
                <%}}else{%>

            <li><a href="searchreg.jsp">Search</a></li>
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
		<div id="left">
			<h1>Welcome to our Website</h1>
    <p>A blood donation is when a healthy person voluntarily has blood drawn. The blood is used for transfusions or made into medications by a process called fractionation.</p>

	<p>In the developed world, most blood donors are unpaid volunteers who give blood for a community supply. In poorer countries, established supplies are limited and donors usually give blood when family or friends need a transfusion. Many donors donate as an act of charity, but some are paid and in some cases there are incentives other than money such as paid time off from work. A donor can also have blood drawn for their own future use. Donating is relatively safe, but some donors have bruising where the needle is inserted or may feel faint.</p>


	<p><b>Donor safety</b><br>
The donor is also examined and asked specific questions about their medical history to make sure that donating blood isn't hazardous to their health. The donor's hematocrit or hemoglobin level is tested to make sure that the loss of blood will not make them anemic, and this check is the most common reason that a donor is ineligible.[23] Pulse, blood pressure, and body temperature are also evaluated. Elderly donors are sometimes also deferred on age alone because of health concerns.[24] The safety of donating blood during pregnancy has not been studied thoroughly and pregnant women are usually deferred.</p>


			<h1>Photos</h1>
			<div id="photos">
			<img src="images/photo1.jpg" alt="photo" />
			<img src="images/photo2.jpg" alt="photo" />
			<img src="images/photo3.jpg" alt="photo" />
			

			</div>
		</div>

		<div id="right"><br>
            <center><h3>Emergency Posts</h3></center>

			<form name="home">




        <% try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonordb", "root", "");
     Statement st = conn.createStatement();
     ResultSet r = st.executeQuery("select * from emergencyreq");%>


<table border="1"><tr><th>Blood Group</th><th>Req Units</th><th>PhNo</th><th>Date</th></tr>

     <%while(r.next()){

         java.util.Date d=new java.util.Date();
            int currDay=d.getDate();
            int currMonth=d.getMonth()+1;
            int currYear=d.getYear()+1900;
           // out.println(currDay);

           // out.println(currMonth);

          //  out.println(currYear);

            String dbdate=r.getString("time");
            if(dbdate!=null){
               if(!dbdate.equals("")){
            String[] dates=dbdate.split("/");
           // String[] time=dbdate.split(",");
            int dbday=Integer.parseInt(dates[0]);
            int dbmonth=Integer.parseInt(dates[1]);
            int dbyear=Integer.parseInt(dates[2]);
            if(dbday==currDay && dbmonth==currMonth && dbyear==currYear){


          %>

<tr><td><%=r.getString("bg")%></td><td><%=r.getString("requnits")%></td><td><%=r.getString("phno")%></td><td><%=r.getString("time")%></td></tr>
<%}}}}%>
          </table>
          <br>
          <br>
<h4>Post Emergency Requirement</h4>
             <table border="1">
                <TR><TD>Blood Group:</TD><TD><select name="t1">
                            <option value="-1">--select--</option>
                            <option value="A+">A+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="A-">A-</option>
                            <option value="B+">B+</option>
                            <option value="A+">B-</option>
                           <option value="AB+">AB+</option>
                           <option value="AB-">AB-</option>
                           <option value="O+">O+</option>
                           <option value="O-">O-</option>
                           </select></TD></TR>
             <tr><td>Required Units:</td><td><input type="text" name="t2" value="" /></td></tr>
             <tr><td>PhNo:</td><td><input type="text" name="t3" value="" /></td></tr>
             <tr><td>Date:</td><td> <script>DateInput('t4', true, 'DD/MM/YYYY')</script></td></tr>
             </table><br>
              <input type="button" value="Add" size="4" name="b1" onClick="emevalidate()"/>
              <br><br><br><br><br>
              <img src="images/logo1.jpg"/>
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
