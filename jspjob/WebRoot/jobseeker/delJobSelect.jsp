<%@page contentType="text/html;charset=gb2312"%>
<%@page import="com.util.*"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0px">
<table width="100%" heigth="500" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
<td height="20">&nbsp;</td>
</tr>
<tr>
<td align="left" valign="top"><table width="691" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
<tr align=center">
<td height="27" colspan="4"><div id="reg"><font color=red>删除求职信息</font><div></td>
</tr>
<tr>
<td width="147" height="22" align="center">所求职位</td>
<td width="225" align="center">发布时间</td>
<td width="200" align="center">有效时间</td>
<td width="119" align="center">删除</td>
</tr>
<%
DataBaseConn con=new DataBaseConn();
String strChecked="checked";
String strUserName=(String)session.getAttribute("usercode");
ResultSet rs=con.getRs("SELECT * FROM t_applyJob WHERE auserName='"+strUserName+"'");
while(rs.next()){
int intId=rs.getInt(1);
%>
<tr>
<td height="22" align="center"><%=rs.getString(4)%></td>
<td align="center"><%=rs.getString(6)%></td>
<td align="center"><%=rs.getString(7)%></td>
<td align="center"><a href="delJobDo.jsp?intId=<%=intId%>">删除</a>
</td>
</tr>
<%
}
%>
</table></td>
</tr>
</table>
</body>
</html>