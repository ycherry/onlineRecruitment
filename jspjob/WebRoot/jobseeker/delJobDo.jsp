<%@page contentType="text/html;charset=GB2312"%>
<%@page import="com.util.*"%>
<%@page import="java.sql.*"%>
<%
String strId=(String)request.getParameter("intId");
String strName=(String)session.getAttribute("name");
DataBaseOperation data=new DataBaseOperation();
ShowErrorBox show=new ShowErrorBox();
if(strId!=null){
int intT=data.delete("DELETE FROM t_applyJob WHERE id="+strId);
if(intT>0){
out.print("<script>alert('ɾ���ɹ�!');document.location='index1.html';</script>");
}
else{
out.print(show.errorBox("���ݿ����","��Ϣ����"));
}
}else{
out.print(show.errorBox("���½��?","������Ϣ"));
}
%>