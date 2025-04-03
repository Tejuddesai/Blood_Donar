<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <%@ page import="java.sql.*" %>
   <title>authenticate page</title>
    </head>
<body>
<%
	try
		{
             String bbname=request.getParameter("t1");
             String address=request.getParameter("m1");
             String zip=request.getParameter("t2");
             String  uname=request.getParameter("t3");

         String pwd=request.getParameter("t4");
            
             String email=request.getParameter("t6");
              
               
              String phno=request.getParameter("t7");
              String Opos=request.getParameter("c1");
              String Oneg=request.getParameter("c2");
              String Apos=request.getParameter("c3");
              String Aneg=request.getParameter("c4");
              String ABpos=request.getParameter("c5");
              String ABneg=request.getParameter("c6");
              String Bpos=request.getParameter("c7");
              String Bneg=request.getParameter("c8");
                 
             String district=request.getParameter("d3");
              String area=request.getParameter("d4");
                   

			Class.forName("com.mysql.jdbc.Driver");
             
            		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb","root","root");
                    
            Statement st=conn.createStatement();
            
         //int i= st.executeUpdate("create table bloodbank(uname varchar(20),psw varchar(10), bbname VARCHAR(20),email VARCHAR(40),address VARCHAR(250),zip INT,phno VARCHAR(20),O+ VARCHAR(5),O- VARCHAR(5),A+ VARCHAR(5),A- VARCHAR(5),AB+ VARCHAR(5),AB- VARCHAR(5),B+ VARCHAR(5),B- VARCHAR(5),country VARCHAR(15),state VARCHAR(15),city VARCHAR(10),area VARCHAR(10));");

        int j=st.executeUpdate("INSERT INTO user VALUES('"+uname+"','"+pwd+"','admin');");
		int i= st.executeUpdate("INSERT INTO bloodbankdetails VALUES('"+bbname+"','"+address+"',"+zip+",'"+uname+"','"+email+"','"+phno+"','"+Opos+"','"+Oneg+"','"+Apos+"','"+Aneg+"','"+ABpos+"','"+ABneg+"','"+Bpos+"','"+Bneg+"','"+district+"','"+area+"');");

        if(i>0)
            {
            request.setAttribute("bbadded","success");
            %>
            <jsp:forward page="admin.jsp"></jsp:forward>
            <%
            }else{
        response.sendRedirect("admin.jsp");
        }
/*
		   ResultSet r=st.executeQuery("SELECT * FROM UserDetails;");
           while(r.next())
			{
 				out.println(r.getInt("id")+"\t"+r.getString("name")+"\t"+r.getInt("AGE")+"\t"+r.getString("SEX")+"\t"+r.getString("EMAIL")+"\t"+r.getString("ADDRESS")+"\t"+r.getInt("ZIP"));
			}
*/
    }
		catch(SQLException e)
		{
			e.printStackTrace();
             %><%= "sql error" %><%

		}
		catch(Exception e)
		{
			%><%= "other error" %><%
            e.printStackTrace();
		}

%>


    </body>
</html>

