<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>registration page</title>
          <link href="style.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="bbregister_validate.js"></script>
         <script type="text/javascript">
//function checkUser()
//{
//    var req;
//    try
//    {
//        req=new XMLHttpRequest();
//
//    }
//        catch(e)
//        {
//            try
//            {
//
//             req=new ActiveX0bject("msxml2.XMLHttp");
//             }
//             catch(e)
//             {
//                 try{
//                     req=new ActiveX0bject("MicrosoftXMLHttp");
//                 }
//                 catch(e){
//                 alert("browser doesn't recognise ajax");
//                 return false;
//             }
//             }
//           }
//     req.onreadystatechange=function()
//     {
//         if(req.readyState==4)
//         {
//           document.getElementById("display").innerHTML=req.responseText;
//         }
//     }
//     var url="bbvalid.jsp?t3="+document.f4.t3.value;
//     req.open("GET",url,true);
//     req.send(null);
// }
// function blank()
// {
//    document.getElementById("display").innerHTML="";
// }
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
        <form name="f4" onsubmit="bbRegistrationValidation()" action="bb.jsp">
         
            <center><h2> BLOODBANK REGISTRATION</h2></center>
            <h2>Sign Up</h2>
            <table>
                <tr><td><font color="white">BloodBank name:</font></td><td><input type="text" name="t1" value="" /></td></tr>

                <tr><td><font color="white">Address:</font></td><td><textarea name="m1" rows="4" cols="30"></textarea></td></tr>
                
           
       
            
                <tr><td><font color="white">Zip:</font></td><td><input type="text" name="t2" value=" "/></td></tr>
                <tr><td><font color="white">User Name</font></label></td><td><input type="text" name="t3"/></td></tr>
                
<tr><td><font color="white">Password:</font></td><td><input type="password" name="t4" /></td></tr>
<tr><td><font color="white">Confirm Password:</font></td><td><input type="password" name="t5" /></td></tr>
<tr><td><font color="white">E-Mail:</font></td><td><input type="text" name="t6" /></td></tr>

<tr><td><font color="white">PhoneNo:</font></td><td><input type="text" name="t7" value=""/></td></tr>
<tr><td><font color="white">District:</font></td><td><select name="d3">
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
					</select></td></tr>
                                      
                            
                           
<tr><td><font color="white">Area:</font></td><td><input type="text" name="d4"></td></tr>
            
                <tr><td><input type="submit" name="s1" value="create account" /></td></tr>
           
        </form>
        </div>



<!--<div id="footerline">
    
</div>-->
</div>

<!--	<div id="footer"> </div>-->
</div>

    </body>
</html>
