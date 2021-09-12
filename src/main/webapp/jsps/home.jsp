<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to the Demo!</title>
</head>
</head>
<body>
<h1 align="center">Welcome to the Demo!</h1>
<br>
<% 
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: "+inetAddress.getHostName()); 
%>
<br>
</h1>
<hr>
<div style="text-align: center;">
	<span style="font-weight: bold;">
		Have a great day.
		<br>
		<a href="mailto:devopstrainingblr@gmail.com">Mail to Mithun Technologies</a>
	</span>
</div>
<hr>
	
<hr>
<hr>


</body>
</html>
