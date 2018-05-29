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
                <li><a href="foglalas.jsp">Foglalás</a></li>
                <li><a>Információ</a>
                    <ul>
                        <li><a href="Legitarsasagok.jsp">Légitársaságok</a></li>
                        <li><a href="Varosok.jsp">Városok</a></li>
                        <li><a href="Repulok.jsp">Repülőgépek</a></li>
                    </ul>
                </li>
                <li><a href="menetrend.jsp">Menetrend</a></li>
                <% if(session.getAttribute("sname")==null){ %>
                <li><a href="login.jsp">Bejelentkezés</a></li> <% } else {%>
                <li><a href="logout.jsp">Kijelentkezés</a></li>
        <% } %>
            </ul>
        </div>
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
                        sql = "SELECT ciName FROM city";
                        
                        getVaros = conn.prepareStatement(sql);
                       

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }
                }

                public ResultSet getVaros()
                {
                    try
                    {

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
            Varos varos = new Varos();
            ResultSet rs = varos.getVaros();
           


        %>
        
            <div class="tablediv">                 
                <table class="listLegit" border="1" align="center">
                    <thead>
                        <tr>

                            <th>Városok amikbe lehet utazni:</th>
                            
                        </tr>
                    </thead>

                    <tbody>  
                        <%
                            while(rs.next()){
                        %>
                        <tr>
                            <td><%= rs.getString(1)%></td>
                           
                        </tr>
                       <%  } %>

                    </tbody>
                </table>
            </div>
            

       
    </body>
</html>
