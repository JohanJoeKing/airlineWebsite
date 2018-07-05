<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉航空管理员界面</title>
<script type="text/javascript" src="javascripts/admin.js">
</script>
<style>
   .a td{font-family:微软雅黑;color:#0099CC;font-size:18px}
</style>
</head>
<body>
<%
   String sta = (String)session.getAttribute("status");
   if(!sta.equals("管理员")){
	   %>
	      <script>window.alert('您不是管理员！');</script>
	   <%
	   response.setHeader("Refresh", "0;userpage.jsp");
   }
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String username = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,username,password);
   String sql = "select * from flight_timetable";
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
%>

<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><img src="images/admin.jpg" width="900" height="100" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td width="300"><a href="#launch"><img src="images/launch_flight.jpg" width="300" height="100" border="0"></a></td>
    <td width="300"><a href="#cancel"><img src="images/cancel_flight.jpg" width="300" height="100" border="0"></a></td>
    <td width="300"><a href="#setPrice"><img src="images/price_flight.jpg" width="300" height="100" border="0"></a></td>
  </tr>
  <tr>
    <td colspan="3"><img src="images/borderLine3.jpg" width="900" height="30"></td>
  </tr>
</table>

<p>&nbsp;</p>
<p>
  <map name="Map">
    <area shape="rect" coords="55,12,363,90" href="userpage.jsp">
  </map>
  
</p>
<table class="a" width="1300" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#006699">
  <tr>
    <td width="80" bgcolor="#FFFFCC">航班</td>
    <td width="190" bgcolor="#FFFFCC">航班编号</td>
    <td width="100" bgcolor="#FFFFCC">出发-到达</td>
    <td width="80" bgcolor="#FFFFCC">票价</td>
    <td width="100" bgcolor="#FFFFCC">出发日期</td>
    <td width="100" bgcolor="#FFFFCC">起飞时间</td>
    <td width="100" bgcolor="#FFFFCC">到达日期</td>
    <td width="100" bgcolor="#FFFFCC">到达时间</td>
    <td width="100" bgcolor="#FFFFCC">时长</td>
    <td width="100" bgcolor="#FFFFCC">头等舱剩余</td>
    <td width="100" bgcolor="#FFFFCC">经济舱剩余</td>
  </tr>
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
    	 String departure = rs.getString("departure");
    	 String terminal = rs.getString("terminal");
    	 String price = rs.getString("price");
    	 int VIPleft = rs.getInt("VIPleft");
    	 int NOMleft = rs.getInt("NOMleft");
    	 
    	 String ddate = tmonth + "月" + tday + "日";
    	 String dtime = thour + ":" + tminute;
    	 String adate = amonth + "月" + aday + "日";
    	 String atime = ahour + ":" + aminute;
		 String cities = departure + "-" + terminal;
  %>
  <tr>
    <td><%= flight %></td>
    <td><%= ID %></td>
    <td><%= cities %></td>
    <td><%= price %></td>
    <td><%= ddate %></td>
    <td><%= dtime %></td>
    <td><%= adate %></td>
    <td><%= atime %></td>
    <td><%= timeLength %></td>
    <td><%= VIPleft %></td>
    <td><%= NOMleft %></td>
  </tr>
  <%
     }
  %>
</table>

<p>&nbsp;</p>
<form name="form1" method="post" action="admin_add_flight.jsp" onSubmit="return check()">
<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" bgcolor="#FFFFCC">发布航班：<a name="launch"></a></td>
  </tr>
  <tr>
    <td width="300" bordercolor="#0099CC">
      <label>客机号
        <select name="line" style="width:200px">
        <%
           sql = "select * from FRairlines";
           rs = stmt.executeQuery(sql);
           while(rs.next()){
        	   String L = rs.getString("airline");
        	   %>
        	      <option><%= L %></option>
        	   <%
           }
        
           sql = "select distinct cityname from city";
           rs = stmt.executeQuery(sql);
        %>
        </select>
        </label>    </td>
    <td width="300">
      <label>出发城市
        <select name="DEcity" style="width:200px">
        <%
           while(rs.next()){
        	   String C = rs.getString("cityname");
        	   %>
        	      <option><%= C %></option>
        	   <%
           }
        
           sql = "select distinct cityname from city";
           rs = stmt.executeQuery(sql);
        %>
        </select>
        </label>    </td>
    <td width="300">
      <label>到达城市
        <select name="ARcity" style="width:200px">
        <%
           while(rs.next()){
        	   String C = rs.getString("cityname");
        	   %>
        	      <option><%= C %></option>
        	   <%
           }
        %>
        </select>
        </label>    </td>
  </tr>
  <tr>
    <td colspan="3" bgcolor="#FFFFCC">出发日期：</td>
  </tr>
  <tr>
    <td>
      <label>年份
      <select name="tyear" style="width:200px">
         <option>2017</option>
         <option>2018</option>
         <option>2019</option>
      </select>
      </label>    </td>
    <td>
      <label>月份
        <select name="tmonth" style="width:200px">
        <%
           for(int i = 1;i<=12;i++){
        	   String s = String.valueOf(i);
        	   %>
        	      <option><%= s %></option>
        	   <%
           }
        %>
        </select>
        </label>    </td>
    <td>
      <label>日
        <select name="tday" style="width:200px">
        <%
           for(int i = 1;i<=31;i++){
        	   String s = String.valueOf(i);
        	   %>
        	      <option><%= s %></option>
        	   <%
           }
        %>
        </select>
        </label>    </td>
  </tr>
  <tr>
    <td colspan="3" bgcolor="#FFFFCC">到达日期：</td>
  </tr>
  <tr>
    <td>
      <label>年份
        <select name="ayear" style="width:200px">
           <option>2017</option>
           <option>2018</option>
           <option>2019</option>
        </select>
        </label>    </td>
    <td>
      <label>月份
        <select name="amonth" style="width:200px">
        <%
           for(int i = 1;i<=12;i++){
        	   String s = String.valueOf(i);
        	   %>
        	      <option><%= s %></option>
        	   <%
           }
        %>
        </select>
        </label>    </td>
    <td>
      <label>日
        <select name="aday" style="width:200px">
        <%
           for(int i = 1;i<=31;i++){
        	   String s = String.valueOf(i);
        	   %>
        	      <option><%= s %></option>
        	   <%
           }
        %>
        </select>
        </label>    </td>
  </tr>
  <tr>
    <td bgcolor="#FFFFCC">起飞时间：</td>
    <td bgcolor="#FFFFCC">时 
      <input type="text" name="thour"></td>
    <td bgcolor="#FFFFCC">分
      <input name="tminute" type="text"></td>
  </tr>
  <tr>
    <td>到达时间：</td>
    <td>时
      <input name="ahour" type="text"></td>
    <td>分
      <input name="aminute" type="text"></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFCC">
      <label>飞行时长
        <input type="text" name="timeLength">
      </label>    </td>
    <td bgcolor="#FFFFCC"><label>票价
        <input type="text" name="price">
    </label></td>
    <td bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">
      <label>
        <div align="center">
          <input type="submit" name="Submit" value="提交">
        </div>
      </label>    </td>
  </tr>
  
  <tr>
    <td colspan="3"><img src="images/borderLine3.jpg" width="900" height="30"></td>
  </tr>
</table>
</form>

<form name="form2" method="post" action="admin_cancel_flight.jsp">
<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFCC">取消航班：<a name="cancel"></a></td>
  </tr>
  <tr>
    <td>
      <label>航班编号
        <select name="ID"  style="width:300px">
        <%
           sql = "select ID from flight_timetable";
           rs = stmt.executeQuery(sql);
           while(rs.next()){
        	   String I = rs.getString("ID");
        	   %>
        	      <option><%= I %></option>
        	   <%
           }
        %>
        </select>
        </label>    </td>
  </tr>
  <tr>
    <td bgcolor="#FFFFCC">
      <label>
        <div align="center">
          <input type="submit" name="Submit2" value="提交">
        </div>
      </label>    </td>
  </tr>
  <tr>
    <td><img src="images/borderLine3.jpg" width="900" height="30"></td>
  </tr>
</table>
</form>


<form name="form3" method="post" action="admin_set_price.jsp" onSubmit="return check_p()">
<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" bgcolor="#FFFFCC">航班定价：<a name="setPrice"></a></td>
  </tr>
  <tr>
    <td width="450">
      <label>航班ID
        <select name="ID"  style="width:300px">
        <%
           sql = "select ID from flight_timetable";
           rs = stmt.executeQuery(sql);
           while(rs.next()){
        	   String I = rs.getString("ID");
        	   %>
        	      <option><%= I %></option>
        	   <%
           }
        %>
        </select>
        </label>    </td>
    <td width="450">
      <label>定价
        <input type="text" name="price">
        </label>    </td>
  </tr>
  <tr>
    <td colspan="2" bgcolor="#FFFFCC">
      <label>
        <div align="center">
          <input type="submit" name="Submit3" value="提交">
        </div>
      </label>    </td>
  </tr>
  <tr>
    <td colspan="2"><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>
</form>
<%
   rs.close();
   stmt.close();
   con.close();
%>

</body>
</html>