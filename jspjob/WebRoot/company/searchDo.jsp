<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.util.*" %>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
<!--
.STYLE3 {font-size: 18px}
.STYLE4 {color: #FF0000}
.STYLE7 {font-size: 16px; font-weight: bold; }
.STYLE8 {font-size: 16px}
-->
</style>
</head>
<body>
<%
request.setCharacterEncoding("GBK");
String condition=request.getParameter("condition");
String search=request.getParameter("search");
String sql=null;
if("specialty".equals(condition)){
	sql="select * from t_applyjob where specialty like '%"+search+"%' order by ptime desc";
}
else if("jobName".equals(condition)){
	sql="select * from t_applyjob where jobName like '%"+search+"%' order by ptime desc";
}
DataBaseConn dbc=new DataBaseConn();
ResultSet rs=dbc.getRs(sql);
 %>
<table width="680" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="4"><span class="STYLE7">搜索结果:</td>
  </tr>
  <tr>
    <td width="70" align="center"><span class="STYLE7">专业</span></td>
    <td width="173" align="center"><span class="STYLE7">期望职位</span></td>
    <td width="214" align="center"><span class="STYLE7">期望薪水</span></td>
    <td width="213" align="center"><span class="STYLE7">发布时间</span></td>
  </tr>
  <%
  	int i=0;
  	while(rs.next()){
  	i++;
  	
  	%>
  
  <tr>
    <td align="center"><%=rs.getString(3) %></td>
    <td align="center"><%=rs.getString(4) %></td>
    <td align="center"><%=rs.getString(5) %></td>
    <td align="center"><%=rs.getString(6) %></td>
  </tr>
  <% }
  
   %>
  <tr>
    <td colspan="4" align="right"><span class="STYLE8">总第<span class="STYLE4"><%=i %></span>/<span class="STYLE4">1</span>页 上一页 下一页 尾页</span></td>
  </tr>
</table>
</body>
</html>