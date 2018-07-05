<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉航空业务——升级会员</title>
</head>
<body>
<%
   String account = (String)session.getAttribute("account");
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String USERNAME = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,USERNAME,password);
   String sql = "select status from users where account=" + account;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   
   int s1 = 0;
   int s2 = 0;
   while(rs.next()){
	   s1 = rs.getInt("status");
   }
   sql = "update users set status=? where account=?";
   PreparedStatement pstmt = con.prepareStatement(sql);
   if(s1 == 1){
	   s2 = 2;
	   %>
	      <script>window.alert('升级成功！您现在是VIP用户')</script>
	   <%
   }
   if(s1 == 2){
	   s2 = 3;
	   %>
	      <script>window.alert('升级成功！您现在是SVIP用户')</script>
	   <%
   }
   if(s1 == 3){
	   %>
	      <script>window.alert('您已经是SVIP用户，可享用所有优惠。')</script>
	   <%
   }
   
   pstmt.setInt(1,s2);
   pstmt.setString(2,account);
   int r = pstmt.executeUpdate();
   
   rs.close();
   pstmt.close();
   stmt.close();
   con.close();
   
   response.setHeader("Refresh", "0;userpage.jsp");
%>
</body>
</html>