<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
    <link href="../css/left/.css" rel="stylesheet" type="text/css"> 
	
  </head>
  
  <body topmargin="0px">
  <table  height="500" border="0" align="center" cellpadding="0"
  cellspacing="0" bgcolor="#FFFFFF">
  <tr>
  <td height="50" align="center"><div id="font">求职者管理</div></td>
  </tr>
  <tr>
  <td valign="top"><table  border="1" align="left"
  cellpadding="0" cellspacing="0" bgcolor="#f5f7f7">
  <tr align="center" bgcolor="pink">
   <td width="78"><div id="reg">操作</div></td>
    <td width="123"><div id="reg">姓名</div></td>
    <td width="80"><div id="reg">年龄</div></td>
     <td width="67"><div id="reg">性别</div></td>
     <td width="154"><div id="reg">出生日期</div></td>
     <td width="160"><div id="reg">毕业学校</div></td>
     <td width="150"><div id="reg">所学专业</div></td>
     <td width="105"><div id="reg">学历</div></td>
     <td width="206"><div id="reg">电子邮件</div></td>
	 
     </tr>
     <%
     DataBaseConn con=new DataBaseConn();
     ResultSet rs=con.getRs("SELECT * FROM t_jobSeeker");
     while(rs.next()){
     %>
     <tr align="center">
     <td width="78" align="center"><a href="delSeeker.jsp?auserName=<%=rs.getString(2)%>">删除</a></td>
     <td width="123" align="center"><%=rs.getString(3)%></td>
     <td width="101" align="center"><%=rs.getString(4)%></td>
     <td width="67" align="center">
     <% 
     if(rs.getInt(5)==1){
     out.print("男");
     }
     else{
     out.print("女");
     }
     %></td>
     <td width="124" align="center"><%=rs.getDate(6)%></td>
     <td width="160" align="left"><%=rs.getString(7)%></td>
     <td width="160" align="left"><%=rs.getString(8)%></td>
     <td width="105" align="center"><%=rs.getString(9)%></td>
     <td width="105" align="center"><%=rs.getString(10)%></td>
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
     
     
  
