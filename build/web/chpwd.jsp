<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>changepassword</title>
        <style  type="text/css" >

            #pass2{
                display:none;
            }
            #secret{
                display:none;
            }

        </style>
        <script type="text/javascript">


            function checkpass(me){
                if(me.value == document.fpass.passs.value){
                    document.getElementById("pass2").style.display="block";
                }
                else{
                    document.getElementById("diss").innerHTML="wrong password";
                }
            }

            function blank1(){
                document.getElementById("diss").innerHTML="";
            }
        </script>
    </head>
    <body>
        <!--  <input type="button" value="About Blood" name="b1"/>
            <input type="button" value="Edit Profile" name="b2"/>
            <input type="button" value="Search" name="b3"/>
            <input type="button" value="Home" name="b4"/><br>
           -->
        <%@page import="java.sql.*"%>

        <% try {
             String s = (String)session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonordb", "root", "");
            Statement st = conn.createStatement();
            ResultSet r = st.executeQuery("select * from bloodbankdetails where uname='"+s+"';");
            r.next();
            %>
        <form name="fpass" method="post" action="bbpassupdate.jsp" >
           <a href="editprofile.jsp">Back</a>
            <input type="text" value="<%=r.getString("psw")%>" name="passs" id="secret"/>
            <h2 align="center">change password</h2>
            <table>

               <tr id="pass"><TD>CurrentPassword:</TD><TD><input type="password" name="t1"
                                                                  onblur="checkpass(this)"
onselect="blank1()" onclick="blank1()" /></TD><td><span id="diss"></span></td></tr>
            </table>
            <table id="pass2">
                <TR><TD>New Password:</TD><TD> <input type="password" name="t2"  /></TD></TR>
                <TR><TD>Confirm Password:</TD><TD><input type="password" name="t3" /></TD></TR>
               </table>
    <input  type = "submit" value = "update" name = "b1" />
    <%

 } catch (SQLException e) {
     e.printStackTrace();
                   %><%

 } catch (Exception e) {
                   %><%= "other error"%><%
            e.printStackTrace();
        }

                   %>



         </form>
    </body>
</html>