<%@ page pageEncoding="UTF-8" import="java.util.*"%>
<html>
<head>
<title>注册成功！</title>
<style>
   td{font-family:微软雅黑;color:#0099CC;font-size:18px}
</style>
</head>
<body>
<%
   String username = (String)session.getAttribute("newUsername");
   String account = (String)session.getAttribute("newTelephone");
   String sex = (String)session.getAttribute("newSex");
   String birthday = (String)session.getAttribute("newBirthday");
   String password = (String)session.getAttribute("newPassword");
   String Sta = "普通用户";
   String money = "0";
%>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2"><img src="images/register_success.jpg" width="900" height="200"></td>
  </tr>
  <tr>
    <td width="120">用户名：</td>
    <td width="780"><%= username %></td>
  </tr>
  <tr>
    <td>账号：</td>
    <td><%= account %></td>
  </tr>
  <tr>
    <td>密码：</td>
    <td><%= password %></td>
  </tr>
  <tr>
    <td>性别：</td>
    <td><%= sex %></td>
  </tr>
  <tr>
    <td>出生年月：</td>
    <td><%= birthday %></td>
  </tr>
  <tr>
    <td>身份：</td>
    <td><%= Sta %></td>
  </tr>
  <tr>
    <td>余额：</td>
    <td><%= money %></td>
  </tr>
  <tr>
    <td colspan="2"><img src="images/register_go.jpg" width="900" height="300" border="0" usemap="#Map"></td>
  </tr>
</table>

<map name="Map">
<area shape="circle" coords="448,119,67" href="homepage.html">
</map></body>
</html>