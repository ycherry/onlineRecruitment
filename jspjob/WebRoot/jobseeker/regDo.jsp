<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%
	//request.setCharacterEncoding("gb2312");
%>
<jsp:useBean id="jobSeeker" class="com.job.domain.JobSeeker" scope="request" />
<!--���� jobSeeker ��Ķ��� jobSeeker-->
<jsp:setProperty name="jobSeeker" property="*" />
<!--���ö��� jobSeeker ������-->
<%
	DealString str = new DealString();
	ShowErrorBox show = new ShowErrorBox();
	if (jobSeeker.getSusername().compareTo("z") >= 0
			|| jobSeeker.getSusername().compareTo("0") <= 0) {
		out.print(show.errorBox("ע���û���������Ϊ�����ַ��ͺ��֣�", "������Ϣ"));
		return;
	}
	DataBaseConn dbc = new DataBaseConn();
	try {
		java.sql.Statement st = dbc.getStmt();
		String sql = "INSERT INTO t_jobSeeker(auserName,trueName,age,sex,birthday,"
				+ "school,specialty,knowledge,email,resume)VALUES('"
				+ jobSeeker.getSusername()
				+ "','"
				+ str.toGb(jobSeeker.getStruename())
				+ "','"
				+ jobSeeker.getAge()
				+ "','"
				+ jobSeeker.getSex()
				+ "','"
				+ jobSeeker.getBirthday()
				+ "','"
				+ str.toGb(jobSeeker.getSchool())
				+ "','"
				+ str.toGb(jobSeeker.getSpecialty())
				+ "','"
				+ str.toGb(jobSeeker.getKnowledge())
				+ "','"
				+ jobSeeker.getEmail()
				+ "','"
				+ str.toGb(jobSeeker.getResume()) + "')";
		st.addBatch(sql);
		sql = "insert into t_user(userName,userPass,userType)values('"
				+ jobSeeker.getSusername() + "','"
				+ jobSeeker.getPassword() + "','" + jobSeeker.getSex()
				+ "')";
		st.addBatch(sql);
		st.executeBatch();
		out
				.print("<script>alert('ע��ɹ���');document.location='../index.jsp';</script>");
		return;
	} catch (Exception e) {
		out.print(show.errorBox("�޸�ʧ�ܣ����ݿ����", "������Ϣ"));
	}
%>