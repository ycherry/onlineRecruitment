<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改招聘信息</title>
<script type="text/javascript" src="../Js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../Js/util/bootstrap.js"></script>
<script type="text/javascript" src="../Js/util/angular.js"></script>
<script type="text/javascript"
	src="../Js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../Js/company/reg.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/common.css">
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
	<form role="form" name="updateJobInfoForm" method="post" id="updateJobInfoForm"
		action="updateJobDo.jsp" novalidate bgcolor="#F5f7f7">
		<div class="container" align="center">
			<div class="row regTitle">
				<font color="red"><strong>修改招聘信息</strong></font>
			</div>
			<div class="row updateRegInfoLabel">
				<div class="col-sm-1 ">
					<label>企业名称:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="ctruename" id="ctruename"
						placeholder="请输入您的用户名（必填）" value="<%=rs.getString(3)%>"  >
				</div>
			</div>


			<div>
				<div>
					<button type="submit" name="Submit" class="btn btn-primary"
						ng-disabled="updateCompnyInfoForm.$invalid">&nbsp;&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;&nbsp;改&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-1">
					<span class="invalid" ng-show="updateCompnyInfoForm.$invalid">请按要求填数据!</span>
				</div>
			</div>
		</div>
	</form>

	<table width="100%" height="450" border="2" align="left"
		cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">

		<tr align="center">
			<td height="27" colspan="4"><div id="reg">
					<font color=red>详细招聘信息</font>
				</div></td>
		</tr>

		<tr>
			<td width="100" height="22" align="center">行业：</td>
			<td width="100"><input type="text" value="<%=rs.getString(3)%>" /></td>
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
	<script type="text/javascript">
		$(document).ready(function() {
			console.log("已调用！");
			$("updateJobInfoForm").validate({
				rules : {
					ctruename : {
						required : true,
						minlength : 2,
						maxlength : 10
					}
				},
				messages : {
					ctruename : {
						required : "企业名称不能为空！",
						minlength : '用户名不能小于2个字符',
						maxlength : '用户名不能超过10个字符'
					}
				}
			});
		});
	</script>
</body>
</html>