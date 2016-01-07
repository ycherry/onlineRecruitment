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
  <td height="50" align="center"><div id="font">求职信息管理</div></td>
  </tr>
  <tr>
  <td valign="top"><table border="1" align="left"
  cellpadding="0" cellspacing="0" bgcolor="#f5f7f7">
  <tr align="center" bgcolor="blue">
  <td width="60"><div id="reg">操作</div>
    </td>
  <td width="60" height="22"><div id="reg">编号</div></td>
   <td width="100"><div id="reg">用户名</div></td>
    <td width="150"><div id="reg">期望职位</div></td>
     <td width="120"><div id="reg">薪资要求</div></td>
     <td width="200"><div id="reg">发布日期</div></td>
     <td width="200"><div id="reg">有效日期</div></td>
     <td width="250"><div id="reg">备注信息</div></td>
     
     </tr>
     <%
     DataBaseConn con=new DataBaseConn();
     ResultSet rs=con.getRs("SELECT * FROM t_applyJob");
     while(rs.next()){
     %>
      
     <tr align="center">
     <td width="60" align="center"><a href="delSeeker2.jsp?jobid=<%=rs.getString(1)%>">删除</a></td>
     <td height="22" align="center"><%=rs.getString(1)%>
    </td>
     <td width="100" align="center"><%=rs.getString(2)%></td>
     <td width="150" align="center"><%=rs.getString(4)%></td>
     <td width="120" align="center"><%=rs.getString(5)%></td>
     <td width="200" align="center"><%=rs.getString(6)%></td>
     <td width="200" align="center"><%=rs.getDate(7)%></td>
     <td width="250" align="center"><%=rs.getString(8)%></td>
     
     </tr>
     <%
     }
     
     %>
     <tr>
     <td colspan="10">&nbsp;</td>
     </tr>
     </table></td>
     </tr>
     </table>
     </body>
     </html>     
     
     
  
