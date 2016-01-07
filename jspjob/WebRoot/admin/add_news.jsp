<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>添加新闻</title>
<style type="text/css">
<!--
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size:12px;
	color:#666666;
	background:#fff;
	text-align:center;

}

* {
	margin:0;
	padding:0;
}

a {
	color:#1E7ACE;
	text-decoration:none;	
}

a:hover {
	color:#000;
	text-decoration:underline;
}
h3 {
	font-size:14px;
	font-weight:bold;
}

pre,p {
	color:#1E7ACE;
	margin:4px;
}
input, select,textarea {
	padding:1px;
	margin:2px;
	font-size:12px;
}
.buttom{
	padding:1px 10px;
	font-size:12px;
	border:1px #1E7ACE solid;
	background:#D0F0FF;
}
#formwrapper {
	width:95%;
	margin:15px auto;
	padding:20px;
	text-align:left;
}

fieldset {
	padding:10px;
	margin-top:5px;
	border:1px solid #1E7ACE;
	background:#fff;
}

fieldset legend {
	color:#1E7ACE;
	font-weight:bold;
	background:#fff;
}

fieldset label {
	float:left;
	width:120px;
	text-align:right;
	padding:4px;
	margin:1px;
}

fieldset div {
	clear:left;
	margin-bottom:2px;
}

.enter{ text-align:center;}
.clear {
	clear:both;
}

-->
</style>
<script type="text/javascript" src="../Js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../Js/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function initEditor()
	{
		CKEDITOR.replace('content',
			{
				skin : 'office2003',
				width:700, height:300
			} 
		);
	}
</script>
</head>
<body onload="initEditor()">
<div id="formwrapper">
	<h3>编辑新闻</h3>
	<form action="NewsServlet" method="post" enctype="multipart/form-data">
	<input type="hidden" name="method" value="add"/>
	<fieldset>
		<legend>新闻基本信息</legend>
		<div>
			<label for="title">新闻标题</label>
			<input type="text" name="title" id="title" value="" size="60" maxlength="200" /> 
			*(最多40个字符)<br />	
		</div>
		<div>
			<label for="content">新闻内容</label>
			<textarea rows="5" cols="50" name="content" id="content"></textarea>
			<br/>	
		</div>
		<div>
			<label for="isDeploy">是否发布</label>
			<input type="checkbox" name="isDeploy" value="true"/>
			<br/>	
		</div>
		<div>
			<label for="attchementId">附件1</label>
			<input type="file" name="file1"/>
			<br/>	
		</div>
		<div class="enter">
		    <input name="submit" type="submit" class="buttom" value="提交" />
		    <input name="reset" type="reset" class="buttom" value="重置" />
		    <input name="return" type="button" class="buttom" value="返回列表页面" onclick="window.location = 'NewsServlet?method=list'"/>
		</div>
	</fieldset>
	</form>
</div>

</body>
</html>

