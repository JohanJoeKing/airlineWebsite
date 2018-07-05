<%@ page pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<html>
<head>
<title>改签航班</title>
<style>
   .a td{font-family:微软雅黑;color:#0099FF;font-size:18px}
</style>
</head>
<body>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/login_input_01.jpg" width="900" height="100" border="0" usemap="#Map"></td>
  </tr>
</table>
<%
//===========================================================================
// 读取当前用户账号
String account = (String)session.getAttribute("account");

// 连接数据库
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/airlines";
String username = "root";
String password = "20153178";
Connection con = DriverManager.getConnection(url,username,password);

// ===========================================================================
// 查询所有相关航班
String[] ID = new String[20];
int i = 0;
for(i=0;i<20;i++)
	   ID[i] = null;
String sql = "select ticket_ID from tickets where account=" + account;
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
i = 0;
while(rs.next()){
	   ID[i] = rs.getString("ticket_ID");
	   i++;
}

// ===========================================================================
// 依次列出航班基本信息
i = 0;
while(i < 20){
sql = "select * from flight_timetable where ID=" + ID[i];
rs = stmt.executeQuery(sql);
while(rs.next()){
	     String flight = rs.getString("line");
	     String DEcity = rs.getString("departure");
	     String ARcity = rs.getString("terminal");
		 String tyear = rs.getString("tyear");
		 String tmonth = rs.getString("tmonth");
		 String tday = rs.getString("tday");
		 String thour = rs.getString("thour");
		 String tminute = rs.getString("tminute");
		 String ayear = rs.getString("ayear");
		 String amonth = rs.getString("amonth");
		 String aday = rs.getString("aday");
		 String ahour = rs.getString("ahour");
		 String aminute = rs.getString("aminute");
		 // 日期合并
		 String ddate = tmonth + "/" + tday + " ";
		 String dtime = ddate + thour + ":" + tminute;
		 String adate = amonth + "/" + aday + " ";
		 String atime = adate + ahour + ":" + aminute;
		 
		 %>
<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="6"><img src="images/borderLine3.jpg" width="900" height="30"></td>
  </tr>
  <tr>
    <td width="150" bgcolor="#FFFFCC">出发城市</td>
    <td width="150" bgcolor="#FFFFCC">到达城市</td>
    <td width="150" bgcolor="#FFFFCC">航班</td>
    <td width="150" bgcolor="#FFFFCC">起飞时间</td>
    <td width="150" bgcolor="#FFFFCC">到达时间</td>
    <td width="150" bgcolor="#FFFFCC">是否改签</td>
  </tr>
  <tr>
    <td><%= DEcity %></td>
    <td><%= ARcity %></td>
    <td><%= flight %></td>
    <td><%= dtime %></td>
    <td><%= atime %></td>
    <td><a href="change_ticket_do.jsp?ID=<%= ID[i] %>&Line=<%= flight %>">是</a></td>
  </tr>
</table>
		 
		 <%
}

i++;
}

rs.close();
stmt.close();
con.close();
%>

<map name="Map"><area shape="rect" coords="48,14,364,81" href="homepage.html">
</map>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>
</body>
</html>