<%@ page pageEncoding="UTF-8"%>
<html>
<head>
<title>芙蓉航空——充值中心</title>
</head>
<body>
<form name="form1" method="post" action="recharge.jsp">
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2"><img src="images/recharge_center_headpage.jpg" width="900" height="100" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td width="450">
      <label>
      <div align="center">充值金额
        <select name="money" style="width:100px">
          <option selected>100</option>
          <option>500</option>
          <option>1000</option>
          <option>2000</option>
          <option>5000</option>
          <option>10000</option>
        </select>
      </div>
      </label>
    </td>
    <td width="450"><input type="image" src="images/recharge_do.jpg"></td>
  </tr>
  <tr>
    <td colspan="2"><img src="images/copyright.jpg" width="900" height="100"></td>
  </tr>
</table>
</form>
<map name="Map">
<area shape="circle" coords="88,52,35" href="userpage.jsp">
</map></body>
</html>