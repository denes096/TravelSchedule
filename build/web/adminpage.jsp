<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleConnection" %> 
<%@page import="oracle.jdbc.pool.OracleDataSource;" %>

<!DOCTYPE html>
<html>
    <link href="style.css" rel="stylesheet">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Utazás</title>
    </head>
    <body>
        <div class="header-text">
            <h1>Utazási Iroda</h1>
        </div>
        <div class="menu">
            <ul>
                <li><a href="beszur.jsp">Utak Törlése</a></li>
                
                <% if(session.getAttribute("sname")!=null ){ %>
                
                <li><a href="logout.jsp">Kijelentkezés</a></li>
        <% } %>
            </ul>
        </div>
        <%!
            public class IndexHtml
            {

                PreparedStatement getAllomas = null;
                PreparedStatement getAllomas1 = null;
                
                String sql = null;
                String sql1 = null;
               
                Connection conn = null;
                ResultSet rs = null;
                ResultSet rs1 = null;
                
              

                public IndexHtml()
                {
                    try
                    {

                        OracleDataSource ods = new OracleDataSource();
                        Class.forName("oracle.jdbc.OracleDriver");
                        ods.setURL("jdbc:oracle:thin:@localhost:1521:xe");
                        conn = ods.getConnection("", "");
                        sql = "DELETE FROM travel WHERE tID= ?";
                        sql1 = "SELECT up,down,now,dest,tid FROM travel";
                        
                        getAllomas = conn.prepareStatement(sql);
                        getAllomas1 = conn.prepareStatement(sql1);
                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }
                }

                public ResultSet getAllomas(int x)
                {
                    try
                    {
                        getAllomas.setInt(1, x);
                        rs = getAllomas.executeQuery();

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }

                    return rs;
                }

                public ResultSet getAllomas1()
                {
                    try
                    {
                        
                        rs1 = getAllomas1.executeQuery();

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }

                    return rs1;
                }

                
               
            }
        %>
        <%
            IndexHtml htm = new IndexHtml();
            
            ResultSet rs=null;
            ResultSet rs1=null;
            rs1 = htm.getAllomas1();
            
            int i =0;
            if (request.getParameter("torol") != null)
            {
                int tid = Integer.parseInt(request.getParameter("foglal"));
                int id = Integer.parseInt(request.getParameter("id"));
                 rs = htm.getAllomas(tid);
                }
                
               
            


        %>
        <div class ="foglalas">
            </br>
          <% if(rs1 != null && rs1.next()){ %>
            <div class="tablediv">    
                 
                <table class="listData" border="1" align="center">
                    <thead>
                        <tr>

                            <th>Indul</th>
                            <th>Érkezik</th>
                            <th>Start</th>
                            <th>Cél</th>
                            <th>Torol</th>
                            
                        </tr>
                    </thead>

                    <tbody>  
                        <%
                            do
                            {

                        %>
                    <form name="fForm" action="adminpage.jsp">
                            
                        <tr>
                            <td><%= rs1.getString(1)%></td>
                            <td><%= rs1.getString(2)%></td>
                            <td><%= rs1.getString(3)%></td>
                            <td><%= rs1.getString(4)%></td>
                            
                            <td><input type="radio" name="foglal" value="<%=rs1.getInt(5)%>" /></td>
                       
                        </tr>
                        <% } while (rs1.next() ); %>
                        <input type="submit" name ="torol" value="Torles"></form>
 
                    </tbody>
                </table> <% } %>
            </div>
           

        </div>  
    </body>
</html>
