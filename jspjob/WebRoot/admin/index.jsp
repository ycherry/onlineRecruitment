<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>人才招聘网站</title>
<style type="text/css">
	body{
		padding:0px;
		margin:0px;
		text-align:center;
	}
#container{
	width:900px;
	padding:0px;
	margin:0px;
}
#top{
	width:900px;
	height:120px;
	background-color:red;}
#left{
	width:200px;
	height:500px;
	float:left;	
	background-color:green;
	}
#main{
	width:700px;
	height:500px;
	float:left;
	background-color:black;}
</style>
</head>


<body>
<%
	String user=(String)session.getAttribute("adminuser");
	if(null==user){
	response.sendRedirect("login.jsp");
	}
	else{
%>
<center>
<div id="container">
	<div id="top"><img src="../images/headTop.jpg" width="100%" height="99%"/></div>
	<div id="left"><iframe src="seeker_left.jsp" name="leftFrame" width="200" height="500"></iframe></div>
	<div id="main"><iframe src="seeker_body.html" name="mainFrame" width="700" height="500"></iframe></div>


</div>
</center>
</body>
	<%
	
	}
 %>
</html>
