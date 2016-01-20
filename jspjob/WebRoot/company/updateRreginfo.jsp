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
<script type="text/javascript" src="../Js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../Js/util/bootstrap.js"></script>
<script type="text/javascript" src="../Js/util/angular.js"></script>
<script type="text/javascript"
	src="../Js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../Js/company/reg.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet"  href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/common.css">
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
			<div class="row updateInfoLabel">
				<div class="col-sm-1 ">
					<label>企业名称:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="ctruename"
						placeholder="请输入您的用户名（必填）" required ng-model="ctruename"
						ng-init="ctruename='<%=rs.getString(3)%>'">
				</div>
				<div class="col-sm-1">
					<span class="invalid"
						ng-show="updateCompnyInfoForm.ctruename.$error.required &&updateCompnyInfoForm.ctruename.$dirty">用户名不能为空!</span>
				</div>
			</div>
			<div class="row updateInfoLabel">
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
			<div class="row updateInfoLabel">
				<div class="col-sm-1">
					<label>电子邮件:</label>
				</div>
				<div class="col-sm-1">
					<input type="email" class="form-control" name="email"
						placeholder="请输入您的电子邮件（必填）" required ng-model="email"
						ng-init="email='<%=rs.getString(7)%>'">
				</div>
				<div class="col-sm-1">
					<span class="invalid"
						ng-show="updateCompnyInfoForm.email.$error.required &&updateCompnyInfoForm.email.$dirty">电子邮件不能为空!</span>
					<span class="invalid"
						ng-show="updateCompnyInfoForm.email.$invalid&&updateCompnyInfoForm.email.$dirty">请输入正确的邮件格式!</span>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1">
					<label>公司性质:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="manage"
						placeholder="请输入您的公司类型（必填）" required ng-model="manage"
						ng-init="manage='<%=rs.getString(5)%>'">
				</div>
				<div class="col-sm-1">
					<span class="invalid"
						ng-show="updateCompnyInfoForm.manage.$error.required &&updateCompnyInfoForm.manage.$dirty">公司类型不能为空!</span>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1">
					<label>公司地址:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="address"
						placeholder="请输入您的公司地址（必填）" ng-model="address"
						ng-init="address='<%=rs.getString(6)%>'" required>
				</div>
				<div class="col-sm-1">
					<span class="invalid"
						ng-show="updateCompnyInfoForm.address.$error.required &&updateCompnyInfoForm.address.$dirty">公司地址不能为空!</span>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class=" col-sm-1">
					<label>企业简介:</label>
				</div>
				<div class="col-sm-3">
					<textarea type="text" class="form-control" name="resume"
						placeholder="请介绍一下您的公司吧"><%=rs.getString(8)%></textarea>
				</div>
			</div>
			<div >
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
	<%
		}
	%>
</body>
</html>
