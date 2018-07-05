<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>跳转中...</title>
<style>
   .a td{font-family:微软雅黑;color:#0099FF;font-size:18px}
</style>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String departure = request.getParameter("DEcity");
   String terminal = request.getParameter("ARcity");
   String tyear = request.getParameter("tyear");
   String tmonth = request.getParameter("tmonth");
   String tday = request.getParameter("tday");
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String username = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,username,password);
   String sql = "select * from flight_timetable where departure=" + departure + " and terminal=" + terminal + " and tmonth=" + tmonth;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
%>
<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="10"><img src="images/login_input_01.jpg" width="900" height="100"></td>
  </tr>
  <tr>
    <td width="90" bgcolor="#FFFFCC">航班</td>
    <td width="90" bgcolor="#FFFFCC">出发城市</td>
    <td width="90" bgcolor="#FFFFCC">到达城市</td>
    <td width="90" bgcolor="#FFFFCC">出发日期</td>
    <td width="90" bgcolor="#FFFFCC">起飞时间</td>
    <td width="90" bgcolor="#FFFFCC">到达日期</td>
    <td width="90" bgcolor="#FFFFCC">到达时间</td>
    <td width="90" bgcolor="#FFFFCC">票价</td>
    <td width="90" bgcolor="#FFFFCC">时长</td>
    <td width="90" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  <%
  while(rs.next()){
	     String flight = rs.getString("line");
		 String ID = rs.getString("ID");
		 String thour = rs.getString("thour");
		 String tminute = rs.getString("tminute");
		 String ayear = rs.getString("ayear");
		 String amonth = rs.getString("amonth");
		 String aday = rs.getString("aday");
		 String ahour = rs.getString("ahour");
		 String aminute = rs.getString("aminute");
		 String timeLength = rs.getString("timeLength");
		 String price = rs.getString("price");
		 
		 String ddate = tmonth + "月" + tday + "日";
		 String dtime = thour + ":" + tminute;
		 String adate = amonth + "月" + aday + "日";
		 String atime = ahour + ":" + aminute;
  %>
  <tr>
    <td><%= flight %></td>
    <td><%= departure %></td>
    <td><%= terminal %></td>
    <td><%= ddate %></td>
    <td><%= dtime %></td>
    <td><%= adate %></td>
    <td><%= atime %></td>
    <td><%= price %></td>
    <td><%= timeLength %></td>
    <td><a herf="perchase_assure.jsp?ID=<%= ID %>">购票</a></td>
  </tr>
  <%
     }
  %>
  <tr>
    <td colspan="10"><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>
</body>
</html>