<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="jobseeker" class="com.job.domain.JobSeeker"
	scope="request" />
<!--构造jobSeeker类的对象jobSeeker-->
<jsp:setProperty name="jobseeker" property="*" />
<!-- 设置对象jobSeeker的属性 -->
<%
	DealString str = new DealString();
	ShowErrorBox show = new ShowErrorBox();
	String SuserName = (String) session.getAttribute("usercode");
	jobseeker.setStruename(jobseeker.getStruename());
	jobseeker.setAge(jobseeker.getAge());
	jobseeker.setSex(jobseeker.getSex());
	jobseeker.setResume(jobseeker.getResume());
	jobseeker.setSchool(jobseeker.getSchool());
	jobseeker.setSpecialty(jobseeker.getSpecialty());
	jobseeker.setKnowledge(jobseeker.getKnowledge());
	jobseeker.setEmail(jobseeker.getEmail());
	jobseeker.setBirthday(jobseeker.getBirthday());
	out.print("sssss" + SuserName);

	DataBaseConn dbc = new DataBaseConn();
	try {
		java.sql.Statement st = dbc.getStmt();
	/*	String sql = "UPDATE t_jobseeker SET trueName=" + "'" + str.toGb(jobseeker.getStruename()) + "'"
				+ ",age=" + "'" + jobseeker.getAge() + "'" + ",sex=" + "'" + jobseeker.getSex() + "'"
				+ ",birthday=" + "'" + str.toGb(jobseeker.getBirthday()) + "'" + ",school=" + "'"
				+ str.toGb(jobseeker.getSchool()) + "'" + ",specialty=" + "'"
				+ str.toGb(jobseeker.getSpecialty()) + "'" + ",knowledge=" + "'"
				+ str.toGb(jobseeker.getKnowledge()) + "'" + ",email=" + "'" + str.toGb(jobseeker.getEmail())
				+ "'" + ",resume=" + "'" + str.toGb(jobseeker.getResume()) + "'" + "WHERE auserName=" + "'"
				+ SuserName + "'";
	*/
	String sql = "UPDATE t_jobseeker SET trueName=" + "'" + jobseeker.getStruename() + "'"
			+ ",age=" + "'" + jobseeker.getAge() + "'" + ",sex=" + "'" + jobseeker.getSex() + "'"
			+ ",birthday=" + "'" + jobseeker.getBirthday() + "'" + ",school=" + "'"
			+ jobseeker.getSchool() + "'" + ",specialty=" + "'"
			+ jobseeker.getSpecialty() + "'" + ",knowledge=" + "'"
			+ jobseeker.getKnowledge() + "'" + ",email=" + "'" +jobseeker.getEmail()
			+ "'" + ",resume=" + "'" +jobseeker.getResume() + "'" + "WHERE auserName=" + "'"
			+ SuserName + "'";
		st.addBatch(sql);
		st.executeBatch();
		out.print("<script>alert('修改成功！');document.location='index1.html';</script>");
		return;
	} catch (Exception e) {
		out.print(show.errorBox("修改失败，数据库错误！", "错误信息"));
	}
%>
