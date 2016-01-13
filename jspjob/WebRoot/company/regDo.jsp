<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<jsp:useBean id="Company" class="com.job.domain.Company" scope="request" />
<!--构造 Company 类的对象 Company-->
<jsp:setProperty name="Company" property="*" />
<!--设置对象 Company 的属性-->
<%
System.out.println("Company:"+Company.getCtruename());
	DealString str = new DealString();
	ShowErrorBox show = new ShowErrorBox();

	DataBaseConn dbc = new DataBaseConn();
	try {
		java.sql.Statement st = dbc.getStmt();
		String sql = "insert into t_company(cuserName,ctrueName,tel,manage,address,email,resume) values('"
				+ Company.getCusername() + "','" + str.toGb(Company.getCtruename()) + "','" + Company.getTel()
				+ "','" + str.toGb(Company.getManage()) + "','" + str.toGb(Company.getAddress()) + "','"
				+ str.toGb(Company.getEmail()) + "','" + str.toGb(Company.getResume()) + "')";
		st.addBatch(sql);
		System.out.println(sql);
		sql = "insert into t_user(userName,userPass,userType)values('" + Company.getCusername() + "','"
				+ Company.getPassword() + "','2')";
		st.addBatch(sql);
		st.executeBatch();
		out.print("<script>alert('修改成功！');document.location='../index.jsp';</script>");
		return;
	} catch (Exception e) {
		out.print(show.errorBox("修改失败，数据库错误！", "错误信息"));
	}
%>