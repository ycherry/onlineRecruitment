<%@ page contentType="text/html;charset=GBK" import="java.util.*" %>
<%@page import="com.job.dao.NewsDao"%>
<%@page import="com.job.domain.News"%>
<html>
	<title>��ӭ��½�˲���Ƹ��</title>
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
						<span class="STYLE2"> �û���: </span>
					</td>
					<td width="144" height="40" bgcolor="#C8D5E4">
						<input name="user" type="text" size="15">
					</td>
					<td width="597" rowspan="6" align="left" valign="top">
						<table width="596" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="28" colspan="4" bgcolor="#D74404">
									<span class="STYLE10">������Ƹ��Ϣ</span>
									<span class="STYLE10">
										<img src="/jspjob/countServlet" height="0" width="0"/>
										<span>��ǰ�������� </span>
										<%=request.getSession().getServletContext().getAttribute("count") %>
									</span>
									
									<span class="STYLE10">
										<span>����ʱ��</span>
										<%=new Date().toLocaleString()%>
									</span>
									
								</td>
							</tr>
	<!--  						<tr>
								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="400" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">�������Բ�ؼ������޹�˾ </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="400" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">���������ɵ������޹�˾ </a>
								</td>
							</tr>

							<tr>


								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">��������ʵҵ�������޹�˾ </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="332" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">����Լ���������޹�˾ </a>
								</td>
							</tr>

							<tr>


								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">����ɽ���Ƽ���չ���޹�˾ </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="332" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">�������󳽷��Ƽ����޹�˾ </a>
								</td>
							</tr>

							<tr>


								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">�㶫�°��������޹�˾ </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="332" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">����δ������������޹�˾ </a>
								</td>
							</tr>

							<tr>
								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">�����к��������������ι�˾ </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="332" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">�������Ƶ����������ι�˾ </a>
								</td>
							</tr>

							<tr>
								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="287" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">�����ϸ�֮·�����ѧ���޹�˾ </a>
								</td>


								<td width="30" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="332" align="left" bgcolor="#ffffff">
									<a href="" class="back STYLE7">�������޵����豸���޹�˾ </a>
								</td>
							</tr>
-->
							<tr>
								<td height="28" colspan="4" bgcolor="#D74404">
									<span class="STYLE10">�������</span>
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
									<span class="STYLE10">���߼�����д</span>
								</td>
							</tr>
							
							<tr>
								<td width="33" height="21" align="center">
									<img src="images/infi_52.jpg" width="4" height="5" />
								</td>
								<td width="400" align="left" bgcolor="#ffffff">
									<a href="/jspjob/jobseeker/pubJob.jsp" class="back STYLE7">������д</a>
								</td>
							</tr>
							
							
						</table>
					</td>
					
				</tr>
				<tr bgcolor="#C8D5E4">
					<td width="151" height="40" align="left">
						<span class="STYLE2"> ����: </span>
					</td>
					<td width="144" height="40">
						<input name="password" type="password" size="15">
					</td>
				</tr>
				<tr bgcolor="#C8D5E4">
					<td width="151" height="40" align="left">
						<span class="STYLE2"> <input type=radio name="type" value=1
								checked> <font size="2">������ְ</font>
						</span>
					</td>
					<td width="144" height="40">
						<span class="STYLE2"> <input type=radio name="type" value=2>
							<font size="2">��ҵ��Ƹ</font>
						</span>
					</td>
				</tr>
				<tr bgcolor="#C8D5E4">
					<td width="151" height="40" align="right">
						<input name="submit" type="submit" value="��½">
					</td>
					<td width="144" height="40">
						<input name="reset" type="reset" value="����">
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