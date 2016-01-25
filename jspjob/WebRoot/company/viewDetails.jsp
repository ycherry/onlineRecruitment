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
<script type="text/javascript" src="../Js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../Js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../Js/util/jquery.validate-1.13.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<link href="../css/left.css" rel="stylesheet" type="text/css">
<title>职位详情</title>
</head>
<body>
	<div class="row regTitle">
		<font color="red"><strong>详细招聘信息</strong></font>
	</div>
	<%
		DataBaseConn dbc = new DataBaseConn();
		String intId = (String) request.getParameter("intId");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_pubjob where id='" + intId + "'";
		System.out.println(sql);
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<table class="table table-bordered  table-responsive table-hover">
		<tr>
			<td nowrap="nowrap">行业：</td>
			<td><%=rs.getString(3)%></td>
			<td nowrap="nowrap">职位名称:</td>
			<td><%=rs.getString(4)%></td>
		</tr>
		<tr>
			<td nowrap="nowrap">学历：</td>
			<td><%=rs.getString(5)%></td>
			<td>薪水:</td>
			<td><%=rs.getString(6)%></td>
		</tr>
		<tr>
			<td nowrap="nowrap">发布日期:</td>
			<td><%=rs.getString(7)%></td>
			<td>截止日期:</td>
			<td><%=rs.getString(8)%></td>
		</tr>
		<tr>
			<td nowrap="nowrap">职位要求:</td>
			<td colspan="3"><%=rs.getString(9)%></td>
		</tr>
		<tr>
			<td colspan="4"><a class="btn btn-primary" href="updateJob.jsp?intId=<%=intId%>">&nbsp;&nbsp;&nbsp;&nbsp;编&nbsp;&nbsp;&nbsp;&nbsp;辑&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
		</tr>
	</table>
	<table width="100%" height="450" border="2" align="left"
		cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">

		<tr align="center">
			<td height="27" colspan="4"><div id="reg">
					<font color=red>详细招聘信息</font>
				</div></td>
		</tr>

		<tr>
			<td width="100" height="22" align="center">行业：</td>
			<td width="100"><%=rs.getString(3)%></td>
			<td width="100" height="22" align="center">职位名称:</td>
			<td width="100"><%=rs.getString(4)%></td>
		</tr>
		<tr>
			<td width="201" height="22" align="center">学历：</td>
			<td width="499"><%=rs.getString(5)%></td>
			<td width="201" height="22" align="center">薪水:</td>
			<td width="499"><%=rs.getString(6)%></td>
		</tr>
		<tr>
			<td width="201" height="22" align="center">发布日期:</td>
			<td width="499"><%=rs.getString(7)%></td>
			<td width="201" height="22" align="center">截止日期:</td>
			<td width="499"><%=rs.getString(8)%></td>
		</tr>
		<tr>
			<td width="201" height="22" align="center">职位要求:</td>
			<td width="499" colspan="3"><%=rs.getString(9)%></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>