<%@ page import="java.sql.*" %>
<%! 
           Connection con = null;
		   Connection con1=null;
		    Statement st = null;
%>
<%String unam=(String)session.getAttribute("UserName");
if(unam==null)
{
response.sendRedirect("Logout.jsp");
} %>
<html>
<head>
<style>.LFont {	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR:  black; FONT-FAMILY: verdana } .formText {	BORDER-RIGHT: #aaaaaa 1px solid; BORDER-TOP: #aaaaaa 1px solid; FONT-SIZE: 11px; BORDER-LEFT: #aaaaaa 1px solid; COLOR: pink; BORDER-BOTTOM: #aaaaaa 1px solid; FONT-FAMILY: verdana} .white10 {	FONT-SIZE: 10pt; COLOR: #ffcc00; FONT-FAMILY: Arial, Helvetica,sans-serif}.white10 A:link {	COLOR:  #ffcc00; TEXT-DECORATION: none}.white10 A:visited {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:active {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:hover {	COLOR:red; TEXT-DECORATION: none}</style>
</head> 
<body background=ban.GIF> 
<CENTER><h1>ONLINESHOPPING-E- Music World</H1><BR>
<CENTER><H2>SELECTING FILMS</H2>
<%

String s1=request.getParameter("pop").trim();
String s=request.getParameter("region").trim();
String s2=request.getParameter("a").trim();
System.out.println("s1="+s1);
int counter=0;

if(s2.equalsIgnoreCase("film"))
{
String t="";
if(s.equals("USA"))
t="$";
if(s.equals("INDIA"))
t="Rs.";
if(s.equals("EUROPE"))
t="@";
if(s1.equalsIgnoreCase("new"))
{
	String[] fil={"NP","NP1","NP2"};
	try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root"); 
		PreparedStatement pst=con.prepareStatement("select * from search where type=? and category=?");
		pst.setString(1,s1);
		pst.setString(2,"pop");
		ResultSet rs=pst.executeQuery();
		out.println("<form action=MoreCds.jsp><TABLE border=0><tr>");
		while(rs.next())
		{
		String s3=rs.getString("itemname");
		int price=rs.getInt("price");
		String film=rs.getString("film");
		for(int i=0;i<fil.length;i++)
		{
			if(s3.indexOf(fil[i])!=-1)
			{
			String s4=s3+".jpg";
			out.println("<tr><td><img src='"+s4+"'></td> ");
			out.println("<td><i>Price :'"+t+"'"+price+"/-</td><td>Film:</td><td>'"+film+"' <td><input type=checkbox name=\""+s3+"\" value=\""+film+"\"></td>");
			break;
			}
		}
		}
		out.println("</tr><tr><TD><INPUT TYPE=submit VALUE=SUBMIT></TD></TR></table></form>");
		con.close();

}catch(Exception e){e.printStackTrace();
out.println(e);}

	
}
if(s1.equalsIgnoreCase("old"))
{
	String[] ofil={"OP","OP1","OP2"};
	try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root"); 
		PreparedStatement pst=con.prepareStatement("select * from search where type=? and category=?");
		pst.setString(1,s1);
		pst.setString(2,"pop");
		ResultSet rs=pst.executeQuery();
		out.println("<form action=MoreCds.jsp><TABLE border=0><tr>");
		while(rs.next())
		{
		String s3=rs.getString("itemname");
		int price=rs.getInt("price");
		String film=rs.getString("film");
		for(int i=0;i<ofil.length;i++)
		{
			if(s3.indexOf(ofil[i])!=-1)
			{
			String s4=s3+".jpg";
			out.println("<tr><td><img src='"+s4+"'></td> ");
			out.println("<td><i>Price :'"+t+"'"+price+"/-</td><td>Film:</td><td>'"+film+"' <td><input type=checkbox name=\""+s3+"\" value=\""+film+"\"></td>");
			break;
			}
		}
		}
		out.println("</tr><tr><TD><INPUT TYPE=submit VALUE=SUBMIT></TD></TR></table></form>");
		con.close();

}catch(Exception e){e.printStackTrace();
out.println(e);}

}
}
else
if(s2.equalsIgnoreCase("price"))
{%>
<jsp:include page="price.html" />
<%
}
else
if(s2.equalsIgnoreCase("cat"))
{%>
<jsp:forward page="cat.html" />
<%
}
else
if(s2.equalsIgnoreCase("singer"))
{%>
<jsp:include page="singer.html" />
<%
}
%>

</html>