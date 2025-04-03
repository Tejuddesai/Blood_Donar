<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.lang.*" %>
<title>authenticate page</title>
</head>
<body>
<%
	try
		{
          String  uname=request.getParameter("t4");

         String pwd=request.getParameter("t5");
            String dname=request.getParameter("t1");
            String specialization=request.getParameter("t2");
              String gen=request.getParameter("d1");
             
              String email=request.getParameter("t7");
               String address=request.getParameter("m1");
               String zip=request.getParameter("t3");
              
              String phno=request.getParameter("t8");
              String bgroup=request.getParameter("d2");

             
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb","root","root");

            Statement st=conn.createStatement();
         //int i= st.executeUpdate("create table doctor(uname varchar(20),psw varchar(10), dname VARCHAR(20),specialization VARCHAR(15),gend VARCHAR(10),email VARCHAR(40),address VARCHAR(250),zip VARCHAR(10),phno VARCHAR(20),bg VARCHAR(5));");

          int j=st.executeUpdate("INSERT INTO user VALUES('"+uname+"','"+pwd+"','doctor');");
		int i= st.executeUpdate("INSERT INTO doctorprofile VALUES('"+uname+"','"+dname+"','"+specialization+"','"+gen+"','"+email+"','"+address+"',"+zip+","+phno+",'"+bgroup+"');");

        if(i>0)
            {
            request.setAttribute("docadded","success");
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
    request.setAttribute("regsuccess","success");
    
    response.sendRedirect("admin.jsp");
    }


		catch(SQLException e)
		{
			e.printStackTrace();
             %><%

		}
		catch(Exception e)
		{
			%><%= "other error" %><%
            e.printStackTrace();
		}

%>


    </body>
</html>
