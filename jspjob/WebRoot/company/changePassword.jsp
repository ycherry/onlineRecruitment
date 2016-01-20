<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../Js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../Js/util/bootstrap.js"></script>
<script type="text/javascript" src="../Js/util/angular.js"></script>
<script type="text/javascript"
	src="../Js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../Js/company/reg.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<title>修改密码</title>
</head>
<body>
	<form role="form" method="post" id="changePasswordForm"
		action="changePasswordDo.jsp">

		<div class="container" align="center">
			<div class="row regTitle">
				<font color="red"><strong>修改密码</strong></font>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1 ">
					<label>当前密码:</label>
				</div>
				<div class="col-sm-1">
					<input type="password" class="form-control" name="password"
						id="password" placeholder="请输入当前密码（必填）">
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1 ">
					<label>新密码:</label>
				</div>
				<div class="col-sm-1">
					<input type="password" class="form-control" name="newPassword"
						id="newPassword" placeholder="请输入新密码（必填）">
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1 ">
					<label>确认密码:</label>
				</div>
				<div class="col-sm-1">
					<input type="password" class="form-control" name="confirmPassword"
						id="confirmPassword" placeholder="请输入新密码（必填）">
				</div>
			</div>

			<div>
				<div>
					<button type="submit" name="Submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;&nbsp;改&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#changePasswordForm").validate({
				rules : {
					password : {
						required : true
					},
					newPassword : {
						required : true,
						minlength : 6,
						maxlength : 16
					},
					confirmPassword : {
						equalTo : "#newPassword"
					}
				},
				messages : {
					password : {
						required : "当前密码不能为空！"
					},
					newPassword : {
						required : "新密码不能为空!",
						minlength : "密码不能少于6个字符!",
						maxlength : "密码能不能多于16个字符!"
					},
					confirmPassword : {
						equalTo : "两次输入密码不一致!"
					}
				}
			});
		});
	</script>
	
</body>
</html>