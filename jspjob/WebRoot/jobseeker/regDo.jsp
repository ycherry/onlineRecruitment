<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="jobSeeker" class="com.job.domain.JobSeeker"
	scope="request" />
<!--构造 jobSeeker 类的对象 jobSeeker-->
<jsp:setProperty name="jobSeeker" property="*" />
<!--设置对象 jobSeeker 的属性-->
<%
	System.out.println("jobSeeker:");
	
	DealString str = new DealString();
	System.out.println(new String(request.getParameter("struename").getBytes("utf-8"),"utf-8"));
	ShowErrorBox show = new ShowErrorBox();
	if (jobSeeker.getSusername().compareTo("z") >= 0 || jobSeeker.getSusername().compareTo("0") <= 0) {
		out.print(show.errorBox("注册用户名不允许为特殊字符和汉字！", "错误信息"));
		return;
	}
	DataBaseConn dbc = new DataBaseConn();
	try {
		java.sql.Statement st = dbc.getStmt();
		String sql = "INSERT INTO t_jobSeeker(auserName,trueName,age,sex,birthday,"
				+ "school,specialty,knowledge,email,resume)VALUES('" + jobSeeker.getSusername() + "','"
				+ str.toGb(jobSeeker.getStruename()) + "','" + jobSeeker.getAge() + "','" + jobSeeker.getSex()
				+ "','" + jobSeeker.getBirthday() + "','" + str.toGb(jobSeeker.getSchool()) + "','"
				+ str.toGb(jobSeeker.getSpecialty()) + "','" + str.toGb(jobSeeker.getKnowledge()) + "','"
				+ jobSeeker.getEmail() + "','" + str.toGb(jobSeeker.getResume()) + "')";
		st.addBatch(sql);
		System.out.println(sql);
		sql = "insert into t_user(userName,userPass,userType)values('" + jobSeeker.getSusername() + "','"
				+ jobSeeker.getPassword() + "','1')";
		st.addBatch(sql);
		st.executeBatch();
		out.print("<script>alert('注册成功！');document.location='../index.jsp';</script>");
		return;
	} catch (Exception e) {
		out.print(show.errorBox("修改失败，数据库错误！", "错误信息"));
	}
%>