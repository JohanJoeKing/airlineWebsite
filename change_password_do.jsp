<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>密码修改成功！</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String pw = request.getParameter("pw3");
   String pw0 = request.getParameter("pw0");
   String account = (String)session.getAttribute("account");
   String PW = (String)session.getAttribute("password");

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String UN = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,UN,password);
   String sql = "update users set password=? where account=?";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1,pw);
   pstmt.setString(2,account);
   int result = pstmt.executeUpdate();
   
   %>
      <script>window.alert('密码修改成功！')</script>
   <%
   
   pstmt.close();
   con.close();
   
   response.setHeader("Refresh", "0;login_input.html");
%>
</body>
</html>