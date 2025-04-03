<html>
    <head>
        <style type="text/css" >
            td{
                padding:5px;
            }
        </style>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.lang.*"%>
        <title>authenticate page </title>
    </head>
    <body>
        <table border="1px">
            <tr><th>BBname</th><th>AvalibaleUnits</th><th>E-Mail</th><th>Address</th><th>Zip</th><th>Country</th><th>State</th><th>City</th><th>Area</th><th>PhNo</th></tr>
            <%
        try {
            String bggroup = "";
            String bg = request.getParameter("d1");
            if (bg.equals("O+")) {
                bggroup = "Opos";
            }

            if (bg.equals("O-")) {
                bggroup = "Oneg";
            }

            if (bg.equals("A+")) {
                bggroup = "Apos";
            }

            if (bg.equals("A-")) {
                bggroup = "Aneg";
            }

            if (bg.equals("AB+")) {
                bggroup = "ABpos";
            }

            if (bg.equals("AB-")) {
                bggroup = "ABneg";
            }

            if (bg.equals("B+")) {
                bggroup = "Bpos";
            }

            if (bg.equals("B-")) {
                bggroup = "Bneg";
            }

            String country = request.getParameter("d2");
            String state = request.getParameter("d3");
            String city = request.getParameter("t1");
            String zip = request.getParameter("t2");
            String area = request.getParameter("t3");

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonordb", "root", "");
            Statement st = conn.createStatement();
            String sql = "select `bbname`,`" + bggroup + "`,`email`,`address`,`zip`,`country`,`state`,`city`,`area`,`phno` from bloodbankdetails where 1 ";
            if (!country.equals("All")) {
                sql = sql + "  country='" + country + "'";
            }
            if (!state.equals("All")) {
                sql = sql + "and  state='" + state + "'";
            }
            if (!city.equals("")) {
                sql = sql + "and city='" + city + "'";
            }
            if (!area.equals("")) {
                sql = sql + "and area='" + area + "'";
            }
            if (!zip.equals("")) {
                sql = sql + "and zip='" + zip + "'";
            }


            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
            %>

            <tr>

                <td><%=rs.getString("bbname")%></td>
                <td><%=rs.getString(bggroup)%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("address")%></td>
                <td><%=rs.getInt("zip")%></td>
                <td><%=rs.getString("country")%></td>
                <td><%=rs.getString("state")%></td>
                <td><%=rs.getString("city")%></td>
                <td><%=rs.getString("area")%></td>
                <td><%=rs.getString("phno")%></td>
            </tr>


            <%



                }

            } catch (SQLException e) {
                e.printStackTrace();
            %><%

            } catch (Exception e) {
            %><%= "other error"%><%
            e.printStackTrace();
        }

            %>

        </table>
    </body>
</html>
