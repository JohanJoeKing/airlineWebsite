<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉航班发布</title>
</head>
<body>
<%
   // =========================================================================
   // 接收来自 admin.jsp 管理员界面中 form1 表单提交想信息
   request.setCharacterEncoding("UTF-8");
   String line = request.getParameter("line");
   String DEcity = request.getParameter("DEcity");
   String ARcity = request.getParameter("ARcity");
   String tyear = request.getParameter("tyear");
   String tmonth = request.getParameter("tmonth");
   String tday = request.getParameter("tday");
   String thour = request.getParameter("thour");
   String tminute = request.getParameter("tminute");
   String ayear = request.getParameter("ayear");
   String amonth = request.getParameter("amonth");
   String aday = request.getParameter("aday");
   String ahour = request.getParameter("ahour");
   String aminute = request.getParameter("aminute");
   String timeLength = request.getParameter("timeLength");
   String price = request.getParameter("price");
   
   // =========================================================================
   // 转string为int类型后进行日期信息合法性的判断
   int ty = Integer.parseInt(tyear);
   int tmo = Integer.parseInt(tmonth);
   int td = Integer.parseInt(tday);
   int th = Integer.parseInt(thour);
   int tmi = Integer.parseInt(tminute);
   
   int ay = Integer.parseInt(ayear);
   int amo = Integer.parseInt(amonth);
   int ad = Integer.parseInt(aday);
   int ah = Integer.parseInt(ahour);
   int ami = Integer.parseInt(aminute);
   
   // =========================================================================
   // 判断录入信息的合法性，异常时flag为1
   int flag = 0;
   
   // year
   if(ty <= 0 || tmo <= 0 || td <= 0 || th < 0 || tmi < 0)
	   flag = 1;
   if(ay <= 0 || amo <= 0 || ad <= 0 || ah < 0 || ami < 0)
	   flag = 2;
   
   // month and day
   if(tmo == 4 || tmo == 6 || tmo == 9 || tmo == 11){
	   if(td >30)
		   flag = 3;
   }
   else{
	   if(td >31)
		   flag = 4;
   }
   
   if(amo == 4 || amo == 6 || amo == 9 || amo == 11){
	   if(ad >30)
		   flag = 5;
   }
   else{
	   if(ad >31)
		   flag = 6;
   }
   
   // Febrary
   if(tmo == 2){
	   if(ty % 400 == 0 || (ty % 4 == 0 && ty % 100 != 0)){
		   if(td <= 0 || td > 29)
			   flag = 7;
	   }
	   else{
		   if(td <= 0 || td > 28)
			   flag = 8;
	   }
   }
   
   if(amo == 2){
	   if(ay % 400 == 0 || (ay % 4 == 0 && ay % 100 != 0)){
		   if(ad > 29)
			   flag = 9;
	   }
	   else{
		   if(ad > 28)
			   flag = 10;
	   }
   }
   
   // =========================================================================
   // 判断价格定位是否合法
   int p = Integer.parseInt(price);
   if(p <= 0){
	   flag = 11;
   }
   
   // =========================================================================
   // 判断城市是否合法
   if(DEcity.equals(ARcity))
	   flag = 12;
   
   // =========================================================================
   // 判断时间是否合法
   if(th > 24 || tmi > 60)
	   flag = 13;
   if(ah > 24 || ami > 60)
	   flag = 14;
   
   // =========================================================================
   // 判断出发和到达日期是否合法
   if(ty <= ay){
	   if(tmo > amo)
		   flag = 15;
	   if(tmo == amo){
		   if(td > ad)
			   flag = 15;
		   if(td == ad){
			   if(th > ah)
				   flag = 15;
			   if(th == ah && tmi > ami)
				   flag = 15;
		   }
	   }
   }
   else
	   flag = 15;
   
   // =========================================================================
   // 当信息不合法时，提示并跳转回 admin.jsp 管理员界面
   if(flag > 0){
	   String str = null;
	   if(flag == 1){
		   str = "出发日期必须全为合法正整数！";
	   }
	   if(flag == 2){
		   str = "到达日期必须全为合法正整数！";
	   }
	   if(flag == 3){
		   str = "（出发）月份天数有误！";
	   }
	   if(flag == 4){
		   str = "（出发）月份天数有误！";
	   }
	   if(flag == 5){
		   str = "（到达）月份天数有误！";
	   }
	   if(flag == 6){
		   str = "（到达）月份天数有误！";
	   }
	   if(flag == 7){
		   str = "（出发）二月份天数有误！";
	   }
	   if(flag == 8){
		   str = "（出发）二月份天数有误！";
	   }
	   if(flag == 9){
		   str = "（到达）二月份天数有误！";
	   }
	   if(flag == 10){
		   str = "（到达）二月份天数有误！";
	   }
	   if(flag == 11){
		   str = "价格数字有误！";
	   }
	   if(flag == 12){
		   str = "城市需不同！";
	   }
	   if(flag == 13){
		   str = "（出发）时间有误！";
	   }
	   if(flag == 14){
		   str = "（到达）时间有误！";
	   }
	   if(flag == 15){
		   str = "到达日期和时间不得早于出发时间！";
	   }
	   %>
	      <script>window.alert('<%= str %>')</script>
	   <%
	   response.setHeader("Refresh", "0;admin.jsp");
   }
   
   // =========================================================================
   // 当信息合适时，进入数据库进行写入
   else{
	   // 生成航班相关数据
	   String str = line.substring(2,6);
	   String tmonth2 = null;
	   String tday2 = null;
	   String thour2 = null;
	   String tminute2 = null;
	   if(tmo < 10){
		   tmonth2 = "0" + tmonth;
	   }
	   else
		   tmonth2 = tmonth;
	   
	   if(td < 10){
		   tday2 = "0" + tday;
	   }
	   else
		   tday2 = tday;
	   
	   if(th < 10){
		   thour2 = "0" + thour;
	   }
	   else
		   thour2 = thour;
	   
	   if(tmi < 10){
		   tminute2 = "0" + tminute;
	   }
	   else
		   tminute2 = tminute;
	   
	   String ID = "1219" + str + tyear + tmonth2 + tday2 + thour2 + tminute2;
	   int VIPleft = 20;
	   int NOMleft = 130;
	   
	   // 写入数据库
	   Class.forName("com.mysql.jdbc.Driver");
	   String url = "jdbc:mysql://localhost:3306/airlines";
	   String username = "root";
	   String password = "20153178";
	   Connection con = DriverManager.getConnection(url,username,password);
	   String sql = "insert into flight_timetable values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	   PreparedStatement pstmt = con.prepareStatement(sql);
	   pstmt.setString(1,line);
	   pstmt.setString(2,ID);
	   pstmt.setString(3,tyear);
	   pstmt.setString(4,tmonth);
	   pstmt.setString(5,tday);
	   pstmt.setString(6,thour);
	   pstmt.setString(7,tminute);
	   pstmt.setString(8,ayear);
	   pstmt.setString(9,amonth);
	   pstmt.setString(10,aday);
	   pstmt.setString(11,ahour);
	   pstmt.setString(12,aminute);
	   pstmt.setString(13,timeLength);
	   pstmt.setInt(14,VIPleft);
	   pstmt.setInt(15,NOMleft);
	   pstmt.setString(16,DEcity);
	   pstmt.setString(17,ARcity);
	   pstmt.setString(18,price);
	   int result = pstmt.executeUpdate();
	   
	   pstmt.close();
	   con.close();
	   
	   %>
	      <script>window.alert('航班已发布！')</script>
	   <%
	   response.setHeader("Refresh", "0;admin.jsp");
   }
%>
</body>
</html>