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
  <td height="50" align="center"><div id="font">��ְ�߹���</div></td>
  </tr>
  <tr>
  <td valign="top"><table  border="1" align="left"
  cellpadding="0" cellspacing="0" bgcolor="#f5f7f7">
  <tr align="center" bgcolor="pink">
   <td width="78"><div id="reg">����</div></td>
    <td width="123"><div id="reg">����</div></td>
    <td width="80"><div id="reg">����</div></td>
     <td width="67"><div id="reg">�Ա�</div></td>
     <td width="154"><div id="reg">��������</div></td>
     <td width="160"><div id="reg">��ҵѧУ</div></td>
     <td width="150"><div id="reg">��ѧרҵ</div></td>
     <td width="105"><div id="reg">ѧ��</div></td>
     <td width="206"><div id="reg">�����ʼ�</div></td>
	 
     </tr>
     <%
     DataBaseConn con=new DataBaseConn();
     ResultSet rs=con.getRs("SELECT * FROM t_jobSeeker");
     while(rs.next()){
     %>
     <tr align="center">
     <td width="78" align="center"><a href="delSeeker.jsp?auserName=<%=rs.getString(2)%>">ɾ��</a></td>
     <td width="123" align="center"><%=rs.getString(3)%></td>
     <td width="101" align="center"><%=rs.getString(4)%></td>
     <td width="67" align="center">
     <% 
     if(rs.getInt(5)==1){
     out.print("��");
     }
     else{
     out.print("Ů");
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
     
     
  
