<%@ include file="makecon.jsp" %>
<%@ page import="java.util.*" session="true"%>
<%//  String q=request.getParameter("st");
 //out.println(q);
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
 String s[]=new String[20];
    int n[]=new int[20];
    int sub;
 //int qty=Integer.parseInt(q);
  int tot=0;

//int  w = Integer.parseInt(request.getParameter("j"));
String[] values=request.getParameterValues("t");
String [] quan=request.getParameterValues("quan");
	String user=(String)session.getAttribute("UserName");
	System.out.println(user);

if(values.length == 0){
out.println("<font color=black verdana><b>Hello"+user+"  <br> you haven't chosen any cd's(s) </b></font>");
}else{
out.println("<font color=black size=4 style=verdana><b> Hello "+user+"<br>Finally the cd(s) u have choosen </b><br></font>");
out.println("<font color=black style=verdana> Please fill up the order details form </font>");
try {
        PreparedStatement psmt = null;
	    ResultSet rs = null;
	    int total=0;
		int pr=0;
		int itemno=0;
		String code=" ";
		out.println("<html><head><style>.LFont {	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR:  black; FONT-FAMILY: verdana } .formText {	BORDER-RIGHT: #aaaaaa 1px solid; BORDER-TOP: #aaaaaa 1px solid; FONT-SIZE: 11px; BORDER-LEFT: #aaaaaa 1px solid; COLOR: pink; BORDER-BOTTOM: #aaaaaa 1px solid; FONT-FAMILY: verdana} .white10 {	FONT-SIZE: 10pt; COLOR: #ffcc00; FONT-FAMILY: Arial, Helvetica,sans-serif}.white10 A:link {	COLOR:  #ffcc00; TEXT-DECORATION: none}.white10 A:visited {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:active {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:hover {	COLOR:red; TEXT-DECORATION: none}</style></head> <body background=ban.GIF> <form  action=Final.jsp><center> 		<table border=10>");
	
			out.println("<tr class=LFont><td>Item Name</td><td> Price(each)</td><td>  Film Name  </td><td>Amount</td></tr>");
		
		int s1=0,v=0;
		String des="",film="",iname="";
		for(int j=0;j<quan.length;j++)
		{
			 s1=Integer.parseInt(quan[j]);
			System.out.println(s1);

			if(s1>0)
		{
	   for(int i=j;i<values.length;i++)
		{
		 psmt=con.prepareStatement("select itemname,price,film from cart where itemname=?");
		 psmt.setString(1,values[i]);

           rs=psmt.executeQuery();
		  while(rs.next())
			{ 
			  iname=rs.getString(1);
			  pr=rs.getInt(2);
			 film=rs.getString(3);
			}
			 v=s1*pr;

			des=des+iname+","+film.trim()+","+pr+"and";
			
    		out.println(" <tr class=LFont><center>");
			out.println("<td><center>"+iname+"</center></td>");
			out.println("<td><center>"+pr+"</center></td>");
			out.println("<td><center>"+film+"</center></td>");
			out.println("<td><center>"+v+"</center></td></font></tr>");
		
			total=total+v;
			
			break;
		}
		}
	}
	PreparedStatement ps;
Statement os=con.createStatement();
ResultSet ros=os.executeQuery("select orno from forder order by orno");

int orno=0;
while(ros.next())
 orno=ros.getInt(1);
int jorno=orno+1;

ps=con.prepareStatement("insert into forder(orno,ordes,amount,userid)  values (?,?,?,?)");
ps.setInt(1,jorno);
ps.setString(2,des);
ps.setInt(3,total);
ps.setString(4,user);
ps.executeUpdate();

    
ros.close();
os.close();

/*Statement stmt=con.createStatement();
	stmt.executeUpdate("delete from cart ");*/

	/*stmt.close();
	con.close();*/
	
	//session.setAttribute("total",total);
	out.println("<tr class=LFont><td></td><td></td><td align=center>Total</td><td align=center>"+total+"</td></tr>");
	%>
	</table>
	<%
		out.println ("<table><tr class=LFont><td>Enter ur Credit card Number :</td><td><input type=text name=\"ccd\"></td></tr><tr class=LFont><td>Select the type of Credit Card:</td><td><select name=type><option>Visa Card</option><option>Master Card</option></select></td></tr><tr class=LFont><td>Select the type of Shipping:</td><td><select name=stype><option>Air Mail</option><option>Ship Mail</option></select></td></tr><tr class=LFont><td><input type =submit value=Order Now></td><td><input  type=reset value=Reset></td></tr><input type=hidden name=st value=\""+jorno+"\" ></table></form>");
}catch(Exception e){out.println("<font color=red>"+e);}	
}

%>
