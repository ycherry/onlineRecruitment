<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%//request.setCharacterEndcoding("GB2312");%>
<%@ page import="java.sql.*"%>
<html>
  <head>  
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<title>�޸���Ϣ</title>
<link href="../css/default.css"rel="stylesheet"type="text/css">
</head>
<body>
<%
DataBaseConn dbc=new DataBaseConn();
String cuserName=(String)session.getAttribute("usercode");
Statement at=dbc.getStmtread();
String sql="select * from t_company where cuserName="+"'"+cuserName+"'";
ResultSet rs=dbc.getRs(sql);
while(rs.next()){
%>
<form name="form" method="post"  action="reginfo.jsp">
<table width="700" height="450"border="0"align="left" cellpadding="0"cellspacing="0"bgcolor="#F5f7f7">

<tr align="center">
<td height="27"colspan="2"><div id="reg"><font color=red>��ҵ�û��޸�ע����Ϣ</font></div></td>
</tr>

<tr>
<td width="201"height="22"align="center">��ҵ����:</td>
<td width="499"><input type="text" name="ctruename" value="<%=rs.getString(3)%>"></td>
</tr>
<tr>
<td width="201"height="22"align="center">��ϵ�绰:</td>
<td width="499">
<input type="text"name="tel" value="<%=rs.getString(4)%>"></td>
</tr>
<tr>
<td width="201"height="22"align="center">�����ʼ�:</td>
<td width="499">
<input type="text"name="email"value="<%=rs.getString(7)%>"></td>
</tr>

<tr>
<td width="201" height="22"align="center">��˾����:</td>
<td width="499">
<input type="text"name="manage" value="<%=rs.getString(5)%>"></td>
</tr>
<tr>
<td width="201"height="22"align="center">��˾��ַ:</td>
<td width="499">
<input type="text"name="address" value="<%=rs.getString(6)%>"></td>
</tr>
<tr>
<tr>
<td width="201"height="22"align="center">��ע:</td>
<td width="499">
<textarea name="resume"cols="35"rows="5"><%=rs.getString(8)%></textarea></td>
</tr>
<tr align="center">
<td height="210" colspan="2" valign="top"><input type="submit"name="Submit"value="�޸�"onClick="return reg()">  &nbsp;&nbsp;
<input type="reset"name="Reset"value="����"></td>
</tr>
</table>
</form>
<% } %>
</body>
</html>
