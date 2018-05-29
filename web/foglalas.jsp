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
            public class IndexHtml
            {

                PreparedStatement getAllomas = null;
                PreparedStatement getStart = null;
                PreparedStatement getEnd = null;
                PreparedStatement getEnd1 = null;
                String sql = null;
                String sql1 = null;
                String sql2 = null;
                String sql3 = null;
                Connection conn = null;
                ResultSet rs = null;
                ResultSet rs1 = null;
                ResultSet rs2 = null;
                ResultSet rs3 = null;
                String now;
                String dest;
                int atszallas=0;

                public IndexHtml()
                {
                    try
                    {

                        OracleDataSource ods = new OracleDataSource();
                        Class.forName("oracle.jdbc.OracleDriver");
                        ods.setURL("jdbc:oracle:thin:@localhost:1521:xe");
                        conn = ods.getConnection("", "");
                        sql = "SELECT ciName FROM City";
                        sql1 = "SELECT up,down,travel.coName,travel.aname,priece,now,dest,seats,sold FROM travel,rate WHERE travel.now = ? AND travel.coname = rate.coname";
                        sql2 = "SELECT up,down,travel.coName,travel.aname,priece,now,dest,seats,sold,tid FROM travel,rate WHERE travel.now = ? AND travel.dest = ? AND travel.coname = rate.coname ORDER BY up";
                      
                        getAllomas = conn.prepareStatement(sql);
                        getStart = conn.prepareStatement(sql1);
                        getEnd = conn.prepareStatement(sql2);
                        getEnd1 = conn.prepareStatement(sql3);

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }
                }

                public ResultSet getAllomas()
                {
                    try
                    {

                        rs = getAllomas.executeQuery();

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }

                    return rs;
                }

                public ResultSet getStart(String now)
                {
                    try
                    {
                        getStart.setString(1, now);
                    //megvan az összes olyan sor, ahol a now == now;
                        rs1 = getStart.executeQuery();

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }

                    return rs1;

                }
                public ResultSet getEnd(String now,String dest)
                {
                    try
                    {
                                getEnd.setString(1, now);
                                getEnd.setString(2, dest);
                                atszallas++;
                                rs2 = getEnd.executeQuery();
                            
                           
                        

                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }

                    return rs2;

                }
                public int getAt(){
                    return atszallas;
                }

            }
        %>
        <%
            IndexHtml htm = new IndexHtml();
            ResultSet rs = htm.getAllomas();
            ResultSet rs1 = null;
            ResultSet rs2 = null;
            int Atsz=-1;
            int price=0;

            String now = null;
            String start = null;
            String connect = null;
            String dest = null;
            int f=0;
            int gy=0;
            int i =0;
            if (request.getParameter("find") != null)
            {
                now = request.getParameter("honnan");
                dest = request.getParameter("hova");
                rs1 = htm.getStart(now);
                if(!request.getParameter("fcount").isEmpty()){
                                f = Integer.parseInt(request.getParameter("fcount"));}
                                
                if(!request.getParameter("gycount").isEmpty()){
                 gy = Integer.parseInt(request.getParameter("gycount"));}
                
                while(rs1.next()){
                    start = rs1.getString(7);
                   price = rs1.getInt(5);
                    Atsz++;
                    rs2 =htm.getEnd(start,dest);
                    if(rs2!= null && rs2.next()){
                         
                         price = price + rs2.getInt(5);
                        rs2 =htm.getEnd(start,dest);
                    break;
                    }
                }
                
               
            }


        %>
        <div class ="foglalas">
            <form name="list" action="foglalas.jsp" method="POST">
                
                <a>Felnőtt:</a>
                <input type="text" name="fcount" value="" size="5" />
                <a>Gyerek:</a>
                <input type="text" name="gycount" value="" size="5" />
                <a>Leggyorsabb:</a>
                <input type="radio" name="fastest" value="1" />
                
                <a>Honnan:</a>
                <select name="honnan">
                    <% while (rs.next())
                        {%>
                    <option value="<%= rs.getString("ciName")%>"><%= rs.getString("ciName")%></option>
                    <% } %>
                </select>
                <a>Honnan:</a>

                <select name="hova">
                    <%
                        rs = htm.getAllomas();
                        while (rs.next())
                       {%>
                    <option value="<%= rs.getString("ciName")%>"><%= rs.getString("ciName")%></option>
                    <% } %>
                </select>
                <a><input type="submit" value="Keres" name="find" /></a>
            </form> </br>
           <% 
                
                
                
           if (rs2!= null && rs2.next() )
                {
            %>
            <div class="tablediv">                 
                <table class="listData" border="1" align="center">
                    <thead>
                        <tr>

                            <th>Indul</th>
                            <th>Érkezik</th>
                            <th>Légitársaság</th>
                            <th>Repülőgép</th>
                            <th>Szabad helyek</th>
                            <th>Átszállás</th>
                            <th>Népszerűség</th>
                            <th>Ár</th>
                            <th>Foglalás</th>
                        </tr>
                    </thead>

                    <tbody>  
                        <%
                            do
                            {

                        %>
                    <form name="fForm" action="foglal.jsp">
                            
                        <tr>
                            <td><%= rs2.getString(1)%></td>
                            <td><%= rs2.getString(2)%></td>
                            <td><%= rs2.getString(3)%></td>
                            <td><%= rs2.getString(4)%></td>
                            <td><%= rs2.getString(8)%></td>
                            <td><%= Atsz %></td>
                            <td><%= rs2.getInt(9) %></td>
                            <td>                           
                                <%= 2*f*rs2.getInt(5)+gy*rs2.getInt(5)%></td>
                            <td><input type="radio" name="foglal" value="<%=rs2.getInt(10)%>" /></td>
                        <input type="hidden" name="gyerek" value="<%= gy %>" />
                        <input type="hidden" name="felnott" value="<%= f %>" />
                        </tr>
                        <% } while (rs2.next() && request.getParameter("fastest")==null ); %>
                        <input type="submit" value="Foglalás"></form>
 
                    </tbody>
                </table>
            </div>
            <% } else 
                        {%>
            <div class="middle"> <%= "Nincs ilyen út! Válassz másikat menetrend alapján."%></div>
            <%}
            %>

        </div>  
    </body>
</html>
