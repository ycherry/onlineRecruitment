<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.util.*" %>
<%@ page session="true" %>
<html>
<head>
<title>
login
</title>
</head>
<body bgcolor="ffffff">
<h1>
<%
String password=request.getParameter("password");
String username=request.getParameter("user");
int type=Integer.parseInt(request.getParameter("type"));
DataBaseOperation data=new DataBaseOperation();
int intT=data.getRowCount("t_user where username='"+username+"' and userPass='"+password+"'");
if(intT>0){
session.setAttribute("usercode",username);
session.setAttribute("usertype",new Integer(type));
switch(type)
{
case 1:response.sendRedirect("jobseeker/index.html");break;
case 2:response.sendRedirect("company/index.html");break;
case 3:response.sendRedirect("admin/index.html");break;
default:response.sendRedirect("index.jsp");break;
}
}
else
{
out.print("<script language=\"javascript\">alert(\"���µ�¼\"</script>");
response.sendRedirect("index.jsp");
}
 %>
</h1>
</body>
</html>