<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.util.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Jype" content="text/html;charset=gb2312">
<title>无标题文档</title>
<link href="../css/left.css" rel="stylesheet=" type="text/css">
</head>
<body>
	<%
		DataBaseConn con = new DataBaseConn();
		ShowErrorBox show = new ShowErrorBox();
		String strChecked = "checked";
	//	ResultSet rs = con.getRs("SELECT jobName,specialty,salary,pubtime,endtime,other FROM t_pubjob order by pubtime desc");
	    ResultSet rs=con.getRs("select trueName,t_applyjob.specialty,salary,atime,other,t_applyjob.auserName from t_applyjob,t_jobseeker where t_applyjob.auserName=t_jobseeker.auserName order by ptime desc");
	%>
	<table width="695" heigth="500" border="1" cellpadding="0"
		cellspacing="0" bgcolor="#F5f7f7">
		<tr>
			<td width="117">姓名：</td>
			<td width="117">专业方向：</td>
			<td width="58">期望薪水：</td>
			<td width="117">发布日期：</td>
			<td >邮箱：</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>