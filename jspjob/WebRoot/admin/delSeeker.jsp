<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.util.*" %>
<%
String auserName=(String)request.getParameter("auserName");
DataBaseOperation data=new DataBaseOperation();
int intT=data.delete("DELETE FROM t_jobSeeker WHERE auserName='"+auserName+"'");
if(intT>0){
out.print("<script>alert('É¾³ý³É¹¦£¡');document.location='index1.html';</script>");
}else{
new ShowErrorBox().errorBox("É¾³ýÊ§°Ü£¡","´íÎóÐÅÏ¢");
}
%>