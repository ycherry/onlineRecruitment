<%@ page contentType="text/html;charset=GBK" import="java.util.*"%>
<%@page import="com.job.dao.NewsDao"%>
<%@page import="com.job.domain.News"%>
<html>
<title>欢迎登陆人才招聘网</title>
<style type="text/css">
<!--
.STYLE2 {
	color: #000000
}

.STYLE7 {
	font-size: 16px
}

.STYLE10 {
	font-size: 20px;
	font-weight: bold;
	color: #FFFFFF;
}
-->
</style>
<body style="margin: 0px; padding: 0px; text-align: center;">
	<form name="login" action="login.jsp">
		<table width="810" height="591" border="0" bordercolor="#C8D5E4" align="center">
			<tr>
				<td height="152" colspan="4"><img src="images/topimg1.jpg"
					width="100%" height="90%" /></td>
			</tr>
			<tr bgcolor="#D74404">
				<td height="28" align="right"><span class="STYLE10" align="right">在线简历填写</span></td>
				<td align="left"><a
					href="/jspjob/jobseeker/pubJob.jsp" class="back STYLE7">简历填写</a></td>
			</tr>

	<!--		<tr>
				<td width="900" rowspan="6" align="left" valign="top">
					<table width="596" border="0" cellspacing="0" cellpadding="0">
							<tr>
				 			<td height="28" colspan="4" bgcolor="#D74404"><span
								class="STYLE10"> <img src="/jspjob/countServlet"
									height="0" width="0" /> <span>当前在线人数 :</span> <%=request.getSession().getServletContext()
					.getAttribute("count")%>
							</span></td>
							<td height="28" colspan="8" bgcolor="#D74404"><span
								class="STYLE10"> <span>北京时间:</span> <%=new Date().toLocaleString()%>
							</span></td> 
						</tr>
						<tr bgcolor="#D74404">
							<td height="28" colspan="8"><span class="STYLE10">在线简历填写</span></td>
							<td width="33" height="21" align="center"><img
								src="images/infi_52.jpg" width="8" height="10" /></td>
							<td width="400" align="left"><a
								href="/jspjob/jobseeker/pubJob.jsp" class="back STYLE7">简历填写</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		-->
			<tr>
				<td width="151" height="40" align="right" bgcolor="#C8D5E4"><span
					class="STYLE2"> 用户名: </span></td>
				<td width="144" height="40" bgcolor="#C8D5E4"><input
					name="user" type="text" size="15"></td>


			</tr>
			<tr bgcolor="#C8D5E4">
				<td width="151" height="40" align="right"><span class="STYLE2">
						密码: </span></td>
				<td width="144" height="40"><input name="password"
					type="password" size="15"></td>
			</tr>
			<tr bgcolor="#C8D5E4">
				<td width="151" height="40" align="right"><span class="STYLE2">
						<input type=radio name="type" value=1 checked> <font
						size="2">个人求职</font>
				</span></td>
				<td width="144" height="40"><span class="STYLE2" > <input
						type=radio name="type" value=2> <font size="2" >企业招聘</font>
				</span></td>
			</tr>
			<tr bgcolor="#C8D5E4">
				<td width="151" height="40" align="right"><input name="submit"
					type="submit" value="登陆"></td>
				<td width="144" height="40"><input name="reset" type="reset"
					value="重置"></td>
			</tr>
			<tr bgcolor="#C8D5E4">
				<td width="151" height="37" align="right"><a href="company/reg.html"><img
						src="images/company_regsiter.gif" /> </a></td>
				<td width="144" height="37"><a href="jobseeker/reg.html"><img
						src="images/person_regsiter.gif" /> </a></td>
			</tr>
			<tr>
			<td align="right"><img src="images/421_7831.gif" width="270" /></td>
			<td><img src="images/7992.gif" width="270" /></td>
	<!-- 	<td><img src="images/907.gif" width="270" /></td>  -->	
			</tr> 
		</table>
	</form>
</body>
</html>