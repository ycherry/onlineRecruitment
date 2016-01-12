<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.util.*"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String user=request.getParameter("user");
String pass=request.getParameter("pass");
DataBaseOperation data=new DataBaseOperation();
int intT=data.getRowCount("t_user where username='"+user+"'and userPass='"+pass+"' and userType="+3 );
if(intT>0){
session.setAttribute("adminuser",user);
request.getRequestDispatcher("index.jsp").forward(request,response);
}
else{
	response.sendRedirect("login.jsp");
}

 %>
</body>
</html>