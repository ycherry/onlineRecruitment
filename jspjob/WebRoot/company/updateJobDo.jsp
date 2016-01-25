<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="companyPublishJob"
	class="com.job.domain.CompanyPublishJob" scope="request" />
<jsp:setProperty property="*" name="companyPublishJob" />
<%
	String intId = (String) request.getParameter("intId");
	System.out.print("intId" + intId);
	ShowErrorBox show = new ShowErrorBox();
	DataBaseConn dbc = new DataBaseConn();
	try {
		java.sql.Statement stat = dbc.getStmt();
		String sql = "update t_pubjob set specialty='" + companyPublishJob.getSpecialty() + "', jobName='"
				+ companyPublishJob.getJobName() + "',education='" + companyPublishJob.getEducation()
				+ "',salary='" + companyPublishJob.getSalary() + "',endtime='" + companyPublishJob.getEndTime()
				+ "'where id='" + intId + "'";
		System.out.println(sql);
		stat.addBatch(sql);
		stat.execute(sql);
		out.print("<script>alert('修改招聘信息成功！');document.location='editJobSelect.jsp' ;</script>");
		return;
	} catch (Exception e) {
		out.print(show.errorBox("修改数据库失败", "错误信息"));
	}
%>