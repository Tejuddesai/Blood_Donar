<html><body>

        <%@page import="java.sql.*"%>


        <%

        try {
            String s=(String)session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonordb", "root", "");
            Statement st = conn.createStatement();
            String Opos=request.getParameter("Opos");
            String Oneg=request.getParameter("Oneg");
            String Apos=request.getParameter("Apos");
              String Aneg=request.getParameter("Aneg");
              String ABpos=request.getParameter("ABpos");
              String ABneg=request.getParameter("ABneg");
              String Bpos=request.getParameter("Bpos");
              String Bneg=request.getParameter("Bneg");

              String sql="update bloodbankdetails set Opos='"+Opos+"',Oneg='"+Oneg+"',Apos='"+Apos+"',Aneg='"+Aneg+"',ABpos='"+ABpos+"',ABneg='"+ABneg+"',Bpos='"+Bpos+"',Bneg='"+Bneg+"' where uname='"+s+"'";
              %><%= sql %><%
              int i= st.executeUpdate(sql);
              %><jsp:forward page="bbfrontend.jsp" /><%


         %> 
   <%
        }catch(Exception e){
            e.printStackTrace();
            out.println("Error Occured");
            
        }

        %>
        
            
        </body></html>


