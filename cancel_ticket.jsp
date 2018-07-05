<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>退票业务</title>
<style>
   .a td{font-family:微软雅黑;color:#0099FF;font-size:18px}
</style>
</head>
<body>
<%
   // =================================================================
   // 搜索该用户账下的所有机票
   String account = (String)session.getAttribute("account");
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String USERNAME = "root";
   String PASSWORD = "20153178";
   Connection con = DriverManager.getConnection(url,USERNAME,PASSWORD);
   String sql = "select ticket_ID from tickets where account=" + account;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   
   int i = 0;
   String[] f = new String[20];
   for(i=0;i<20;i++){
	   f[i] = "LS";
   }
   i = 0;
   while(rs.next()){
	   f[i] = rs.getString("ticket_ID");
	   if(i < 20)
		   i++;
	   else
		   break;
   }  
%>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/login_input_01.jpg" width="900" height="100" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td><img src="images/cancel_ticket.jpg" width="900" height="300"></td>
  </tr>
</table>
<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="225" bgcolor="#FFFFCC">航班</td>
    <td width="225" bgcolor="#FFFFCC">出发时间</td>
    <td width="225" bgcolor="#FFFFCC">起点-终点</td>
    <td width="225" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  <%
  i = 0;
  while(f[i] != "LS"){
	  sql = "select * from flight_timetable where ID=" + f[i];
	  rs = stmt.executeQuery(sql);
	  while(rs.next()){
      String flight = rs.getString("line");
      String tmonth = rs.getString("tmonth");
      String tday = rs.getString("tday");
      String thour = rs.getString("thour");
      String tminute = rs.getString("tminute");
      String DEcity = rs.getString("departure");
      String ARcity = rs.getString("terminal");
      
      String cities = DEcity + "-" + ARcity;
      String ttime = tmonth + "月" + tday + "  " + thour + ":" + tminute;
  %>
  <tr>
    <td><%= flight %></td>
    <td><%= ttime %></td>
    <td><%= cities %></td>
    <td><a href="cancel_ticket_do.jsp?ID=<%= f[i] %>">取消</a></td>
  </tr>
  <%
	 }
     i++;
     }
  
     rs.close();
     stmt.close();
     con.close();
  %>
  
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>

<map name="Map"><area shape="rect" coords="50,17,365,88" href="homepage.html">
</map></body>
</html>