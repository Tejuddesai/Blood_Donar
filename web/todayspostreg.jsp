
<html>
    <head>
       
    </head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>
        <% try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonordb", "root", "root");
     Statement st = conn.createStatement();
     ResultSet r = st.executeQuery("select * from todaysreq");%>

<body>
   <form name="req" method="post" action="todayspost.jsp">
<a href="homepage.jsp">Back</a>
<h4>Todays Requirementss</h4>
<table><tr><th>Date</th><th>PostedBy</th><th>Age</th><th>Address</th><th>PhNo</th><th>BloodGroup</th><th>ReqUnits</th></tr>

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

         <%	}}%> </table>
<h4>Post Requirements</h4>
             <table border="1">
             <tr><td>date:</td><td><input type="text" name="t1" value="" /></td>Enter date in (dd/mm/yyyy) format</tr>
             <tr><td>name:</td><td><input type="text" name="t2" value="" /></td></tr>
             <tr><td>age:</td><td><input type="text" name="t3" value="" /></td></tr>
             <tr><td>address:</td><td><input type="text" name="t4" value="" /></td></tr>
             <tr><td>PhNo:</td><td><input type="text" name="t5" value="" /></td></tr>
             <tr><td>Blood Group:</td><td><input type="text" name="t6" value="" /></td></tr>
             <tr><td>Required Units:</td><td><input type="text" name="t7" value="" /></td></tr>
            </table><br>
              <input type="button"  value="Add" size="4" name="b1"/>
        </form>
        <%
}
    catch (Exception e) {
            e.printStackTrace();
            out.println("Error Occured");
        }
     %>
    </body>
</html>
