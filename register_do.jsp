<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<%
   request.setCharacterEncoding("UTF-8");
   String username = request.getParameter("username");
   String telephone = request.getParameter("telephone");
   String sex = request.getParameter("sex");
   String password = request.getParameter("password1");
   String birthday = request.getParameter("birthday");
   int Sta = 1;
   int M = 0;
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String USERNAME = "root";
   String PASSWORD = "20153178";
   Connection con = DriverManager.getConnection(url,USERNAME,PASSWORD);
   
   // 判断手机号是否已注册
   String sql = "select username from users where account=" + telephone;
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   int flag = 0;
   while(rs.next()){
	   String U = rs.getString("username");
	   if(U != null)
		   flag = 1;
   }
   
   // 当flag为0，表示该手机号允许被新注册
   if(flag == 0){
   sql = "insert into users values(?,?,?,?,?,?,?)";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1,username);
   pstmt.setString(2,telephone);
   pstmt.setString(3,password);
   pstmt.setInt(4,Sta);
   pstmt.setString(5,sex);
   pstmt.setString(6,birthday);
   pstmt.setInt(7,M);
   int result = pstmt.executeUpdate();
   String str = "注册失败！";
   if(result == 1){
	   str = "注册成功！";
   }
   
   pstmt.close();
   
   session.setAttribute("newUsername", username);
   session.setAttribute("newTelephone", telephone);
   session.setAttribute("newPassword", password);
   session.setAttribute("newBirthday", birthday);
   session.setAttribute("newSex", sex);
   response.setHeader("Refresh", "0;register_success.jsp");
   }
   else{
	   %>
	      <script>window.alert('该手机号已注册！')</script>
	   <%
	   response.setHeader("Refresh", "0;register_input.html");
   }
   
   rs.close();
   stmt.close();
   con.close();
%>