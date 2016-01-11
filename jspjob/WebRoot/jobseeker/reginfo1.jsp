<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%
	//request.setCharacterEndcoding("GB2312");
%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<title>修改信息</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
		DataBaseConn dbc = new DataBaseConn();
		String auserName = (String) session.getAttribute("usercode");
		Statement at = dbc.getStmt();
		String sql = "select * from t_jobSeeker where auserName=" + "'" + auserName + "'";
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<form name="form" method="post" action="reginfo.jsp">
		<table width="700" border="0" align="center" cellpadding="0"
			cellspacing="0" bgcolor="#F5f7f7">

			<tr align="center">
				<td height="27" colspan="2"><div id="reg">
						<font color=red> 求职者修改信息</font>
					</div></td>
			</tr>
			<tr>
				<td width="200" height="22" align="center">真实姓名:</td>
				<td width="300"><input type="text" name="struename"
					value="<%=rs.getString(3)%>"></td>
			</tr>
			<tr>
				<td width="200" height="22" align="center">年&nbsp;&nbsp;&nbsp;&nbsp;龄:</td>
				<td width="300"><input type="text" name="age"
					value="<%=rs.getInt(4)%>"></td>
			</tr>
			<%
				int i = rs.getInt(5);
					if (i == 1) {
			%>
			<tr>
				<td width="200" height="22" align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
				<td width="300"><input type="radio" name="sex" value="1"
					checked> 男 <input type="radio" name="sex" value="0">
					女</td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td width="200" height="22" align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
				<td width="300"><input type="radio" name="sex" value="1">
					男 <input type="radio" name="sex" value="0" checked> 女</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td width="200" height="22" align="center">出生日期:</td>
				<td width="300"><input type="text" name="birthday"
					value="<%=rs.getString(6)%>"> 年-月-日</td>
			</tr>
			<tr>
				<td width="200" height="22" align="center">毕业院校:</td>
				<td width="300"><input type="text" name="school"
					value="<%=rs.getString(7)%>"></td>
			</tr>
			<tr>
				<td width="200" height="22" align="center">电子邮件:</td>
				<td width="300"><input type="text" name="emal"
					value="<%=rs.getString(10)%>"></td>
			</tr>
			<tr>
				<td width="200" height="22" align="center">所学专业:</td>
				<td width="300"><input type="text" name="specialty"
					value="<%=rs.getString(8)%>"></td>
			</tr>
			<tr>
				<td width="200" height="22" align="center">最高学历:</td>
				<td width="300"><input type="text" name="knowledge"
					value="<%=rs.getString(9)%>"></td>
			</tr>
			<tr>
				<td width="200" height="22" align="center">个人简历:</td>
				<td width="300"><textarea name="resume" cols="35" rows="5"><%=rs.getString(11)%></textarea>
			</tr>
			<tr align="center">
				<td height="35" colspan="2"><input type="submit" name="Submit"
					value="修改" onClick="return reg()"> &nbsp;&nbsp; <input
					type="reset" name="Reset" value="重置"></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
</body>
</html>
