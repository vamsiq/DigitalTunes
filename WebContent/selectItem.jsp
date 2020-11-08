<html>
<body background="ban.GIF" 
            bgcolor="chocalate"
                  text="BLUE"
                  vlink="red" link="blue">
<%

	String cat=request.getParameter("category");
	String type=request.getParameter("type");
	//out.println(cat+"  "+type);
	out.println("<CENTER><H2><font color=green face=arial>Select More options from this list</font></H2> <form action=insertItem.jsp method=post>Select itemname :<br>");
out.println("<input type=hidden name=cat value=\" "+cat+" \">");
out.println("<input type=hidden name=type value=\" "+type+" \">");
//========
if(cat.equalsIgnoreCase("film") &&  type.equalsIgnoreCase("new"))
{
out.println("<input type=radio name=itemname value=NF>New Film1<BR><input type=radio name=itemname value=NF1>New Film2<br><BR>");
}
if(cat.equalsIgnoreCase("film") &&  type.equalsIgnoreCase("old"))
{
	out.println("<input type=radio name=itemname value=OF>Old Film1<BR><input type=radio name=itemname value=OF1>Old Film2<br><input type=radio name=itemname value=OF2>Old Film3<BR><BR>");
}
//=========
if(cat.equalsIgnoreCase("ghazal") &&  type.equalsIgnoreCase("new"))
{
out.println("<input type=radio name=itemname value=NG>New Ghazal1<BR><input type=radio name=itemname value=NG1>New Ghazal2<br><input type=radio name=itemname value=NG2>New Ghazal3<BR><br>");
}
if(cat.equalsIgnoreCase("ghazal") &&  type.equalsIgnoreCase("old"))
{
	out.println("<input type=radio name=itemname value=og>Old Ghazal1<BR><input type=radio name=itemname value=og1>Old Ghazal2<br><input type=radio name=itemname value=og2>Old Ghazal3<BR><BR>");
}
//========

if(cat.equalsIgnoreCase("pop") &&  type.equalsIgnoreCase("new"))
{
out.println("<input type=radio name=itemname value=NP>New Pop1<BR><input type=radio name=itemname value=NP1>New Pop2<br><input type=radio name=itemname value=NP2>New Pop3<BR><BR>");
}
if(cat.equalsIgnoreCase("pop") &&  type.equalsIgnoreCase("old"))
{
	out.println("<input type=radio name=itemname value=OP>Old Pop1<BR><input type=radio name=itemname value=OP1>Old Pop2<br><input type=radio name=itemname value=OP2>Old Pop3<BR><BR>");
}

//========

if(cat.equalsIgnoreCase("devotional") &&  type.equalsIgnoreCase("new"))
{
out.println("<input type=radio name=itemname value=ND>New Devotional1<BR><input type=radio name=itemname value=ND1>New Devotional2<br><BR>");
}
if(cat.equalsIgnoreCase("devotional") &&  type.equalsIgnoreCase("old"))
{
	out.println("<input type=radio name=itemname value=od>Old Devotional1<BR><input type=radio name=itemname value=od1>Old Devotional2<BR><BR>");
}
//===========


if(cat.equalsIgnoreCase("rock") &&  type.equalsIgnoreCase("new"))
{
out.println("<input type=radio name=itemname value=NR>New Rock1<BR><input type=radio name=itemname value=NR1>New Rock2<br><input type=radio name=itemname value=NR2>New Rock3<BR><BR>");
}
if(cat.equalsIgnoreCase("rock") &&  type.equalsIgnoreCase("old"))
{
	out.println("<input type=radio name=itemname value=OR>Old Rock1<BR><input type=radio name=itemname value=OR1>Old Rock2<br><input type=radio name=itemname value=OR2>Old Rock3<BR><BR>");
}

//========

if(cat.equalsIgnoreCase("classical") &&  type.equalsIgnoreCase("new"))
{
out.println("<input type=radio name=itemname value=NC>New Classical1<BR><input type=radio name=itemname value=NC1>New Classical2<br><input type=radio name=itemname value=NC2>New Classical2<BR><BR>");
}
if(cat.equalsIgnoreCase("classical") &&  type.equalsIgnoreCase("old"))
{
	out.println("<input type=radio name=itemname value=OC>Old Classical1<BR><input type=radio name=itemname value=OC1>Old Classical2<br><input type=radio name=itemname value=OC2>Old Classical2<BR><BR>");
}

//====================


if(cat.equalsIgnoreCase("folk") &&  type.equalsIgnoreCase("new"))
{
out.println("<input type=radio name=itemname value=NF>New Folk1<BR><input type=radio name=itemname value=NF1>New Folk2<br>");
}
if(cat.equalsIgnoreCase("folk") &&  type.equalsIgnoreCase("old"))
{
	out.println("<input type=radio name=itemname value=OF>Old Folk1<BR><input type=radio name=itemname value=OF1>Old Folk2<br><input type=radio name=itemname value=OF2>Old Folk3<BR>");
}

//=============
out.println("&nbsp;&nbsp;Quantity &nbsp;&nbsp;<input type=text name=quan><br><br>");
out.println("Film name&nbsp;&nbsp;<input type=text name=filmname><br><br>");
out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price&nbsp;&nbsp;&nbsp;<input type=text name=price><br><br>");
out.println("Singer&nbsp;&nbsp;<select name=singer><option value=pankaj>pankajudas</option><option value=jagjit>jagjitsingh</option><option value=various>various artist</option><option value=michel>michel</option></select><br><br>");
out.println("<input type=submit value=AddcdstoShop>&nbsp;&nbsp;&nbsp;");
out.println("<a href=addcds.html><font color=#CC0000 size=2 face=Arial, Helvetica, sans-serif><strong>Home</strong></font></a>");

	%>
