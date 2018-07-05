<%@ page pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<html>
<head>
<title>改签成功！</title>
</head>
<body>
<%
   // ===========================================================
   // 读取改签前后的航班ID
   request.setCharacterEncoding("UTF-8");
   String ID1 = request.getParameter("ID1");
   String ID2 = request.getParameter("ID2");
   
   // ===========================================================
   // 连接数据库
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String username = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,username,password);
   
   // ===========================================================
   // 删除原有购票记录
   String sql = "delete from tickets where ticket_ID=" + ID1;
   Statement stmt = con.createStatement();
   stmt.execute(sql);
   
   // ===========================================================
   // 新建购票记录
   String seat = "普通舱";
   String account = (String)session.getAttribute("account");
   sql = "insert into tickets values(ticket_ID=?,account=?,sort=?)";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1,ID2);
   pstmt.setString(2,account);
   pstmt.setString(3,seat);
   int result = pstmt.executeUpdate();
   
   // ===========================================================
   // 改签成功
   %>
      <script>window.alert('改签成功！')</script>
   <%
   
   stmt.close();
   pstmt.close();
   con.close();
   
   response.setHeader("Refresh", "0;userpage.jsp");
%>
</body>
</html>