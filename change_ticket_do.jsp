<%@ page  pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<html>
<head>
<title>改签成功！</title>
<style>
   .a td{font-family:微软雅黑;color:#0099FF;font-size:18px}
</style>
</head>
<body>
<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="6" bgcolor="#FFFFCC"><img src="images/login_input_01.jpg" width="900" height="100" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td width="150" bgcolor="#FFFFCC">航班</td>
    <td width="150" bgcolor="#FFFFCC">出发城市</td>
    <td width="150" bgcolor="#FFFFCC">到达城市</td>
    <td width="150" bgcolor="#FFFFCC">起飞时间</td>
    <td width="150" bgcolor="#FFFFCC">到达时间</td>
    <td width="150" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>


<%
   // ==================================================================================
   // 获取改签的航班ID以及账户信息
   request.setCharacterEncoding("UTF-8");
   String ID = request.getParameter("ID");
   String flight = request.getParameter("Line");
   
   // 连接数据库
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String username = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,username,password);
   
   // ==================================================================================
   // 显示所有所选航班飞行信息
   String sql = "select * from flight_timetable where line=?";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1,flight);
   ResultSet rs = pstmt.executeQuery();
   
   while(rs.next()){
         String nID = rs.getString("ID");
	     String line = rs.getString("line");
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
  <tr>
    <td><%= flight %></td>
    <td><%= DEcity %></td>
    <td><%= ARcity %></td>
    <td><%= dtime %></td>
    <td><%= atime %></td>
    <td><a href="change_ticket_done.jsp?ID1=<%= ID %>&ID2=<%= nID %>">确认改签</a></td>
  </tr>
<%
   }
   rs.close();
   pstmt.close();
   con.close();
%>
  <tr>
    <td colspan="6"><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>

<map name="Map"><area shape="rect" coords="53,16,367,84" href="change_ticket.jsp">
</map></body>
</html>