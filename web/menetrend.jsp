<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleConnection" %> 
<%@page import="oracle.jdbc.pool.OracleDataSource;" %>

<!DOCTYPE html>
<html>
    <link href="style.css" rel="stylesheet">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Légitársaságok</title>
    </head>
    <body>
        <div class="header-text">
            <h1>Utazási Iroda</h1>
        </div>
        <div class="menu">
            <ul>
                <li><a href="foglalas.jsp">Menetrend</a></li>
                <li><a>Információ</a>
                    <ul>
                        <li><a href="Legitarsasagok.jsp">Légitársaságok</a></li>
                        <li><a href="Varosok.jsp">Városok</a></li>
                        <li><a href="Repulok.jsp">Repülőgépek</a></li>
                    </ul>
                </li>
                <li><a href="menetrend.jsp">Menetrend</a></li>
                <li><a href="login.jsp">Bejelentkezés</a></li>
            </ul>
        </div>
        <%!
            public class Men
            {

                PreparedStatement getMen = null;
                
                String sql = null;
                
                Connection conn = null;
                ResultSet rs = null;
                

                public Men()
                {
                    try
                    {

                        OracleDataSource ods = new OracleDataSource();
                        Class.forName("oracle.jdbc.OracleDriver");
                        ods.setURL("jdbc:oracle:thin:@localhost:1521:xe");
                        conn = ods.getConnection("", "");
                        sql = "SELECT now,dest FROM travel  GROUP BY now,dest ORDER BY now";
                        
                        getMen = conn.prepareStatement(sql);
                       

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }
                }

                public ResultSet getMen()
                {
                    try
                    {

                        rs = getMen.executeQuery();

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }

                    return rs;
                }

               

            }
        %>
        <%
            Men varos = new Men();
            ResultSet rs = varos.getMen();
           


        %>
        
            <div class="tablediv">                 
                <table class="listLegit" border="1" align="center">
                    <thead>
                        <tr>

                            <th>Indulás:</th>
                            <th></th>
                            <th>Érkezés:</th>
                            
                        </tr>
                    </thead>

                    <tbody>  
                        <%
                            while(rs.next()){
                        %>
                        <tr>
                            <td><%= rs.getString(1)%></td>
                            <td><%= "-->" %></td>
                            <td><%= rs.getString(2)%></td>
                           
                        </tr>
                       <%  } %>

                    </tbody>
                </table>
            </div>
            

       
    </body>
</html>
