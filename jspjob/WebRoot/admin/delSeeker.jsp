<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.util.*" %>
<%
String auserName=(String)request.getParameter("auserName");
DataBaseOperation data=new DataBaseOperation();
int intT=data.delete("DELETE FROM t_jobSeeker WHERE auserName='"+auserName+"'");
if(intT>0){
out.print("<script>alert('ɾ���ɹ���');document.location='index1.html';</script>");
}else{
new ShowErrorBox().errorBox("ɾ��ʧ�ܣ�","������Ϣ");
}
%>