<%@page contentType="text/html;charset=UTF-8" import="java.util.*"%>
<%@page import="com.job.dao.NewsDao"%>
<%@page import="com.job.domain.News"%>
<html ng-app="myModule">
<head>
<title>欢迎登陆人才招聘网</title>
<script type="text/javascript" src="Js/util/jquery.js"></script>
<script type="text/javascript" src="Js/util/bootstrap.js"></script>
<script type="text/javascript" src="Js/util/angular.js"></script>
<script type="text/javascript" src="Js/company/reg.js"></script>
<link rel="stylesheet" type="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" type="stylesheet" href="	css/index.css">
<link rel="stylesheet" type="stylesheet" href="	css/common.css">
<link rel="stylesheet" type="stylesheet" href="	css/common/login.css">
<link rel="stylesheet" type="stylesheet" href="	css/common/css.css">
</head>
<body ng-controller="myCtrl">
	<div class="logoin_banner">
		<div id="slides" class="s_lb">
			<div class="slides_container">
				<div class="slide">
					<img src='images/login/loginbg.JPG'></a>
				</div>

			</div>
		</div>
	</div>
	<form role="form" name="login" action="login.jsp">
		<div class="logoin_cont_box">
			<div class="logoin_bg"></div>
			<div class="login_left ">
				<div class="login_box_cont">
					<div class="login_box_h1_d" id='usertype1'>会员登录</div>
					<div class="clear"></div>
					<div class="lgoin_box_cot" id='login_cur'>
						<div class="col-md-offset-1 col-md-10 login_box_list logoin_re">
							<input type="text" class="form-control" id="user" name="user"
								placeholder="请输入您的用户名" ng-model="user" required>
						</div>
						<div class="col-md-offset-1 col-md-10 login_box_list logoin_re">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="请输入您的密码" ng-model="password"
								required>
						</div>

						<div class=" col-md-offset-1 login_box_list logoin_re">
							<div class=" col-md-6	">
								<label style="color: #ffffff"> <input type="radio"
									name="type" id="userType1" value="1" checked> 个人用户
								</label>
							</div>
							<div class="col-md-6">
								<label style="color: #ffffff"> <input type="radio"
									name="type" id="userType1" value="2"> 企业用户
								</label>
							</div>
						</div>
						<div class=" col-md-offset-1  form-group login_box_cz">
							<div class=" col-md-11">
								<button type="submit" class="btn btn-primary"
									style="width: 100%">立即登录</button>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-offset-1 col-md-4">
								<button type="button" class="btn btn-info"
									onclick="window.location.href='jobseeker/reg.html'">
									个人用户注册</a>
								</button>
							</div>
							<div class="col-md-offset-1 col-md-4">
								<button type="button" class="btn btn-info"
									onclick="window.location.href='company/reg.html'">
									企业用户注册</a>
								</button>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="row">
		<dl class="col-md-offset-2 login_list">
			<dt>
				<img src="images/login/log_img1.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">强大的招聘平台</div>
				<div class="login_list_p">提供快捷、高效、可靠地网上招聘</div>
			</dd>
		</dl>
		<dl class="login_list">
			<dt>
				<img src="images/login/log_img2.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">收获职业机会</div>
				<div class="login_list_p">好机会主动找上你，成就职业成功</div>
			</dd>
		</dl>
		<dl class="login_list">
			<dt>
				<img src="images/login/log_img3.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">打造职业形象</div>
				<div class="login_list_p">创建职业档案，持续展示自己的优势</div>
			</dd>
		</dl>
	</div>
	<div class="clear"></div>
	<div class="footer">
		<div class="foot">
			<div class="foot_conent">
				<div class="footer_left">
					<dl class="footer_list">
						<dt>关于我们</dt>
						<dd>
							<ul>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/index.html"
									title="关于我们">关于我们</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/service.html"
									title="注册协议">注册协议</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/phpyun.html"
									title="法律声明">法律声明</a></li>
							</ul>
						<dd>
					</dl>
					<dl class="footer_list">
						<dt>支付信息</dt>
						<dd>
							<ul>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/yh.html"
									title="银行帐户">银行帐户</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/pinpai.html"
									title="品牌推广">品牌推广</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/charge.html"
									title="收费标准">收费标准</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/indexzy.html"
									title="经营资源">经营资源</a></li>
							</ul>
						<dd>
					</dl>
					<dl class="footer_list">
						<dt>网站特色</dt>
						<dd>
							<ul>
								<li><a href="m_redeem.html" title="积分兑换">积分兑换</a></li>
								<li><a href="index.php?m=subscribe" title="订阅服务">订阅服务</a></li>
							</ul>
						<dd>
					</dl>
					<dl class="footer_list">
						<dt>咨询反馈</dt>
						<dd>
							<ul>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/kf.html"
									title="客服中心">客服中心</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/gg.html"
									title="广告投放">广告投放</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/newuser.html"
									title="新手指引">新手指引</a></li>
							</ul>
						<dd>
					</dl>
				</div>
			</div>
		</div>
	</div>

	<!--foot  end-->

	<form role="form" name="login" action="login.jsp">
		<div class="row">
			<img src="images/topimg1.jpg" width="80%" height="30%" />
		</div>
		<div class="row">
			<div class="col-md-6">需要添加其它内容</div>
			<div class="col-md-6">
				<div class="row form-group labelStyle">
					<div class=" col-md-2">
						<label for="userName">用户名:</label>
					</div>
					<div class="col-md-6">
						<input type="text" class="form-control" id="user" name="user"
							placeholder="请输入您的用户名" ng-model="user" required>
					</div>
					<div class="col-md-3">
						<span class="invalid"
							ng-show="login.user.$error.required &&login.user.$dirty">用户名不能为空!</span>
					</div>
				</div>
				<div class="row form-group labelStyle">
					<div class=" col-md-2">
						<label for="pwd">密码:</label>
					</div>
					<div class="col-md-6">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="请输入您的密码" ng-model="password"
							required>
					</div>
					<div class="col-md-3">
						<span class="invalid"
							ng-show="login.password.$error.required &&login.password.$dirty">用户名不能为空!</span>
					</div>
				</div>
				<div class="row form-group">
					<div class=" col-md-4	">
						<label> <input type="radio" name="type" id="userType1"
							value="1" checked> 个人用户
						</label>
					</div>
					<div class="col-md-4">
						<label> <input type="radio" name="type" id="userType1"
							value="2"> 企业用户
						</label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-md-offset-1 col-md-7">
						<button type="submit" class="btn btn-primary " style="width: 100%">立即登录</button>
					</div>


				</div>
				<div class="row form-group">
					<div class=" col-md-5">
						<button type="button" class="btn btn-info"
							onclick="window.location.href='jobseeker/reg.html'">
							&nbsp;&nbsp;&nbsp;&nbsp;个人用户注册&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</button>
					</div>
					<div class="col-md-3">
						<button type="button" class="btn btn-info"
							onclick="window.location.href='company/reg.html'">
							&nbsp;&nbsp;&nbsp;&nbsp;企业用户注册&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</button>
					</div>

				</div>
			</div>
		</div>
	</form>
	<div class="row">
		<dl class="col-md-offset-2 login_list">
			<dt>
				<img src="images/login/log_img1.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">强大的招聘平台</div>
				<div class="login_list_p">提供快捷、高效、可靠地网上招聘</div>
			</dd>
		</dl>
		<dl class="login_list">
			<dt>
				<img src="images/login/log_img2.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">收获职业机会</div>
				<div class="login_list_p">好机会主动找上你，成就职业成功</div>
			</dd>
		</dl>
		<dl class="login_list">
			<dt>
				<img src="images/login/log_img3.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">打造职业形象</div>
				<div class="login_list_p">创建职业档案，持续展示自己的优势</div>
			</dd>
		</dl>
	</div>

	<!--	<form role="form" name="login" action="login.jsp">
		<table width="810" height="591" border="0" bordercolor="#C8D5E4"
			align="center">
			<tr>
				<td height="152" colspan="4"><img src="images/topimg1.jpg"
					width="100%" height="90%" /></td>
			</tr>
			<tr bgcolor="#D74404">
				<td height="28" align="right"><span class="STYLE10"
					align="right">在线简历填写</span></td>
				<td align="left"><a href="/jspjob/jobseeker/pubJob.jsp"
					class="back STYLE7">简历填写</a></td>
			</tr>

					<tr>
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
				<td width="144" height="40"><span class="STYLE2"> <input
						type=radio name="type" value=2> <font size="2">企业招聘</font>
				</span></td>
			</tr>
			<tr bgcolor="#C8D5E4">
				<td width="151" height="40" align="right"><input name="submit"
					type="submit" value="登陆"></td>
				<td width="144" height="40"><input name="reset" type="reset"
					value="重置"></td>
			</tr>
			<tr bgcolor="#C8D5E4">
				<td width="151" height="37" align="right"><a
					href="company/reg.html"><img src="images/company_regsiter.gif" />
				</a></td>
				<td width="144" height="37"><a href="jobseeker/reg.html"><img
						src="images/person_regsiter.gif" /> </a></td>
			</tr>
			<tr>
				<td align="right"><img src="images/421_7831.gif" width="270" /></td>
				<td><img src="images/7992.gif" width="270" /></td>
					<td><img src="images/907.gif" width="270" /></td>  
			</tr>
		</table>
	</form>
	
-->
</body>
</html>