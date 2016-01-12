<%@ page contentType="text/html;charset=UTF-8"%>



<html>
<head>
</head>
<link href="../css/left.css"rel="stylesheet"type="text/css">
<body topmargin="0px">
<form name="form"method="post"action="pubJobDo.jsp">
<table width="700"height="700"border="0"cellpadding="0"cellspacing="0"bgcolor="#FFFFFF">
	<tr>
		<td height="20">&nbsp;</td>
	</tr>
	<tr>
		<td align="left"valign="top">
			<table width="696"border="0" align="left" cellpadding="0" cellspacing="0"bgcolor="#F5f7f7">
				<tr align="center">
					<td height="27"colspan="2">
						<div id="reg"><font color=red>发布求职信息</font></div>
					</td>
				</tr>
				<tr>
					<td width="164"height="22"align="center">期望行业</td>
				  <td width="532" height="40"align="left"><input type="text"name="specialty" value=""></td>
				</tr>
				<tr>
					<td height="22"align="center">期望职位:</td>
				  <td height="40" align="left"><input type="text"name="jobName"></td>
				</tr>
				<tr>
					<td height="22"align="center">期望薪水:</td>
				  <td height="40" align="left"><input type="text"name="salary"value="面议"></td>
				</tr>
				<tr>
					<td height="22"align="center">有效时间</td>
				  <td height="40" align="left"><input type="text"name="atime">年-月-日</td>
				</tr>
				<tr>
					<td width="164"height="140"align="center">其他要求:</td>
				  <td width="532"align="left"><textarea name="other"cols="35"rows="7">无</textarea></td>
				</tr>
				<tr align="center">
					<td height="199"colspan="2" valign="top"><input type="submit"name="Submit"value="发布">
					&nbsp;&nbsp;
				  <input type="reset"name="Reset"value="重置"></td>
				</tr>

		</table>
		</td></tr></table></form>
</body>
</html>