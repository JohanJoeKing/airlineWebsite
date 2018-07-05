<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉贵客府邸</title>
<style>
   .a td{font-family:微软雅黑;font-size:18px;color:#009999}
   h4{font-family:微软雅黑;font-size:12px;color:#009999}
   a{font-family:微软雅黑;color:#0099FF}
</style>
</head>
<body>
<%
   response.setCharacterEncoding("UTF-8");

   String username = (String)session.getAttribute("username");
   String account = (String)session.getAttribute("account");
   String password = (String)session.getAttribute("password");
   String sex = (String)session.getAttribute("sex");
   String birthday = (String)session.getAttribute("birthday");
   String money = (String)session.getAttribute("money");
   String status = (String)session.getAttribute("status");
%>
<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFCC">
  <tr>
    <td colspan="2">
	  <h4>欢迎<%= username %>!</h4>	</td>
    <td><div align="right"><a href="admin.jsp">管理</a></div></td>
  </tr>
  <tr>
    <td colspan="5"><img src="images/login_input_01.jpg" width="900" height="100" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td width="250" height="80" bordercolor="#0099FF" bgcolor="#FFFFCC"><p>用户名：(username)</p>
    <p><%= username %></p></td>
    <td width="250" bordercolor="#0099FF" bgcolor="#FFFFCC"><p>性别：(sex)</p>
    <p><%= sex %></p></td>
    <td width="400" colspan="3" rowspan="5"><img src="images/register_input_01.jpg" width="400" height="400"></td>
  </tr>
  <tr bordercolor="#0099FF">
    <td height="80"><p>账号：(account)</p>
    <p><%= account %></p></td>
    <td height="80"><p>余额：(money)</p>
    <p><%= money %></p></td>
  </tr>
  <tr bordercolor="#0099FF">
    <td height="80"><p>生日：(birthday)</p>
    <p><%= birthday %></p></td>
    <td height="80"><p>等级：(rank)</p>
    <p><%= status %></p></td>
  </tr>
  <tr>
    <td height="80"><a href="perchase.jsp"><img src="images/buy_user.jpg" width="250" height="80" border="0"></a></td>
    <td height="80"><a href="check.jsp"><img src="images/check_user.jpg" width="250" height="80" border="0"></a></td>
  </tr>
  <tr>
    <td><a href="login_input.html"><img src="images/logout_user.jpg" width="250" height="80" border="0"></a></td>
    <td><a href="cancel.jsp"><img src="images/cancel_user.jpg" width="250" height="80" border="0"></a></td>
  </tr>
</table>
<table class="a"  width="900" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFCC">
  <tr>
    <td colspan="6"><a href="change_password.jsp?password=<%= password %>">修改密码</a></td>
  </tr>
  <tr>
    <td colspan="6">我的机票(my tickets):</td>
  </tr>
  <tr>
    <td width="180">出发(Departure)</td>
    <td width="180">到达(Arrival)</td>
    <td width="180">航班(Flight)</td>
    <td width="180">日期(Date)</td>
    <td width="180">起飞时间(Time)</td>
	<td width="180">座舱类型(Seat)</td>
  </tr>
  <%
  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/airlines";
  String USERNAME = "root";
  String PASSWORD = "20153178";
  Connection con = DriverManager.getConnection(url,USERNAME,PASSWORD);
  String sql = "select ticket_ID from tickets where account=" + account;
  Statement stmt = con.createStatement();
  ResultSet rs = stmt.executeQuery(sql);
  
  String ticket_ID = null;
  while(rs.next()){
	  ticket_ID = rs.getString("ticket_ID");
  }
  if(ticket_ID == null){
	  %>
	  <tr>
      <td width="180">无</td>
      <td width="180">无</td>
      <td width="180">无</td>
      <td width="180">无</td>
      <td width="180">无</td>
	  <td width="180">无</td>
      </tr>
	  <%
  }
  else{
	  String SEAT = "普通舱";
	  String[] t = new String[20];
	  int i = 0;
	  for(i=0;i<20;i++)
		  t[i] = "0";
	  
	  sql = "select * from tickets where account=" + account;
	  rs = stmt.executeQuery(sql);
	  i = 0;
	  while(rs.next()){
		  t[i] = rs.getString("ticket_ID");
		  if(i < 20)
			  i++;
		  else
			  break;
	  }
	  
	  i = 0;
	  while(t[i] != "0"){
	  sql = "select * from flight_timetable where ID=" + t[i];
	  rs = stmt.executeQuery(sql);
	  while(rs.next()){
		  String flight = rs.getString("line");
		  String departure = rs.getString("departure");
		  String terminal = rs.getString("terminal");
		  String year = rs.getString("tyear");
		  String month = rs.getString("tmonth");
		  String day = rs.getString("tday");
		  String hour = rs.getString("thour");
		  String minute = rs.getString("tminute");
		  
		  String DATE = year + "年" + month + "月" + day;
		  String TIME = hour + ":" + minute;
		  %>
		     <tr>
		        <td><%= departure %></td>
		        <td><%= terminal %></td>
		        <td><%= flight %></td>
		        <td><%= DATE %></td>
		        <td><%= TIME %></td>
		        <td><%= SEAT %></td>
		     </tr>
		  <%
	  }
	  if(i < 20)
		  i++;
	  else
		  break;
	  }
  }
  
  rs.close();
  stmt.close();
  con.close();
  %>
          <tr>
            <td colspan="6"><img src="images/borderLine2.jpg" width="900" height="30"></td>
          </tr>
          <tr>
            <td colspan="6"><table width="900" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><a href="recharge_input.jsp"><img src="images/recharge.jpg" width="450" height="80" border="0"></a></td>
                <td><a href="update_input.jsp"><img src="images/VIP.jpg" width="450" height="80" border="0"></a></td>
              </tr>
            </table></td>
          </tr>
  <tr>
    <td colspan="6"><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>


<map name="Map"><area shape="rect" coords="52,15,363,85" href="homepage.html">
</map></body>
</html>