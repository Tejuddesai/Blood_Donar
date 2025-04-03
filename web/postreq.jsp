<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>

<%
   try {
     
       Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonordb", "root", "");
     Statement st = conn.createStatement();

     String bg=request.getParameter("t1");
     String units=request.getParameter("t2");
     String phno=request.getParameter("t3");
     String date=request.getParameter("t4");
     int i = st.executeUpdate("INSERT INTO emergencyreq values('"+bg+"','"+units+"','"+phno+"','"+date+"');");
             %><jsp:forward page="homepage.jsp" /><%
     }
 	catch (Exception e) {
            e.printStackTrace();
            out.println("Error Occured");
        }

        %>