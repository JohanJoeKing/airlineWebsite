<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉航空——确认购票</title>
<style>
   .a td{font-family:微软雅黑;color:#0099CC;font-size:18px}
</style>
</head>
<body>
<%
   
   request.setCharacterEncoding("UTF-8");
   String ID = request.getParameter("ID");
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String UN = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,UN,password);
   String sql = "select * from flight_timetable where ID=" + ID;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   
   String flight = null;
   String price = null;
   String departure = null;
   String terminal = null;
   String NOMleft = null;
   String ddate = null;
   String dtime = null;
   
   while(rs.next()){
	   flight = rs.getString("line");
	   price = rs.getString("price");
	   departure = rs.getString("departure");
	   terminal = rs.getString("terminal");
	   NOMleft = rs.getString("NOMleft");
	   String dm = rs.getString("tmonth");
	   String dd = rs.getString("tday");
	   String dh = rs.getString("thour");
	   String dmi = rs.getString("tminute");
	   
	   ddate = dm + "月" + dd + "日";
	   dtime = dh + ":" + dmi;
   }
   
   String account = (String)session.getAttribute("account");
   String username = (String)session.getAttribute("username");
%>
<form name="form1" method="post" action="perchase_do?ID=<%= ID %>.jsp">
<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5"><img src="images/login_input_01.jpg" width="900" height="100" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td height="50" colspan="4"><img src="images/assure.jpg" width="500" height="50"></td>
    <td width="400" rowspan="7"><img src="images/furong.jpg" width="400" height="400"></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td width="125" height="50">乘机人姓名</td>
    <td width="125">联系电话</td>
    <td width="125">航班</td>
    <td width="125">票价</td>
  </tr>
  <tr>
    <td height="50"><%= username %></td>
    <td><%= account %></td>
    <td><%= flight %></td>
    <td><%= price %></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td height="50">出发</td>
    <td>到达</td>
    <td>日期</td>
    <td>起飞时间</td>
  </tr>
  <tr>
    <td height="50"><%= departure %></td>
    <td><%= terminal %></td>
    <td><%= ddate %></td>
    <td><%= dtime %></td>
  </tr>
  <tr>
    <td colspan="2" bgcolor="#FFFFCC">
      <label>座舱类型
        <select name="seat" style="width:100px">
          <option>头等舱</option>
          <option selected>经济舱</option>
        </select>
        </label>
    <td height="50" colspan="2" bgcolor="#FFFFCC">
      <label>购票数量
        <select name="amount" style="width:100px">
          <option>1</option>
          <option>2</option>
        </select>
        </label>
    
    <td colspan="2" bgcolor="#FFFFCC">
      </td>
  </tr>
  <tr>
    <td colspan="2"><img src="images/perchase_yes.jpg" width="250" height="100" border="0" usemap="#Map2"></td>
    <td colspan="2"><img src="images/perchase_no.jpg" width="250" height="100" border="0" usemap="#Map3"></td>
  </tr>
  <tr>
    <td colspan="5"><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>
</form>
<map name="Map"><area shape="rect" coords="50,17,366,86" href="userpage.jsp">
</map>
<map name="Map2"><area shape="rect" coords="41,26,209,75" href="perchase_do.jsp?ID=<%= ID %>">
</map>
<map name="Map3"><area shape="rect" coords="45,28,207,73" href="userpage.jsp">
</map>
<%
   rs.close();
   stmt.close();
   con.close();
%>

</body>
</html>