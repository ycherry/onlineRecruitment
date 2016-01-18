<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<html ng-app="myModule">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>修改信息</title>
<script type="text/javascript" src="../Js/util/jquery.js"></script>
<script type="text/javascript" src="../Js/util/bootstrap.js"></script>
<script type="text/javascript" src="../Js/util/angular.js"></script>
<script type="text/javascript" src="../Js/company/reg.js"></script>
<link rel="stylesheet" type="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" type="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="stylesheet" href="../css/common.css">
<link href="../css/default.css" rel="stylesheet" type="text/css">
</head>
<body ng-controller="myCtrl">
	<%
		DataBaseConn dbc = new DataBaseConn();
		String cuserName = (String) session.getAttribute("usercode");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_company where cuserName=" + "'" + cuserName + "'";
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
			System.out.println(rs.getString(3));
	%>
	<form role="form" name="updateCompnyInfoForm" method="post"
		action="reginfo.jsp" novalidate bgcolor="#F5f7f7">
		<div class="container" align="center">
			<div class="row regTitle">
				<font color="red"><strong>企业用户修改注册信息</strong></font>
			</div>
			<div class="row labelStyle">
				<div class="col-sm-1">
					<label>企业名称:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="cusername"
						placeholder="请输入您的用户名（必填）" required ng-model="cusername"
						ng-init="cusername='<%=rs.getString(3)%>'">
				</div>
				<div class="col-sm-1">
					<span class="invalid"
						ng-show="updateCompnyInfoForm.cusername.$error.required &&updateCompnyInfoForm.cusername.$dirty">用户名不能为空!</span>
				</div>
			</div>
			<div class="row labelStyle">
				<div class="col-sm-1">
					<label>联系电话:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="tel"
						placeholder="请输入您的联系电话（必填）" required ng-model="tel"
						ng-init="tel='<%=rs.getString(4)%>'">
				</div>
				<div class="col-sm-1">
					<span class="invalid"
						ng-show="updateCompnyInfoForm.tel.$error.required &&updateCompnyInfoForm.tel.$dirty">联系电话不能为空!</span>
				</div>
			</div>
			<div class="row labelStyle">
				<div class="col-sm-1">
					<label>电子邮件:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="email"
						placeholder="请输入您的联系电话（必填）" required ng-model="email"
						ng-init="email='<%=rs.getString(7)%>'">
				</div>
				<div class="col-sm-1">
					<span class="invalid"
						ng-show="updateCompnyInfoForm.email.$error.required &&updateCompnyInfoForm.email.$dirty">电子邮件不能为空!</span>
				</div>
			</div>
			<div class="row labelStyle">
				<div class="col-md-offset-3 col-md-2">
					<label>企业简介:</label>
				</div>
				<div class="col-md-3">
					<textarea type="text" class="form-control" name="resume"
						placeholder="请介绍一下您的公司吧"></textarea>
				</div>
			</div>
			<div class="row labelStyle">
				<div class="col-md-offset-4 col-md-2">
					<button type="submit" name="Submit" class="btn btn-primary"
						ng-disabled="compnyRegisterForm.$invalid">&nbsp;&nbsp;&nbsp;&nbsp;注&nbsp;&nbsp;&nbsp;&nbsp;册&nbsp;&nbsp;&nbsp;&nbsp;</button>

				</div>
				<div class=" col-md-2">
					<button type="reset" name="reset" class="btn btn-default">&nbsp;&nbsp;&nbsp;&nbsp;重&nbsp;&nbsp;&nbsp;&nbsp;置&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>

			</div>
			<div class="row">
				<div class="col-md-offset-4 col-md-2">
					<span class="invalid" ng-show="compnyRegisterForm.$invalid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请按要求填数据!</span>
				</div>
			</div>
		</div>
	</form>
	<form name="form" method="post" action="reginfo.jsp">
		<table width="700" height="450" border="0" align="left"
			cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">

			<tr align="center">
				<td height="27" colspan="2"><div id="reg">
						<font color=red>企业用户修改注册信息</font>
					</div></td>
			</tr>

			<tr>
				<td width="201" height="22" align="center">企业名称:</td>
				<td width="499"><input type="text" name="ctruename"
					value="<%=rs.getString(3)%>"></td>
			</tr>
			<tr>
				<td width="201" height="22" align="center">联系电话:</td>
				<td width="499"><input type="text" name="tel"
					value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<td width="201" height="22" align="center">电子邮件:</td>
				<td width="499"><input type="text" name="email"
					value="<%=rs.getString(7)%>"></td>
			</tr>

			<tr>
				<td width="201" height="22" align="center">公司性质:</td>
				<td width="499"><input type="text" name="manage"
					value="<%=rs.getString(5)%>"></td>
			</tr>
			<tr>
				<td width="201" height="22" align="center">公司地址:</td>
				<td width="499"><input type="text" name="address"
					value="<%=rs.getString(6)%>"></td>
			</tr>
			<tr>
			<tr>
				<td width="201" height="22" align="center">备注:</td>
				<td width="499"><textarea name="resume" cols="35" rows="5"><%=rs.getString(8)%></textarea></td>
			</tr>
			<tr align="center">
				<td height="210" colspan="2" valign="top"><input type="submit"
					name="Submit" value="修改" onClick="return reg()">
					&nbsp;&nbsp; <input type="reset" name="Reset" value="重置"></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
</body>
</html>
