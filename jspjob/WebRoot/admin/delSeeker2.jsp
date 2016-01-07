<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.util.*" %>
<%
String jobid=(String)request.getParameter("jobid");
DataBaseOperation data=new DataBaseOperation();
int intT=data.delete("DELETE FROM t_applyJob WHERE jobid='"+jobid+"'");
if(intT>0){
out.print("<script>alert('É¾³ý³É¹¦£¡');document.location='index1.html';</script>");
}else{
new ShowErrorBox().errorBox("É¾³ýÊ§°Ü£¡","´íÎóÐÅÏ¢");
}
%>