<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>registration page</title>
         <link href="style.css" rel="stylesheet" type="text/css" />
           <script type="text/javascript" src="docregister_validate.js"></script>
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
           document.getElementById("displayy").innerHTML=req.responseText;
         }
     }
     var url="doctorvalid.jsp?t4="+document.f3.t4.value;
     req.open("GET",url,true);
     req.send(null);
 }
 function blank()
 {
    document.getElementById("displayy").innerHTML="";
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

		</div>
        <ul >
            <li><a href="admin.jsp">Back</a></li>
		</ul>
        </div>
	<div id="content">
		<div id="center">
        <form name="f3" onsubmit="javascript:docRegistrationValidation()" action="doctor.jsp">
           
           <h2 align="center">DOCTORS REGISTRATION</h2>
           <h3>Sign Up</h3>
            
               <table><tr><td>Doctor name:</td><td><input type="text" name="t1" ></td><tr>
           <tr><td>specialization:</td><td><input type="text" name="t2"></td></tr>
            
             <tr><td>Gender :</td><td><select name="d1">
                        <option value="">-Select Gender-</option>
                        <option value="male">male</option>
                        <option value="female">female</option>
             </select></td></tr>
    <tr><td>Address:</td><td><textarea name="m1" rows="4" cols="30"></textarea></td></tr>
            
            
            <tr><td>Zip:</td><td><input type="text" name="t3" value=" "/></td></tr>
           
            <tr><td>User Name</td><td><input type="text" name="t4" onblur="checkUser()" onfocus="blank()"/>
           <span id="displayy"></span></td></tr>
            <tr><td>Password         :</td><td><input type="password" name="t5" /></td></tr>
            <tr><td>Confirm Password :</td><td><input type="password" name="t6"/></td></tr>
            <tr><td>E-Mail           :</td><td><input type="text" name="t7" /></td></tr>

         
           
          
             <tr><td>PhoneNo:</td><td><input type="text" name="t8" value=""/></td></tr>

            <tr><td>Blood Group:</td><td><select name="d2">
                            <option value="B+">B+</option>
                           <option value="B-">B-</option>
                           <option value="A+">AB+</option>
                           <option value="A-">AB-</option>
                           <option value="AB+">O+</option>
                           <option value="AB-">O-</option>
                           <option value="O+">A+</option>
                           <option value="O-">A-</option>
                           </select></td></tr></table>

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