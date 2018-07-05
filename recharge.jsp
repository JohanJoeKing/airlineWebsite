<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉航空——充值中心</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String account = (String)session.getAttribute("account");
   String m = request.getParameter("money");
   int im = Integer.parseInt(m);

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String USERNAME = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,USERNAME,password);
   String sql = "select money from users where account=" + account;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   String m1 = null;
   int im1 = 0;
   while(rs.next()){
	   m1 = rs.getString("money");
	   im1 = Integer.parseInt(m1);
   }
   int im2 = im1 + im;
   sql = "update users set money=? where account=?";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setInt(1,im2);
   pstmt.setString(2,account);
   int result = pstmt.executeUpdate();
   %>
      <script>window.alert('充值成功！')</script>
   <%
   
   rs.close();
   pstmt.close();
   stmt.close();
   con.close();
   
   response.setHeader("Refresh", "0;userpage.jsp");
%>
</body>
</html>