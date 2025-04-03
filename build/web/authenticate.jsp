<%-- 
    Document   : newjsp
    Created on : Jul 13, 2017, 4:35:32 PM
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
   <head>
       
   <%@ page import="java.lang.*"%>
<title>authenticate page</title>
   </head>    <body>
        <%@page import="java.sql.*" %>
        
        <%
//out.println("hello Abhishek");
	
		
          String uname=request.getParameter("t1");

            String pwd=request.getParameter("t2");
            String cpwd=request.getParameter("t3");
            String email=request.getParameter("t4");
            String name=request.getParameter("t5");
              String fathername=request.getParameter("t6");
              String gen=request.getParameter("d1");
              String age=request.getParameter("t7");
             
              String address=request.getParameter("m1");
              String zip=request.getParameter("t8");
               
              String district=request.getParameter("d4");
              String area=request.getParameter("d5");
              String phno=request.getParameter("t9");
              String bgroup=request.getParameter("d6");

              String ldd=request.getParameter("t10");
              System.out.println("last donatio date=="+ldd);
              int count=0;
              try
                     {
                 
			
                         Class.forName("com.mysql.jdbc.Driver");
                         
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb","root","root");

            Statement st=conn.createStatement();
         //int i= st.executeUpdate("create table (uname varchar(20),psw varchar(10), name VARCHAR(20),fname VARCHAR(25),gend VARCHAR(10),age INT,email VARCHAR(40),address VARCHAR(250),country VARCHAR(10),state VARCHAR(15),city VARCHAR(10),area VARCHAR(10),zip VARCHAR(10),phno VARCHAR(20),bg VARCHAR(5),ldd varchar(20));");
     ResultSet rs=st.executeQuery("select count(*) from donorprofile where email='"+email+"'");
	if(rs.next())
	{
	 count=rs.getInt(1);
	 if(count==0)
	{
		int i=st.executeUpdate("INSERT INTO donorprofile VALUES('"+uname+"','"+pwd+"','"+cpwd+"','"+email+"','"+name+"','"+fathername+"','"+gen+"','"+age+"','"+address+"','"+zip+"','"+district+"','"+area+"','"+phno+"','"+bgroup+"','"+ldd+"','0');");
		int j= st.executeUpdate("INSERT INTO user VALUES('"+uname+"','"+pwd+"','donor');");
		if(i==0)
		{
		response.sendRedirect("registration.jsp?msg=failure");
		}
		else
		{
		response.sendRedirect("registration.jsp?msg=Account Created  Sucessfully");
                session.setAttribute("uname",uname);
		}
	}
	else
	{
	response.sendRedirect("registration.jsp?msg=Student Already Exists For This uname number");
	}
	}
	}      
catch(Exception e)
       {

       out.println(e);
        }



                                            // int j= st.executeUpdate("INSERT INTO user VALUES('"+uname+"','"+pwd+"','donor');");

			//int i= st.executeUpdate("INSERT INTO donorprofile VALUES('"+uname+"','"+pwd+"','"+cpwd+"','"+email+"',"+name+",'"+fathername+"','"+gen+"',"+",'"+age+"','"+address+"',"+zip+","+district+",'"+area+"','"+phno+"','"+bgroup+"','"+ldd+");");
          

		  /* ResultSet r=st.executeQuery("SELECT * FROM UserDetails;");
           while(r.next())
			{
 				out.println(r.getInt("id")+"\t"+r.getString("name")+"\t"+r.getInt("AGE")+"\t"+r.getString("SEX")+"\t"+r.getString("EMAIL")+"\t"+r.getString("ADDRESS")+"\t"+r.getInt("ZIP"));
			}
*/
    //request.setAttribute("regsuccess","success");
    %>
    


    </body>
</html>
