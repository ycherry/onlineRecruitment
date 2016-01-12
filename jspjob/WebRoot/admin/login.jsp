<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>人才招聘网后台登陆</title>
<style type="text/css">
<!--
.STYLE3 {font-size: 18px; font-weight: bold; }
-->
</style>
</head>
<body style="margin:0px; padding:0px; text-align:center;">
<form action="logindo.jsp" method="post">
<table width="900" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="4"><img src="../images/headTop.jpg"/></td>
  </tr>
  
  <tr>
    <td width="316">&nbsp;</td>
    <td width="234"><span class="STYLE3">管理员：</span>
      <strong>
      <input type="text" name="user" style="width:120px;height:20px;"/>
      </strong></td>
    <td width="252"><span class="STYLE3">密码：</span> <strong>
      <input type="password" name="pass" style="width:120px;height:20px;"/>
    </strong></td>
    <td width="98"><input type="submit" value="登陆"/></td>
  </tr>
</table>
</form>
</body>
</html>