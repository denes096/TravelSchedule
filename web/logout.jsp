
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
                  session.invalidate();
                             %>
                             <jsp:forward page="index.jsp"/> 
            
            
          
        <h1>Hello World!</h1>
    </body>
</html>
