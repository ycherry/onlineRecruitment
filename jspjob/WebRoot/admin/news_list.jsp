<%@ page language="java" import="java.net.*,java.util.*,com.job.domain.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>新闻列表</title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
A:active,A:visited,A:link {
	COLOR: #0629FD;
	TEXT-DECORATION: none
}

A:hover {
	COLOR: #FF6600;
	TEXT-DECORATION: none
}

A.relatelink:active,A.relatelink:visited,A.relatelink:link { 
	color: white;
	TEXT-DECORATION: none
}

A.relatelink:hover {
	COLOR: #FF6600;
	TEXT-DECORATION: none
}

td {
	font-size: 12px;
	color: #003366;
	height:24px
}

.STYLE1 a{
	COLOR: white;
}
.STYLE1 A:active,.STYLE1 A:visited,.STYLE1 A:link {
	COLOR: white;
	TEXT-DECORATION: none
}
.STYLE1 a:hover{
	COLOR: red;
}
-->
</style>

<script type="text/javascript">


	function del()
	{
		//判断有哪些checkbox框被选中了
		var idCheckboxs = document.getElementsByName("id");
		var url = "NewsServlet?method=delete";

		//该数组里存放的是所有的已经选好的复选框
		var checkedIds = [];

		for(var i = 0 ; i < idCheckboxs.length ; i ++)
		{
			if(idCheckboxs[i].checked)
			{
				checkedIds[checkedIds.length] = idCheckboxs[i].value;
			}
		}

		for(var i=0; i<checkedIds.length; i++)
		{
			url = url + "&id="+checkedIds[i];
		}

		//通过GET方式，向后台递交一个请求
		window.location = url;
	}



	/*
	function selectAll(field)
	{
		//根据checkbox框的名称，查询得到所有的checkbox对象
		var idCheckboxs = document.getElementsByName("id");

		for(var i = 0 ; i < idCheckboxs.length ; i++)
		{
			if(field.checked)
			{
				idCheckboxs[i].checked = true;
			}
			else
			{
				idCheckboxs[i].checked = false;
			}
		}
	}
	*/

	function selectAll(field)
	{
		//根据checkbox框的名称，查询得到所有的checkbox对象
		var idCheckboxs = document.getElementsByName("id");

		if(idCheckboxs.length)
		{
			for(var i = 0 ; i < idCheckboxs.length ; i++)
			{
				if(!idCheckboxs[i].disabled) idCheckboxs[i].checked=field.checked;
			}
		}
		else
		{
			if(!idCheckboxs[i].disabled) idCheckboxs.checked=field.checked;
		}
	}


	
</script>


</head>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">新闻信息列表</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
             &nbsp;&nbsp;<img src="images/add.gif" width="10" height="10" /> <a href="ArticleServlet?method=addUI">添加</a>   
             &nbsp;&nbsp;<img src="images/edit.gif" width="10" height="10" /> <a href="#">发布</a>
             &nbsp; <img src="images/del.gif" width="10" height="10" /> <a href="javascript:del();">删除</a>    &nbsp;&nbsp;   &nbsp;
             </span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkbox" onclick="selectAll(this)" />
        </div></td>
        <td width="100" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">新闻标题</span></div></td>
        <td width="70" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">创建时间</span></div></td>
        <td width="70" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">发布时间</span></div></td>
        <td width="100" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
      </tr>
      <%
      	List<News> news = (List<News>)request.getAttribute("news");
      	
      	for(int i = 0 ;i < news.size() ; i++)
      	{
			News n = news.get(i);      	
      %>
	      <tr>
	        <td height="20" bgcolor="#FFFFFF"><div align="center">
	          <input type="checkbox" name="id" value="<%= n.getId() %>" />
	        </div></td>
	        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=n.getTitle() %></div></td>
	        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=n.getCreateTime().toLocaleString() %></div></td>
	        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=n.getDeployTime().toLocaleString() %></div></td>
	        <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21">
	        <a href="NewsServlet?method=deploy&id=<%= n.getId() %>" title="点击发布新闻">发布</a> | 
	        <a href="NewsServlet?method=delete&id=<%= n.getId() %>" title="点击删除新闻">删除</a> |
	        </div></td>
	      </tr>
      
      <%} %>
      
    </table></td>
  </tr>
</table>
</body>
</html>

