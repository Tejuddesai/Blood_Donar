 <%@page import="java.sql.*" %>
 <%

        try {
            String usrname = request.getParameter("t3");


            Class.forName("com.mysql.jdbc.Driver");
            //out.println("Drivers Installed");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonardb","root","root");
           Statement st = conn.createStatement();
           String check1="none";
           boolean exists = false;

       ResultSet rs = st.executeQuery("select * from hospitaldetails");

            while(rs.next())
                {
                check1=rs.getString("uname");


                if (usrname.equals(check1)) {
                   exists =  true;
                    break;
                }
               }
       if(exists)
            {
             %><%="username already exists"%><%
            }
            else
            {
            %><%="username doesn't exists, u can use it"%><%
                  }
       }

           /* if(logName)
                {
                if(check2.equals(psw))
                    {
                    out.println("you are logged in");
                    }
                else {
                    out.println("you have entered wrong password");
                }
            }
            else{
                out.println("wrong usr name");
                }

        } */
            catch (Exception e) {
            //e.printStackTrace();
                out.println(e);
            //out.println("Error Occured");
        }

        %>


