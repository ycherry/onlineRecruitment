<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/jobseeker/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>在线填写简历</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  
  <body>
  
  <form action="orderOfferServlet" method="post">
  
	姓名:<input type="text" name="name"><br/>
	年龄:<input type="text" name="age"><br/>
	出生日期:<input type="text" name="birthday">   格式：2010-09-09<br/>
	地址:<input type="text" name="address"><br/>
	联系电话:<input type="text" name="tel"><br/>
	个人说明:<textarea rows="5" cols="50" name="content" id="content"></textarea>
	
	<input type="submit" value="提交" />
	
  </form>
  
  </body>
</html>
