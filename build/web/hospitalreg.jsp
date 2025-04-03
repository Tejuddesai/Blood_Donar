<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>registration page</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="register_validateHos.js"></script>
         <script type="text/javascript">
function checkUser()
{
    var req;
    try
    {
        req=new XMLHttpRequest();

    }
        catch(e)
        {
            try
            {

             req=new ActiveX0bject("msxml2.XMLHttp");
             }
             catch(e)
             {
                 try{
                     req=new ActiveX0bject("MicrosoftXMLHttp");
                 }
                 catch(e){
                 alert("browser doesn't recognise ajax");
                 return false;
             }
             }
           }
     req.onreadystatechange=function()
     {
         if(req.readyState==4)
         {
           document.getElementById("display").innerHTML=req.responseText;
         }
     }
     var url="hospitalvalid.jsp?t3="+document.f5.t3.value;
     req.open("GET",url,true);
     req.send(null);
 }
 function blank()
 {
    document.getElementById("display").innerHTML="";
 }
 </script>

    </head>
    <body bgcolor="lightblue">
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

		</div>
        <ul >
            <li><a href="admin.jsp">Back</a></li>
		</ul>
        </div>
        <div id="content">
		<div id="center">
        <form name="f5" onsubmit="HosRegistrationValidation()" action="hospital.jsp">
            
           <h2 align="center">HOSPITAL REGISTRATION</h2>
            <h3>sign up</h3>
             <p>
                Hospital Name:&nbsp;<input type="text" name="t1" value="" /><br></p>

            <p>Address:&nbsp;<textarea name="m1" rows="4" cols="30">
                               </textarea><br>
            </p>

            <p>
            Zip:&nbsp;<input type="text" name="t2" value=""/><br>
            </p>
            <label for="t3">User Name</label>:&nbsp;<input type="text" name="t3" onblur="checkUser()" onSelect="blank()"/><span id="display"></span><br><br>
            Password         :&nbsp;<input type="password" name="t4" /><br><br>
            Confirm Password :&nbsp;<input type="password" name="t5" /><br><br>
            E-Mail           :&nbsp;<input type="text" name="t6" /><br><br>



<p>
            PhoneNo:&nbsp;<input type="text" name="t7" value=""/><br></p>


           
                 
          
<p>
             District:<select name="d3">
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

			
                            </p>
                            <p>
            Area:<input type="text" name="d4"><br>
            <br></p>
            <p><input type="submit" name="s1" value="create account" />
            </p>
        </form>
        </div>
        <div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
    </body>
</html>
