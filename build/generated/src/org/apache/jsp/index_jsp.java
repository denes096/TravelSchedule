package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import oracle.jdbc.driver.OracleConnection;
import oracle.jdbc.pool.OracleDataSource;;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


            public class IndexHtml
            {

                
                PreparedStatement getAllomas = null;
                PreparedStatement getInfo = null;
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
                        conn = ods.getConnection("hr", "Nudenano06");
                        sql = "SELECT ciName FROM City";
                        sql1 ="SELECT up,down,travel.coName,travel.aname,seats,priece,now,dest FROM travel,airplane WHERE travel.now = ? AND travel.dest = ? AND  travel.aname=airplane.aname";
                        getAllomas = conn.prepareStatement(sql);
                        getInfo = conn.prepareStatement(sql1);
                        
                    } catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }
                }

                public ResultSet getAllomas()
                {
                    try{
                        
                        rs = getAllomas.executeQuery();
    
                    }
                    catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }
                    
                    return rs;
                }
                public ResultSet getInfo(String now,String dest){
                    try{
                        getInfo.setString(1, now);
                        getInfo.setString(2, dest);
                        
                        rs1 = getInfo.executeQuery();
    
                    }
                    catch (Exception ex)
                    {
                        ex.printStackTrace();
                    }
                    
                    return rs1;

                }

            }
        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <link href=\"style.css\" rel=\"stylesheet\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Utazás</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"header-text\">\n");
      out.write("            <h1>Utazási Iroda</h1>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"menu\">\n");
      out.write("            <ul>\n");
      out.write("                <li><a>Foglalás</a></li>\n");
      out.write("                <li><a>Információ</a>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a>Légitársaságok</a></li>\n");
      out.write("                        <li><a>Városok</a></li>\n");
      out.write("                        <li><a>Repülőgépek</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a>Menetrend</a></li>\n");
      out.write("                <li><a>Bejelentkezés</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

          IndexHtml htm = new IndexHtml();
          ResultSet rs= htm.getAllomas();
          ResultSet rs1 = null;
          
          String now=null;
          String dest=null;
          
          if(request.getParameter("find")!=null){
              now=request.getParameter("honnan");
              dest = request.getParameter("hova");
              rs1= htm.getInfo(now,dest);
          }
          
          
        
      out.write("\n");
      out.write("        <div class =\"foglalas\">\n");
      out.write("            <form name=\"list\" action=\"index.jsp\" method=\"POST\">\n");
      out.write("                <a>Dátum:</a>\n");
      out.write("                <input type=\"text\" name=\"mikor\" value=\"yyyy-mm-dd\" size=\"10\"/>\n");
      out.write("                <a>Felnőtt:</a>\n");
      out.write("                <input type=\"text\" name=\"fcount\" value=\"\" size=\"5\" />\n");
      out.write("                <a>Gyerek:</a>\n");
      out.write("                <input type=\"text\" name=\"gycount\" value=\"\" size=\"5\" />\n");
      out.write("                <a>Leggyorsabb:</a>\n");
      out.write("                <input type=\"radio\" name=\"fastest\" value=\"\" />\n");
      out.write("                <a>Átszállás(max):</a>\n");
      out.write("                <input type=\"text\" name=\"transfer\" value=\"\" size=\"5\" />\n");
      out.write("                \n");
      out.write("                <a>Honnan:</a>\n");
      out.write("                <select name=\"honnan\">\n");
      out.write("                    ");
 while (rs.next())
                        {
      out.write("\n");
      out.write("                    <option value=\"");
      out.print( rs.getString("ciName"));
      out.write('"');
      out.write('>');
      out.print( rs.getString("ciName"));
      out.write("</option>\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                </select>\n");
      out.write("                <a>Honnan:</a>\n");
      out.write("                \n");
      out.write("                <select name=\"hova\">\n");
      out.write("                   ");

                       rs = htm.getAllomas();
                       while (rs.next())
                        {
      out.write("\n");
      out.write("                    <option value=\"");
      out.print( rs.getString("ciName"));
      out.write('"');
      out.write('>');
      out.print( rs.getString("ciName"));
      out.write("</option>\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                </select>\n");
      out.write("                <a><input type=\"submit\" value=\"Keres\" name=\"find\" /></a>\n");
      out.write("            </form>\n");
      out.write("               <div class=\"tablediv\">                 \n");
      out.write("                <table class=\"listData\" border=\"1\" align=\"center\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            \n");
      out.write("                            <th>Indul</th>\n");
      out.write("                            <th>Érkezik</th>\n");
      out.write("                            <th>Légitársaság</th>\n");
      out.write("                            <th>Repülőgép</th>\n");
      out.write("                            <th>Szabad helyek</th>\n");
      out.write("                            <th>Átszállás</th>\n");
      out.write("                            <th>Népszerűség</th>\n");
      out.write("                            <th>Ár</th>\n");
      out.write("                            <th>Foglalás</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    \n");
      out.write("                    <tbody>  \n");
      out.write("                        ");
 
                           while(rs1.next()){
                            
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print( rs1.getString(1) );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs1.getString(2) );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs1.getString(3) );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs1.getString(4) );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs1.getString(5) );
      out.write("</td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td>");
      out.print( rs1.getString(6) );
      out.write("</td>\n");
      out.write("                            <td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
 }  
      out.write("\n");
      out.write("    \n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("                \n");
      out.write("        </div>  \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
