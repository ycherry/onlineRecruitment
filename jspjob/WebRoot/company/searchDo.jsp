<%@ page language="java" pageEncoding="gbk"%>
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
    <td colspan="4"><span class="STYLE7">�������:</td>
  </tr>
  <tr>
    <td width="70" align="center"><span class="STYLE7">רҵ</span></td>
    <td width="173" align="center"><span class="STYLE7">����ְλ</span></td>
    <td width="214" align="center"><span class="STYLE7">����нˮ</span></td>
    <td width="213" align="center"><span class="STYLE7">����ʱ��</span></td>
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
    <td colspan="4" align="right"><span class="STYLE8">�ܵ�<span class="STYLE4"><%=i %></span>/<span class="STYLE4">1</span>ҳ ��һҳ ��һҳ βҳ</span></td>
  </tr>
</table>
</body>
</html>