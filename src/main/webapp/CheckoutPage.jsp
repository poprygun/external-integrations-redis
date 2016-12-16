<%@ page import="io.pivotal.pal.config.SpringContextBridge" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
		 pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login Success Page</title>
</head>
<body>
<%
if(session.getAttribute("user") == null){
	response.sendRedirect("login.html");
}
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
}
}
%>
<h3>Hi <%=userName %>, here is the redis session data</h3>
<br>
<% for (String key : SpringContextBridge.redisService().sessionKeys()) { %>
<%= key %>
<br>
<% } %>
<br>
<form action="LogoutServlet" method="post">
<input type="submit" value="Logout" >
</form>
</body>
</html>