<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.util.*"%>
<%
String cuserName=(String)request.getParameter("cuserName");
DataBaseOperation data=new DataBaseOperation();
int intT=data.delete("DELETE FROM t_company WHERE cuserName='"+cuserName+"'");
if(intT>0){
out.print("<script>alert('ɾ���ɹ���');document.location='index1.html';</script>");
}else{
new ShowErrorBox().errorBox("ɾ��ʧ�ܣ�","������Ϣ");
}
%>