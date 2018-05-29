
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleConnection" %> 
<%@page import="oracle.jdbc.pool.OracleDataSource;" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <body>
            
        <%
            String userid=request.getParameter("foglal"); 
            String gyerek=request.getParameter("gyerek"); 
            String felnott=request.getParameter("felnott"); 
            
             Class.forName("oracle.jdbc.OracleDriver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","",""); 
            Statement st= con.createStatement(); 
             int id = Integer.parseInt(userid);
             int gy = Integer.parseInt(gyerek);
             int f = Integer.parseInt(felnott);
             int eladva = -gy-f;
             ResultSet rs=st.executeQuery("UPDATE travel SET seats=(SELECT seats FROM travel WHERE tID= "+id+") + " + eladva +"  WHERE tID = "+id+" "); 
            if(rs.next()) 
            { 
                 
                             %> <jsp:forward page="foglalas.jsp"/> <%
            } 
            
            %>
            
            
          
        <h1>Hello World! % <%= "aaa "+userid %></h1>
    </body>
</html>
