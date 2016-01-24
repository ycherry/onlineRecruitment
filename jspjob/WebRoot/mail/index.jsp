<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0px">
<table width="100%" height="500" border="0" cellpadding="0" cellspacing="0" bacolor="#FFFFFF">
<tr>
<td height="20">&nbsp;</td>
</tr>
<tr>
<td align="left" valign="top"><table width="600" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
<form name="form1" method="post" action="sendMail.jsp" >
<tr align="center">
<td height="27" colspan="2"><div id="reg"><font color=red>发送邮件</font></div></td>
</tr>
<tr>
<td width="200" height="22" align="center">smtp 服务器（和发送人邮件地址对应）:</td>
<td width="300"><input type="text" name="smtpserver">* 例如：smtp.sohu.com</td>
</tr>
<tr>
<td width="200" height="22" align="center">发件人信箱：</td>
<td width="300"><input type="text" name="sfrom">*mm@ss.com</td>
</tr>
<tr>
<td width="200" height="22" align="center">发件人信箱密码:</td>
<td width="300"><input type="password" name="pass"></td>
</tr>
<tr>
<td width="200" height="22" align="center">收件人1:</td>
<td width="300"><input type="text" name="from">*mmm@sss.com
    </td>
</tr>
<tr>
<td height="22" align="center">收件人2:</td>
<td height="22"><input type="text" name="from"></td>
</tr>
<tr>
<td height="22" align="center">收件人3:</td>
<td height="22"><input type="text" name="from"></td>
</tr>
<tr>
<td height="22" align="center">收件人4:</td>
<td height="22"><input type="text" name="from"></td>
</tr>
<tr>
<td height="22" align="center">主&nbsp;&nbsp;&nbsp;&nbsp;题:</td>
<td height="22"><input name="subject" type="text" size="35"></td>
</tr>
<tr>
<td height="22" align="center">附&nbsp;&nbsp;&nbsp;&nbsp;件:</td>
<td height="22"><input type="text " name="file">例如:c:\\\\boot.ini</td>
</tr>
<tr> 
<td height="22" colspan="2" align="center">内&nbsp;&nbsp;容:</td>
</tr>
<tr>
<td height="22" colspan="2" align="center"><textarea name="message" cols="60" rows="6"></textarea></td>
</tr>
<tr>
<td height="27" colspan="2" align="center"><input type="submit" name="Submit" value="确定">
&nbsp;&nbsp;
<input type="reset" name="Submit2" value="重置"></td>
</tr>

</table></td>
</tr>
<tr>
<td height="20">&nbsp;</td>
</tr>
</table>
</body>
</html>


























