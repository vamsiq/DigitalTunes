<%@ page session="true" %>

<html>
<head>
<style>
.LFont {	
FONT-WEIGHT: bold;
FONT-SIZE: 10pt;
COLOR:  black; 
FONT-FAMILY: verdana;
 } 
 .formText {
 BORDER-RIGHT: #aaaaaa 1px solid; 
 BORDER-TOP: #aaaaaa 1px solid;
 FONT-SIZE: 11px;
 BORDER-LEFT: #aaaaaa 1px solid; 
 COLOR: black; 
 BORDER-BOTTOM: #aaaaaa 1px solid; 
 FONT-FAMILY: verdana;
 } 
 .white10 {	
 FONT-SIZE: 10pt; 
 COLOR: black;
  FONT-FAMILY: Arial, Helvetica,sans-serif
  }
  .white10 A:link {
  	COLOR:  #ffcc00;
  	 TEXT-DECORATION: none
  	 }
  	 .white10 A:visited {	
  	 COLOR:#ffcc00; 
  	 TEXT-DECORATION: none
  	 }
  	 .white10 A:active {
  	 	COLOR:#ffcc00; 
  	 	TEXT-DECORATION: none
  	 	}.white10 A:hover {	
  	 	COLOR:red; 
  	 	TEXT-DECORATION: none
  	 	}
  	 	.style1 {
  	 	color: #336600}
</style>
</head> 
<body background=ban.GIF><br><br><br><br><br>

<%
session.invalidate();

%>
<center>
<b class="LFont">
<span class="style1">U Have Sucessfully Logged out. 
Want to visit Again</span><br>
<br>
<a href="login.html" target="_parent">Back to Login</a>
</b>
</center>
</body>
</html>

