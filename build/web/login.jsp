<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script language="javascript">
            function loginvalidate()
            {
                if(document.f2.t1.value=="" || document.f2.t2.value==""){
                 alert("enter usrname and pwd");
                 exit(0);
                }else{

                     document.f2.method="post";
                    document.f2.action="validation.jsp";
                    document.f2.submit();
                }
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
		<ul >
            <li><a href="homepage.jsp">Home</a></li>
			<li><a href="aboutblood.jsp">About Blood</a></li>
			<li><a href="searchreg.jsp">Search</a></li>
			<li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
			<li><a href="todayspostreg1.jsp">Todays Posts</a></li>
			<li><a href="docarticles.jsp">Doctor Articles</a></li>
		</ul>
	</div>
	<div id="content">
		<div id="center">
			<form name="f2">
         <br>
             <br>
                 <br>
                      <%if(request.getAttribute("regsuccess")!=null){%>
       <font color="green">you are successfully registered!please login</font>
           <%}%>

         <center> USERNAME:&nbsp;<input type="text" name="t1" /><br><br>
          PASSWORD:&nbsp;<input type="password" name="t2" /><br><br><br>
         <input type="button" onclick="javascript:loginvalidate()" value="LOGIN" name="s1" />
         <input type="reset" value="reset"></center>
       </form>
       <% if(request.getAttribute("wronguid")!=null){ %>
      <center> <font color="red">Wrong Username,please check!</font></center>
           <%}%>
           <%if(request.getAttribute("wrongpwd")!=null){%>
      <center> <font color="red">Wrong Password,please check!</font></center>
           <%}%>
            <%if(request.getAttribute("wrgpwd")!=null){%>
      <center> <font color="red">Wrong Password,please check!</font></center>
           <%}%>
		</div>
		<div id="footerline"></div>
	</div>
	<div id="footer">Copyright © 2011 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
        
       
   </body>
</html>