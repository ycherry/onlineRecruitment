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
  <td height="50" align="center"><div id="font">��Ƹ��Ϣ����</div></td>
  </tr>
  <tr>
  <td valign="top"><table  border="1" align="left"
  cellpadding="0" cellspacing="0" bgcolor="#f5f7f7">
  <tr align="center" bgcolor="blue">
  <td><div id="reg">����</div></td>
  <td height="22"><div id="reg">���</div></td>
   <td><div id="reg">��ҵ��</div></td>
    <td><div id="reg">רҵҪ��</div></td>
     <td><div id="reg">ְλ����</div></td>
     <td><div id="reg">н��Ҫ��</div></td>
     <td><div id="reg">��������</div></td>
     <td><div id="reg">��Ч����</div></td>
     <td><div id="reg">��ע��Ϣ</div></td>
     
     </tr>
     <%
     DataBaseConn con=new DataBaseConn();
     ResultSet rs=con.getRs("SELECT * FROM t_pubjob");
     while(rs.next()){
     %>
     <tr align="center">
     <td align="center"><a href="delSeeker4.jsp?jobid=<%=rs.getString(1)%>">ɾ��</a></td>
     <td height="22" align="center"><%=rs.getString(1)%></td>
     <td align="center"><%=rs.getString(2)%></td>
     <td align="center"><%=rs.getString(3)%></td>
     <td align="center"><%=rs.getString(4)%></td>
     <td align="center"><%=rs.getString(5)%></td>
     <td align="center"><%=rs.getDate(6)%></td>
     <td align="center"><%=rs.getDate(7)%></td>
     <td align="center"><%=rs.getString(8)%></td>
     
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
     
     
  
