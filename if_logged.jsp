<%@ page pageEncoding="UTF-8" import="java.util.*"%>
<html>
<head>
<title>登录验证...</title>
</head>
<body>
<%
   String username = (String)session.getAttribute("username");
   if(username != null){
	   String fpage = (String)session.getAttribute("frontpage");
	   if(fpage.equals("login.jsp")){
		   response.setHeader("Refresh", "0;userpage.jsp");
	   }else if(fpage.equals("cancel.jsp")){
		   response.setHeader("Refresh", "0;cancel_ticket.jsp");
	   }else if(fpage.equals("change.jsp")){
		   response.setHeader("Refresh", "0;change_ticket.jsp");
	   }else if(fpage.equals("check.jsp")){
		   response.setHeader("Refresh", "0;check_ticket.jsp");
	   }else if(fpage.equals("perchase.jsp")){
		   response.setHeader("Refresh", "0;search_input.jsp");
	   }else{
	   }
   }else{
	   %>
	      <script>window.alert('请先登录！')</script>
	   <%
	   response.setHeader("Refresh", "0;login_input.html");
   }
%>
</body>
</html>