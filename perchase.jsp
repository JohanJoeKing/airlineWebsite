<%@ page pageEncoding="UTF-8" import="java.util.*"%>
<html>
<head>
<title>跳转中...</title>
</head>
<body>
<%
   session.setAttribute("frontpage", "perchase.jsp");
   response.setHeader("Refresh", "0;url = if_logged.jsp");
%>
</body>
</html>