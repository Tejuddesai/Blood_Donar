
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
 
<%
   try {
      String s = (String)session.getAttribute("uname");
       Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb", "root", "root");
     Statement st = conn.createStatement();
      
     String content=request.getParameter("a1");
     String title=request.getParameter("title");
     int i = st.executeUpdate("INSERT INTO doctortalk values('"+s+"','"+title+"','"+content+"');");
             %><jsp:forward page="doctorstalkreg.jsp" /><%
     }
 	catch (Exception e) {
            e.printStackTrace();
            out.println("Error Occured");
        }

        %>