
<html>
    <head>

        <%@ page import="java.sql.*" %>
        <%@ page import="java.lang.*"%>
        <title>authenticate page </title>
    </head>
    <body>
        
            <%
        try {
            String bggroup = request.getParameter("d1");
            String country = request.getParameter("d2");
            String state = request.getParameter("d3");
            String city = request.getParameter("t1");
            String zip = request.getParameter("t2");
            String area = request.getParameter("t3");
            String reqType = request.getParameter("c1");
            //String reqType2 = request.getParameter("c2");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonordb", "root", "");
            Statement st = conn.createStatement();
            if(!(reqType==null)){
                if(reqType.equals("donors")){
            %>
            <jsp:forward page="search.jsp?d1=<%=bggroup%>&d2=<%=country%>&d3=<%=state%>&t1=<%=city%>&t2=<%=zip%>&t3=<%=area%>"/>
            <%}
                else if(reqType.equals("bloodbanks")){
                %>
            <jsp:forward page="search2.jsp"/>
            <%}}else{%>
            <%="select anyone of the donors or bloodbank"%><%
            }
            } catch (SQLException e) {
                e.printStackTrace();


            } catch (Exception e) {
            %><%= "other error"%><%
            e.printStackTrace();
        }

            %>

            </body>
</html>
