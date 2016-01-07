<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.job.domain.News"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/comment/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'newsListById.jsp' starting page</title>
    
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
    
   
   		新闻标题:<%=((News)request.getAttribute("news")).getTitle() %><br/>
   		
   		新闻内容:<%=((News)request.getAttribute("news")).getContent() %><br/>
   		
   		留言:
   			<form action="CommentServlet" method="post">
   					<input type="hidden" name="newsId" value="<%=((News)request.getAttribute("news")).getId() %>"/>
   					<textarea rows="10" cols="30" name="comment"></textarea>
   					<input type="submit" value="提交"/>
   			</form>
    
  </body>
</html>
