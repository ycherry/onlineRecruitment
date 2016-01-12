<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=gbk">
<title>简历搜索</title>
</head>
<body>
<form action="searchDo.jsp" method="post">
<select name="condition">
	<option value="specialty">按专业查询</option>
	<option value="jobName">按职位查询</option>
</select><br/>
<input type="text" name="search"/><input type="submit" value="搜索"/>

</form>
</body>
</html>