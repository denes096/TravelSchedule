
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
             <%!
            public class Varos
            {

                PreparedStatement getVaros = null;
                
                String sql = null;
                
                Connection conn = null;
                ResultSet rs = null;
                

                public Varos()
                {
                    try
                    {

                        OracleDataSource ods = new OracleDataSource();
                        Class.forName("oracle.jdbc.OracleDriver");
                        ods.setURL("jdbc:oracle:thin:@localhost:1521:xe");
                        conn = ods.getConnection("", "");
                        sql = "SELECT uname,isAdmin FROM users WHERE uname = ? AND pw = ?";
                        
                        getVaros = conn.prepareStatement(sql);
                       

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }
                }

                public ResultSet getVaros(String name, String pw)
                {
                    try
                    {
                        getVaros.setString(1, name);
                        getVaros.setString(2, pw);
                        rs = getVaros.executeQuery();

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }

                    return rs;
                }

               

            }
        %>
        <%
            String userid=request.getParameter("uname"); 
            session.setAttribute("userid",userid); 
            String pwd=request.getParameter("pw");
             Class.forName("oracle.jdbc.OracleDriver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","Nudenano06"); 
            Statement st= con.createStatement(); 
             
            ResultSet rs=st.executeQuery("SELECT uname,pw,isAdmin FROM users WHERE uname = '"+userid+"'"); 
            if(rs.next()) 
            { 
                  session.setAttribute("sname", userid);
                             %> <jsp:forward page="index.jsp"/> <%
            } 
            %>
            
            
          
        <h1>Hello World! % <%= "aaa   "+userid+" "+pwd%></h1>
    </body>
</html>
