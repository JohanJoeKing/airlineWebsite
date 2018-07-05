<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>取消成功！</title>
</head>
<body>
<%
   // ============================================================================
   // 获取航班ID
   request.setCharacterEncoding("UTF-8");
   String ID = request.getParameter("ID");
   String account = (String)session.getAttribute("account");
   
   // ============================================================================
   // 连接数据库
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String USERNAME = "root";
   String PASSWORD = "20153178";
   Connection con = DriverManager.getConnection(url,USERNAME,PASSWORD);
   
   // ============================================================================
   // 查询票价p1
   String sql = "select price from flight_timetable where ID=" + ID;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   String p = null;
   while(rs.next()){
	   p = rs.getString("price");
   }
   int p1 = Integer.parseInt(p);
   
   // ============================================================================
   // 删除出票记录
   sql = "delete from tickets where ticket_ID=" + ID;
   stmt.execute(sql);
   
   // ============================================================================
   // 退回机票价格的50%
   sql = "select money from users where account=" + account;
   rs = stmt.executeQuery(sql);
   int p2 = 0;
   while(rs.next()){
	   p2 = rs.getInt("money");
   }
   p2 += (p1/2);
   sql = "update users set money=? where account=?";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setInt(1,p2);
   pstmt.setString(2,account);
   pstmt.execute();
   
   rs.close();
   pstmt.close();
   stmt.close();
   con.close();
   
   %>
      <script>window.alert('退票成功！');</script>
   <%
   response.setHeader("Refresh", "0;userpage.jsp");
%>
</body>
</html>