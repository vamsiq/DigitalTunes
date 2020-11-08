import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class reports extends HttpServlet {
         public Connection getConnection() {
         try {
              Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");     
              return (DriverManager.getConnection("jdbc:odbc:e-music","emusic","emusic"));
             } catch (ClassNotFoundException exp) { return null;}
               catch (Exception exp) { return null;}
   		 }
		 public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException {
                generateReports(req,res);
          }
         public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
                generateReports(req,res);
          }
         public void getQueryToParse(String vall,HttpServletResponse res) throws ServletException,IOException {
         PrintWriter out=res.getWriter();
         try {
         String ds;
		 int iv;
         String data="Select * from "+vall;
          Connection conn=null;
		  Statement st=null;
		  PreparedStatement pst=null;
		  ResultSet rs=null;
		  ResultSetMetaData meta=null;
		  conn=getConnection();
		  st=(conn!=null)?conn.createStatement():null;
          rs=(st!=null)?st.executeQuery(data):null;
		  meta=(rs!=null)?rs.getMetaData():null;
		  int ct=0;
		  out.println("<style>");
		  out.println("td {font-family:ms sans serif;color:gray;font-size:12px}");
		  out.println("th{font-family:ms sans serif;background:lightslategray;color:aliceblue;font-size:12px;}");
		  out.println("body {background:ivory}");
		  out.println("</style>");
		  out.println("<title>Reports Generation</title>");
		  out.println("<center><h2><a href=\"javascript:window.print()\"><font face=arial color=gray>Print The Reports</font></a></h2></center><hr size=1 color=gray><BR>");
          out.println("<table width=750 border=0 bgcolor=steelblue cellspacing=1 cellpadding=1");
          if(rs!=null) {out.println("<TR>");  
          for(int mt=1;mt<=meta.getColumnCount();mt+=1) 
          out.println("<Th nowrap>&nbsp;&nbsp;"+meta.getColumnName(mt).replace('_','-')+"&nbsp;&nbsp;</th>");
		  out.println("</TR>");} 
		  while(rs!=null && rs.next()) {
          ct++;out.println("<TR>");
		  for(int d=1;d<=meta.getColumnCount();d++) {
          String metaname=meta.getColumnTypeName(d).toLowerCase();
		  if(metaname.indexOf("varchar")!=-1) {
          ds=rs.getString(d);
          out.println("<td bgcolor=whitesmoke>&nbsp;&nbsp;&nbsp;"+ds+"&nbsp;</td>");}
		  else if(metaname.indexOf("date")!=-1) {
          ds=rs.getDate(d).toString();
          out.println("<td bgcolor=whitesmoke>&nbsp;&nbsp;&nbsp;"+ds+"&nbsp;</td>");}
		  else {
          iv=rs.getInt(d);
          out.println("<td bgcolor=whitesmoke>&nbsp;&nbsp;&nbsp;"+iv+"&nbsp;</td>");}
  		  }  out.println("</tr>");
  	      } out.println("</table>");
          } catch (Exception e) { out.println("<h1>Error Occured<BR>"+e);  }
          }
		  public void generateReports(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException {
          getQueryToParse(req.getParameter("table"),res);
          }
}


