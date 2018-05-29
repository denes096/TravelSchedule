<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleConnection" %> 
<%@page import="oracle.jdbc.pool.OracleDataSource;" %>

<!DOCTYPE html>
<html>
    <link href="style.css" rel="stylesheet">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
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
       
        <div class ="foglalas">
            <a class = "szoveg">Üdvözöljük az utazási iroda holnapján <br><br>
                
                Szolgáltatásaink: Repülőgépes utak biztosítása több mint 50 városba. <br>
                Partnereink: Független cégek, akik biztosítják az úthöz szükséges gépeket. <br><br>
                Kellemes utat kívánunk!
            <br>
            
            </a>

        </div>  
    </body>
</html>
