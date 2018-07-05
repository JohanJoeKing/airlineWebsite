<%@ page pageEncoding="UTF-8" import="java.sql.*"%>
<html>
<head>
<title>验证中...</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String account = request.getParameter("account");
   String Pw = request.getParameter("password");

   session.removeAttribute("username");
   session.removeAttribute("account");
   session.removeAttribute("password");
   session.removeAttribute("sex");
   session.removeAttribute("birthday");
   session.removeAttribute("money");
   session.removeAttribute("status");
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String username = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,username,password);
   String sql = "select password from users where account=" + account;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   String pw = null;
   while(rs.next()){
      pw = rs.getString("password");
   }
   
   if(pw == null){
   %>
   <script>window.alert('空号，请重新登录！');</script>
   <%
      response.setHeader("Refresh", "0;login_input.html");
   }else if(!(pw.equals(Pw))){
   %>
   <script>window.alert('密码不正确，请重新登录！');</script>
   <%
      response.setHeader("Refresh", "0;login_input.html");
   }else{
	   sql = "select * from users where account=" + account;
	   rs = stmt.executeQuery(sql);
	   rs.next();
	   String sex = rs.getString("sex");
	   String un = rs.getString("username");
	   String birthday = rs.getString("birthday");
	   int status = rs.getInt("status");
	   int money = rs.getInt("money");
	   String m = String.valueOf(money);
	   String Sta = null;
	   if(status == 0){
		   Sta = "管理员";
	   }
	   else if(status == 1){
		   Sta = "普通用户";
	   }
	   else if(status == 2){
		   Sta = "VIP用户";
	   }
	   else{
		   Sta = "SVIP用户";
	   }
	   
	   session.setAttribute("username", un);
	   session.setAttribute("account", account);
	   session.setAttribute("sex", sex);
	   session.setAttribute("password", pw);
	   session.setAttribute("birthday", birthday);
	   session.setAttribute("status", Sta);
	   session.setAttribute("money", m);
	   
	   response.setHeader("Refresh", "0;userpage.jsp");
   }
   
   rs.close();
   stmt.close();
   con.close();
%>
</body>
</html>