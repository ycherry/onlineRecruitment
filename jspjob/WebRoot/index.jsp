<%@ page contentType="text/html;charset=GBK" import="java.util.*" %>
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
			<table width="900" height="591" border="0" bordercolor="#C8D5E4">
				<tr>
					<td height="152" colspan="4">
						<img src="images/headTop.jpg" width="100%" height="90%" />
					</td>
				</tr>
				<tr>
					<td width="151" height="40" align="left" bgcolor="#C8D5E4">
						<span class="STYLE2"> 用户名: </span>
					</td>
					<td width="144" height="40" bgcolor="#C8D5E4">
						<input name="user" type="text" size="15">
					</td>
					<td width="597" rowspan="6" align="left" valign="top">
						<table width="596" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="28" colspan="4" bgcolor="#D74404">
									<span class="STYLE10">最新招聘信息</span>
									<span class="STYLE10">
										<img src="/jspjob/countServlet" height="0" width="0"/>
										<span>当前在线人数 </span>
										<%=request.getSession().getServletContext().getAttribute("count") %>
									</span>
									
									<span class="STYLE10">
										<span>北京时间</span>
										<%=new Date().toLocaleString()%>
									</span>
									
								</td>
							</tr>
							<tr>
								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="400" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">陕西永辉测控技术有限公司 </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="400" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">莆田市鹏飞电子有限公司 </a>
								</td>
							</tr>

							<tr>


								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">陕西量得实业开发有限公司 </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="332" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">西安约克仪器有限公司 </a>
								</td>
							</tr>

							<tr>


								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">西安山脉科技发展有限公司 </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="332" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">西安交大辰方科技有限公司 </a>
								</td>
							</tr>

							<tr>


								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">广东德邦物流有限公司 </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="332" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">西安未来国际软件有限公司 </a>
								</td>
							</tr>

							<tr>
								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">陕西中航气弹簧有限责任公司 </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="332" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">西安爱科电子有限责任公司 </a>
								</td>
							</tr>

							<tr>
								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">陕西上格之路生物科学有限公司 </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="332" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">西安中洲电力设备有限公司 </a>
								</td>
							</tr>

							<tr>
								<td height="28" colspan="4" bgcolor="#D74404">
									<span class="STYLE10">新闻浏览</span>
								</td>
							</tr>
							
							
							<tr>
							
								<%
									NewsDao dao = new NewsDao();
								
									List<News> newses = dao.getNewsList();
									
									for(int i = 0 ; i < newses.size() ; i++)
									{
										News news = newses.get(i);								
								%>
							
								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="/jspjob/orderOfferServlet?id=<%=news.getId() %>" class="back STYLE7"><%=news.getTitle() %></a>
								</td>
								
								<%} %>
								
							</tr>
							
							<tr>
								<td height="28" colspan="4" bgcolor="#D74404">
									<span class="STYLE10">在线简历填写</span>
								</td>
							</tr>
							
							<tr>
								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="400" align="left" bgcolor="#ffffff">
									<a href="/jspjob/jobseeker/pubJob.jsp" class="back STYLE7">简历填写</a>
								</td>
							</tr>
							
							
						</table>
					</td>
					
				</tr>
				<tr bgcolor="#C8D5E4">
					<td width="151" height="40" align="left">
						<span class="STYLE2"> 密码: </span>
					</td>
					<td width="144" height="40">
						<input name="password" type="password" size="15">
					</td>
				</tr>
				<tr bgcolor="#C8D5E4">
					<td width="151" height="40" align="left">
						<span class="STYLE2"> <input type=radio name="type" value=1
								checked> <font size="2">个人求职</font>
						</span>
					</td>
					<td width="144" height="40">
						<span class="STYLE2"> <input type=radio name="type" value=2>
							<font size="2">企业招聘</font>
						</span>
					</td>
				</tr>
				<tr bgcolor="#C8D5E4">
					<td width="151" height="40" align="right">
						<input name="submit" type="submit" value="登陆">
					</td>
					<td width="144" height="40">
						<input name="reset" type="reset" value="重置">
					</td>
				</tr>
				<tr bgcolor="#C8D5E4">
					<td width="151" height="37">
						<a href="company/reg.html"><img
								src="images/company_regsiter.gif" />
						</a>
					</td>
					<td width="144" height="37">
						<a href="jobseeker/reg.html"><img
								src="images/person_regsiter.gif" />
						</a>
					</td>
				</tr>
				<tr>
					<td height="220" colspan="2" align="left">

						<img src="images/421_7831.gif" width="304" />
						<img src="images/7992.gif" width="304" />
						<img src="images/907.gif" width="304" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>