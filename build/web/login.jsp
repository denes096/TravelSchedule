<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleConnection" %> 
<%@page import="oracle.jdbc.pool.OracleDataSource;" %>

<!DOCTYPE html>
<html>
    <link href="style.css" rel="stylesheet">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
               <% if(session.getAttribute("sname")==null){ %>
                <li><a href="login.jsp">Bejelentkezés</a></li> <% } else {%>
                <li><a href="logout.jsp">Kijelentkezés</a></li>
        <% } %>
            </ul>
        </div>
       
        
            <div class="loginform">                 
                <form name="loginform" action="watch.jsp" method="GET">
                    <a>Felhasználó:</a>
                    <input type="text" name="uname" value="" size="10" />
                    <a>Jelszó:</a>
                    <input type="Password" name="pw" value="" size="10" />
                    <a> Adminként: </a>
                    <input type="radio" name="isadmin" value="1" /> 
                   
                    <input type="submit" value="Submit" name="loginB" />
                </form>
                
            </div>
            

       
    </body>
</html>
