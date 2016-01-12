<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.util.*"%>
<%@page import="java.sql.*"%>
<%
String strId=(String)request.getParameter("intId");

DataBaseOperation data=new DataBaseOperation();
ShowErrorBox show=new ShowErrorBox();
if(strId!=null){
int intT=data.delete("DELETE FROM t_pubjob WHERE jobid="+strId);
if(intT>0){
out.print("<script>alert('删除成功!');document.location='index1.html';</script>");
}
else{
out.print(show.errorBox("数据库错误","信息错误"));
}
}else{
out.print(show.errorBox("你登陆过?","警告信息"));
}
%>