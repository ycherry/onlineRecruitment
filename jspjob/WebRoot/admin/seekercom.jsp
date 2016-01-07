<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
    <link href="../css/left/.css" rel="stylesheet" type="text/css"> 
	
  </head>
  
  <body topmargin="0px">
  <table height="500" border="0" align="center" cellpadding="0"
  cellspacing="0" bgcolor="#FFFFFF">
  <tr>
  <td height="50" align="center"><div id="font">公司管理</div></td>
  </tr>
  <tr>
  <td valign="top"><table 、 border="1" align="left"
  cellpadding="0" cellspacing="0" bgcolor="#f5f7f7">
  <tr align="center" bgcolor="blue">
  <td width="78" height="22">
  <div id="reg">操作</div></td>
  <td width="200"><div id="reg">公司名称</div></td>
  
  <td width="194"><div id="reg">联系人</div></td>
   <td width="222"><div id="reg">电话</div></td>
    <td width="244"><div id="reg">电子邮件</div></td>
    
     
     <td width="209"><div id="reg">地址</div></td>
     </tr>
     <%
     DataBaseConn con=new DataBaseConn();
     ResultSet rs=con.getRs("SELECT * FROM t_company");
     while(rs.next()){
     %>
     <tr align="center">
     <td width="78" align="center"><a href="delSeeker3.jsp?cuserName=<%=rs.getString(2)%>">删除</a></td>
     <td width="200" height="22" align="center"><%=rs.getString(3)%></td>
     <td width="194" align="center"></td>
     
     <td width="222" align="left"><%=rs.getString(4)%></td>
     <td width="244" align="left"><%=rs.getString(7)%></td>
     
     <td align="left"><%=rs.getString(6)%></td>
     
     </tr>
     <%
     }
     
     %>
     <tr>
     <td colspan="10">&nbsp;</td>
     </tr>
     </table>
     </body>
     </html>     
     
     
  
