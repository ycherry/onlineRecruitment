<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/left.css" rel="stylesheet" type="text/css">
<title>职位详情</title>
</head>
<body>
	<%
		DataBaseConn dbc = new DataBaseConn();
		String intId = (String) request.getParameter("intId");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_pubjob where id='" + intId + "'";
		System.out.println(sql);
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<table width="100%" height="450" border="2" align="left" cellpadding="0"
		cellspacing="0" bgcolor="#F5f7f7">

		<tr align="center">
			<td height="27" colspan="4"><div id="reg">
					<font color=red>详细招聘信息</font>
				</div></td>
		</tr>

		<tr>
			<td width="100" height="22" align="center">企业名称:</td>
			<td width="100"><%=rs.getString(2)%></td>
			<td width="100" height="22" align="center">行业：</td>
			<td width="100"><%=rs.getString(3)%></td>
		</tr>
		<tr>
			<td width="201" height="22" align="center">职位名称:</td>
			<td width="499"><%=rs.getString(4)%></td>
			<td width="201" height="22" align="center">薪水:</td>
			<td width="499"><%=rs.getString(5)%></td>
		</tr>
		<tr>
			<td width="201" height="22" align="center">发布日期:</td>
			<td width="499"><%=rs.getString(6)%></td>
			<td width="201" height="22" align="center">截止日期:</td>
			<td width="499"><%=rs.getString(7)%></td>
		</tr>
		<tr>
			<td width="201" height="22" align="center">职位要求:</td>
			<td width="499" colspan="3"><%=rs.getString(8)%></td>
		</tr>

	</table>
	<%
		}
	%>
</body>
</html>