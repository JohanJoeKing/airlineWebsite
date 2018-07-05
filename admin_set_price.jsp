<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉航班定价</title>
</head>
<body>
<%
   // =====================================================================
   // 获取上一个界面传过来的新的价格信息和航班编号
   request.setCharacterEncoding("UTF-8");
   String price = request.getParameter("price");
   String ID = request.getParameter("ID");
   
   // =====================================================================
   // 连接数据库
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String username = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,username,password);
   
   // =====================================================================
   // 查询是否有航班发布记录，如果有则更新价格，如果没有则跳转回管理员界面
   String sql = "select * from flight_timetable where ID=" + ID;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   String id = null;
   while(rs.next()){
	   id = rs.getString("ID");
   }
   if(id != null){
	   %>
	      <script>window.alert('没有该航班的发布记录！')</script>
	   <%
	   rs.close();
	   stmt.close();
	   con.close();
	   response.setHeader("Refresh", "0;admin.jsp");
   }
   else{
	   sql = "update flight_timetable set price=? where ID=?";
	   PreparedStatement pstmt = con.prepareStatement(sql);
	   pstmt.setString(1,price);
	   pstmt.setString(2,ID);
	   int result = pstmt.executeUpdate();
	   %>
	      <script>window.alert('价格发布成功！')</script>
	   <%
	   
	   rs.close();
	   stmt.close();
	   con.close();
	   response.setHeader("Refresh", "0;admin.jsp");
   }
%>
</body>
</html>