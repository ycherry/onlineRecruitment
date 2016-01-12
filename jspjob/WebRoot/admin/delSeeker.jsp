<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.util.*" %>
<%
String auserName=(String)request.getParameter("auserName");
DataBaseOperation data=new DataBaseOperation();
int intT=data.delete("DELETE FROM t_jobSeeker WHERE auserName='"+auserName+"'");
if(intT>0){
out.print("<script>alert('删除成功！');document.location='index1.html';</script>");
}else{
new ShowErrorBox().errorBox("删除失败！","错误信息");
}
%>