<%@ page pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<html>
<head>
<title>芙蓉航空——锦绣出行</title>
<script type="text/javascript">
   function check(){
	   if(document.getElementById("departure").value == document.getElementById("terminal").value){
		   alert("出发地和到达地不能相同！");
		   form1.terminal.focus();
		   return false;
	   }
   }
</script>
<style>
  .a td{font-family:微软雅黑;font-size:18px;color:#0099FF}
</style>
</head>
<body>
<%
   String str = (String)session.getAttribute("username");

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/airlines";
   String username = "root";
   String password = "20153178";
   Connection con = DriverManager.getConnection(url,username,password);
   String sql = "select distinct cityname from city";
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   
   String[] city = new String[50];
   for(int i=0;i<50;i++){
	   city[i] = null;
   }
   int i = 0;
   while(rs.next()){
	   city[i] = rs.getString("cityname");
	   i++;
   }
%>
<form name="form1" method="post" action="search_do.jsp">
<table class="a" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>欢迎<%= str %>！</td>
  </tr>
  
  <tr>
    <td height="50"><img src="images/login_input_01.jpg" width="900" height="100" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td height="50"><div align="center">
        <label>出发
        <select name="departure" style="width:100px">
        <%
           i = 0;
           while(city[i] != null){
        	   %>
        	      <option><%= city[i] %></option>
        	   <%
        	   i++;
           }
        %>
        </select>
</label>
      </div></td>
  </tr>
  <tr>
    <td height="50"><div align="center">
        <label>到达
        <select name="terminal" style="width:100px">
        <%
           i = 0;
           while(city[i] != null){
        	   %>
        	      <option><%= city[i] %></option>
        	   <%
        	   i++;
           }
        %>
        </select>
</label>
      </div></td>
  </tr>
  <tr>
    <td><div align="center">
        <label>
          <input type="submit" name="Submit" value="提交" onSubmit="return check()">
          </label>
      </div></td>
  </tr>
  <tr>
    <td><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>
</form>
<%
   rs.close();
   stmt.close();
   con.close();
%>

<map name="Map"><area shape="rect" coords="55,15,366,83" href="homepage.html">
</map></body>
</html>