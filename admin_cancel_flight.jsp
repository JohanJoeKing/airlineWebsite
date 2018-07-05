<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉航班取消</title>
</head>
<body>
<%
   // ==============================================================================
   // 获取需要取消的航班的编号
   request.setCharacterEncoding("UTF-8");
   String ID = request.getParameter("ID");
   out.println("选中的航班ID：" + ID);
   
   // ==============================================================================
   // 连接数据库
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String username = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,username,password);
   
   // ==============================================================================
   // 查询是否有该航班的发布记录
   String sql = "select * from flight_timetable where ID=" + ID;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   String id = null;
   while(rs.next()){
	   id = rs.getString("ID");
   }
   if(id == null){
	   // 当未查询到航班发布记录，跳转回管理员界面
	   %>
	      <script>window.alert('没有该航班的发布记录！')</script>
	   <%
	   rs.close();
	   stmt.close();
	   con.close();
	   response.setHeader("Refresh", "0;admin.jsp");
   }
   else{
	   // 查询到发布记录后，在航班时刻表中删除记录
	   sql = "delete from flight_timetable where ID=?";
	   PreparedStatement pstmt = con.prepareStatement(sql);
	   pstmt.setString(1,ID);
	   int result = pstmt.executeUpdate();
	   %>
	      <script>window.alert('取消航班成功！')</script>
	   <%
	   
	   rs.close();
	   pstmt.close();
	   stmt.close();
	   con.close();
	   response.setHeader("Refresh", "0;admin.jsp");
   }
%>
</body>
</html>