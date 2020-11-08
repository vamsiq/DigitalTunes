<%@ page import="java.util.*,java.sql.*" session="true"%>
<%  
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
String q=request.getParameter("st");
         String cd=request.getParameter("ccd");
		 String t=request.getParameter("type");
 String t1=request.getParameter("stype");


 int sub;
  int no=Integer.parseInt(q);
  System.out.println(no);
String stype="";
if(t1.equals("Air Mail"))
stype="U R Goods will be devilered in 10-15 days";
else
stype="U R Goods will be devilered in 20-35 days";
try{ 

	Class.forName("com.mysql.jdbc.Driver");  
 	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root");  
 	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root"); 
 	Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root"); 
 	Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root");
 	Connection con4=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root");


Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from forder where orno="+no);

Statement c=con1.createStatement();
ResultSet crs=c.executeQuery("select amount from creditcheck where cno='"+cd+"' and ctype='"+t+"'");

Statement d=con2.createStatement();
Statement up=con1.createStatement();

System.out.println("Statement executed");
out.println("<html><head><style>.LFont {	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR:  black; FONT-FAMILY: verdana } .formText {	BORDER-RIGHT: #aaaaaa 1px solid; BORDER-TOP: #aaaaaa 1px solid; FONT-SIZE: 11px; BORDER-LEFT: #aaaaaa 1px solid; COLOR: black; BORDER-BOTTOM: #aaaaaa 1px solid; FONT-FAMILY: verdana} .white10 {	FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial, Helvetica,sans-serif}.white10 A:link {	COLOR:  #ffcc00; TEXT-DECORATION: none}.white10 A:visited {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:active {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:hover {	COLOR:red; TEXT-DECORATION: none}</style></head> <body background=ban.GIF> <form ><center> ");

if(crs.next())
	{
	rs.next();
	out.println("<b class=LFont> U Order has been passed<br> ");
	out.println("The details of ur Order are as follows :-<br><br></b>");
	out.println("<table border=10><tr class=LFont><td>Order Number</td><td>Amount</td></tr>");
	int ono=rs.getInt("orno");
	int am=rs.getInt("amount");
	System.out.println(ono+" hello "+am);

	out.println("<tr class=LFont><td>"+ono+
		"</td><td>Rs."+am+"</td></tr>");
	out.println("</table><br><br><br><br><b class=LFont>*"+stype+"<br><a href=login.html target=_parent>LoginPage</a> <a href=sup1.html target=_self>MainPage</a></body></html>");
    int amount=crs.getInt("amount");
	int de=amount;
	if(amount>am)
	 de=amount-am;
	else
		{
		%>
		<jsp:forward page="amount.jsp" />
<%
		}
	System.out.println("amount"+amount);
	up.executeUpdate("Update creditcheck set amount="+de+" where cno='"+cd+"'  ");
	d.executeUpdate("delete from cart");
	
	}
else
	{
	//String sn=Integer.toString(no);
		 session.setAttribute("aid",q);
		 out.println("<b class=LFont><font size=5><br><br><br><center> U Entered Wrong Information <br>Plz enter Correct Information</b>");
	%>




<%}
rs.close();
crs.close();
st.close();
c.close();
con.close();
con1.close();
}catch (Exception e)
{out.println(e);}

%>

 
