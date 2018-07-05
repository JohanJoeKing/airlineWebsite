<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉航空——确认启航</title>
</head>
<body>
<%
   // ===========================================================================
   // 获取航班ID以及登录用户的信息
   request.setCharacterEncoding("UTF-8");
   String ID = request.getParameter("ID");
   String account = (String)session.getAttribute("account");
   String seat = "普通舱";
   
   // ===========================================================================
   // 连接数据库
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String username = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,username,password);
   
   // ===========================================================================
   // 查询客户是否已经买过票
   String sql = "select * from tickets where ticket_ID=" + ID + " and account=" + account;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   int flag = 0;
   while(rs.next()){
	   String acc = rs.getString("account");
	   if(acc != null){
		   flag = 1;
	   }
   }
   if(flag == 1){
	   %>
	      <script>window.alert('您已经买过票！每人限买一张，敬请谅解！');</script>
	   <%
	   response.setHeader("Refresh", "0;search_input.jsp");
	   rs.close();
	   stmt.close();
	   con.close();
   }
   else{
   // ===========================================================================
   // 查询航班信息
   String price = null;
   String NOMleft = null;
   sql = "select * from flight_timetable where ID=" + ID;
   rs = stmt.executeQuery(sql);
   while(rs.next()){
	   price = rs.getString("price");
	   NOMleft = rs.getString("NOMleft");
   }
	   
   // ===========================================================================
   // 查询用户余额
   sql = "select money from users where account=" + account;
   rs = stmt.executeQuery(sql);
   String money = null;
   while(rs.next()){
	   money = rs.getString("money");
   }
   int p = Integer.parseInt(price);
   int m = Integer.parseInt(money);
   if(p > m){
	   %>
	      <script>window.alert('您的余额不足！');</script>
	   <%
	   response.setHeader("Refresh", "0;search_input.jsp");
   }
   
   // ===========================================================================
   // 修改账户余额以及航班座舱剩余
   String m2 = String.valueOf(m - p);
   sql = "update users set money=? where account=?";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1,m2);
   pstmt.setString(2,account);
   int result = pstmt.executeUpdate();
   
   String left = String.valueOf(Integer.parseInt(NOMleft) - 1);
   sql = "update flight_timetable set NOMleft=? where ID=?";
   pstmt = con.prepareStatement(sql);
   pstmt.setString(1,left);
   pstmt.setString(2,ID);
   result = pstmt.executeUpdate();
   
   // ===========================================================================
   // 插入出票记录
   sql = "insert into tickets values(?,?,?)";
   pstmt = con.prepareStatement(sql);
   pstmt.setString(1,ID);
   pstmt.setString(2,account);
   pstmt.setString(3,seat);
   result = pstmt.executeUpdate();
   String str = "订单提交失败！";
   if(result == 1){
	   str = "订单提交成功！";   
   }
   %>
      <script>window.alert('<%= str %>');</script>
   <%
   pstmt.close();
   con.close();
   response.setHeader("Refresh","0;userpage.jsp");
   }
%>
</body>
</html>