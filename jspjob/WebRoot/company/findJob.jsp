<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.util.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Jype"content="text/html;charset=gb2312">
<title>�ޱ����ĵ�</title>
<link href="../css/left.css" rel="stylesheet=" type="text/css">
</head>
<body>
<%
DataBaseConn con=new DataBaseConn();
ShowErrorBox show=new ShowErrorBox();
String strChecked="checked";
ResultSet rs=con.getRs("SELECT jobName,specialty,salary,ptime,atime,other FROM t_pubjob order by ptime desc");
 %>
<table width="695" heigth="500" border="1" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
 <tr>
 <td width="117">ְλ����</td>
 <td width="117">רҵ����</td>
 <td width="58">н��</td>
 <td width="117">��������</td>
 <td width="117">��������</td>
 <td width="155">��ע</td>
 </tr>
 <%
 while(rs.next()){
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
</tr>
<%
}
 %>
</table>
</body>
</html>