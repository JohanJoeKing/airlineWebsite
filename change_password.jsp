<%@ page pageEncoding="UTF-8" import="java.util.*"%>
<html>
<head>
<title>修改密码</title>
<script>
function check(){
	
}
</script>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String password = request.getParameter("password");
%>
<form name="form1" method="post" action="change_password_do.jsp?pw0="<%= password %>"">
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2"><img src="images/login_input_01.jpg" width="900" height="100" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td width="500" height="100">
      <label>
      <div align="right">当前密码
        <input type="text" name="pw1">
      </div>
      </label>
    </td>
    <td width="400" rowspan="4"><img src="images/furong.jpg" width="400" height="400"></td>
  </tr>
  <tr>
    <td height="100">
      <label>
      <div align="right">新密码
        <input type="text" name="pw2">
      </div>
      </label>
    </td>
  </tr>
  <tr>
    <td height="100"><div align="right">
        <label>确认新密码
          <input type="text" name="pw3">
          </label>
      </div></td>
  </tr>
  <tr>
    <td height="100"><div align="right">
        <label>
          <input type="submit" name="Submit" value="提交">
          </label>
      </div></td>
  </tr>
  <tr>
    <td colspan="2"><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>
</form>

<map name="Map"><area shape="rect" coords="52,16,364,84" href="userpage.jsp">
</map></body>
</html>