<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%//request.setCharacterEncoding("GBK"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 <script type="text/javascript" src="../Js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="../Js/jquery-ui-1.8.custom.min.js"></script>
	<script language="javascript">
		jQuery().ready(function(){
			jQuery('#navigation').accordion({
				header: '.head',
				event: 'click',
				fillSpace: true,
				animated: 'bounceslide'
			});
		});
	</script>
	<style type="text/css">
<!--
body {
	margin:0px;
	padding:0px;
	font-size: 12px;
}
#navigation {
	margin:0px;
	padding:0px;
	width:147px;
}
#navigation a.head {
	cursor:pointer;
	background:url(../images/main_34.gif) no-repeat scroll;
	display:block;
	font-weight:bold;
	margin:0px;
	padding:5px 0 5px;
	text-align:center;
	font-size:12px;
	text-decoration:none;
}
#navigation ul {
	border-width:0px;
	margin:0px;
	padding:0px;
	text-indent:0px;
}
#navigation li {
	list-style:none; display:inline;
}
#navigation li li a {
	display:block;
	font-size:12px;
	text-decoration: none;
	text-align:center;
	padding:3px;
}
#navigation li li a:hover {
	background:url(../images/tab_bg.gif) repeat-x;
		border:solid 1px #adb9c2;
}
-->
</style>
 </head>
 <body LINK=firebrick VLINK=#660000 ALINK=red>
 <div  style="height:100%;">
  <ul id="navigation">
    <li> <a class="head">��ְ����</a>
      <ul>
        <li><a href="seekerManage.jsp" target="mainFrame">��ְ�߹���</a></li>
        <li><a href="seekerJob.jsp" target="mainFrame">��ְ��Ϣ���� </a></li>
      </ul>
    </li>
    <li> <a class="head">��Ƹ����</a>
      <ul>
        <li><a href="seekercom.jsp" target="mainFrame">��˾����</a></li>
        <li><a href="seekerpub.jsp" target="mainFrame">��Ƹ��Ϣ����</a></li>
      </ul>
    </li>
    <li> <a class="head">���Ź���</a>
      <ul>
        <li><a href="NewsServlet?method=list" target="mainFrame">�����б�</a></li>
        <li><a href="NewsServlet?method=addUI" target="mainFrame">�������</a></li>
      </ul>
    </li>
    <li> <a class="head">����</a>
      <ul>
        <li><a href="../logout.jsp" target="_parent"">�˳�</a></li>
      </ul>
    </li>
  </ul>
</div>
 </body>
</html>
