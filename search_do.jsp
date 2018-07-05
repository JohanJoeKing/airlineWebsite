<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉航空——查票结果</title>
<meta content="text/html; charset=utf8" />
<style>
   .a td{font-family:微软雅黑;color:#003366;font-size:18px}
   h2{font-family:微软雅黑;color:#0099CC;text-align:center}
   p{font-family:微软雅黑;color:#FF3333;font-size:24px}
   a{font-family:微软雅黑;color:#33CC66;font-size:18px}
</style>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String departure = request.getParameter("departure");
   String terminal = request.getParameter("terminal");
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String username = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,username,password);
   String sql = "select * from flight_timetable where departure=? and terminal=?";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1,departure);
   pstmt.setString(2,terminal);
   ResultSet rs = pstmt.executeQuery();
%>
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/perchase.jpg" width="1100" height="100" border="0" usemap="#Map"></td>
  </tr>
</table>

<h2>查询结果</h2>

<%
   while(rs.next()){
	 String flight = rs.getString("line");
	 String ID = rs.getString("ID");
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
	 String timeLength = rs.getString("timeLength");
	 String price = rs.getString("price");
	 int VIPleft = rs.getInt("VIPleft");
	 int NOMleft = rs.getInt("NOMleft");
	 
	 String ddate = tmonth + "月" + tday + "日";
	 String dtime = thour + ":" + tminute;
	 String adate = amonth + "月" + aday + "日";
	 String atime = ahour + ":" + aminute;
%>

<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="4"><img src="images/borderLine3.jpg" width="900" height="30"></td>
  </tr>
  <tr>
    <td width="225" bgcolor="#FFFFCC">出发城市</td>
    <td width="225" bgcolor="#FFFFCC">到达城市</td>
    <td width="225" bgcolor="#FFFFCC">航班</td>
    <td width="225" bgcolor="#FFFFCC">票价</td>
  </tr>
  <tr>
    <td><p><%= departure %></p></td>
    <td><p><%= terminal %></p></td>
    <td><p><%= flight %></p></td>
    <td><p>￥<%= price %></p></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFCC">起飞日期</td>
    <td bgcolor="#FFFFCC">起飞时间</td>
    <td bgcolor="#FFFFCC">到达日期</td>
    <td bgcolor="#FFFFCC">到达时间</td>
  </tr>
  <tr>
    <td><%= ddate %></td>
    <td><%= dtime %></td>
    <td><%= adate %></td>
    <td><%= atime %></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFCC">时长</td>
    <td bgcolor="#FFFFCC">VIP座舱剩余</td>
    <td bgcolor="#FFFFCC">普通客舱剩余</td>
    <td bgcolor="#FFFFCC">前往购票</td>
  </tr>
  <tr>
    <td><%= timeLength %></td>
    <td><%= VIPleft %></td>
    <td><%= NOMleft %></td>
    <td><a href="perchase_assure.jsp?ID=<%= ID %>">购票</a></td>
  </tr>
</table>

<%
   }
%>

<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>
<%
   pstmt.close();
   con.close();
%>

<map name="Map"><area shape="rect" coords="54,14,366,89" href="homepage.html">
</map></body>
</html>