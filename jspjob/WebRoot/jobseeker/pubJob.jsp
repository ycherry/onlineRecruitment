<%@ page contentType="text/html;charset=gb2312"%>



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
						<div id="reg"><font color=red>������ְ��Ϣ</font></div>
					</td>
				</tr>
				<tr>
					<td width="164"height="22"align="center">������ҵ</td>
				  <td width="532" height="40"align="left"><input type="text"name="specialty" value=""></td>
				</tr>
				<tr>
					<td height="22"align="center">����ְλ:</td>
				  <td height="40" align="left"><input type="text"name="jobName"></td>
				</tr>
				<tr>
					<td height="22"align="center">����нˮ:</td>
				  <td height="40" align="left"><input type="text"name="salary"value="����"></td>
				</tr>
				<tr>
					<td height="22"align="center">��Чʱ��</td>
				  <td height="40" align="left"><input type="text"name="atime">��-��-��</td>
				</tr>
				<tr>
					<td width="164"height="140"align="center">����Ҫ��:</td>
				  <td width="532"align="left"><textarea name="other"cols="35"rows="7">��</textarea></td>
				</tr>
				<tr align="center">
					<td height="199"colspan="2" valign="top"><input type="submit"name="Submit"value="����">
					&nbsp;&nbsp;
				  <input type="reset"name="Reset"value="����"></td>
				</tr>

		</table>
		</td></tr></table></form>
</body>
</html>