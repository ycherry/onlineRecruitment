<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.util.*" %>


<%  session.putValue("user",null);
  session.putValue("password",null);  %>
 
<SCRIPT language=JavaScript>
alert('用户成功退出登录，正在返回首页！');
this.location.href='./index.jsp';
</SCRIPT>
