<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%
	//request.setCharacterEncoding("GBK");
%>
<jsp:useBean id="applyJob" scope="request" class="com.job.domain.ApplyJob" />
<!--����applyJob����-->
<jsp:setProperty name="applyJob" property="*" />
<!--���ö���applyJob������-->
<%
	DataBaseOperation data = new DataBaseOperation();
	DealTime time = new DealTime();
	ShowErrorBox show = new ShowErrorBox();
	DealString str = new DealString();
	int intT = 0;
	String strName = (String) session.getAttribute("usercode");
	intT = data
			.insert("insert INTO t_applyJob(auserName,specialty,jobName,salary,ptime,atime,other)VALUES('"
					+ strName
					+ "','"
					+ str.toGb(applyJob.getSpecialty())
					+ "','"
					+ str.toGb(applyJob.getJobName())
					+ "','"
					+ str.toGb(applyJob.getSalary())
					+ "','"
					+ time.getYMD()
					+ "','"
					+ applyJob.getAtime()
					+ "','" + str.toGb(applyJob.getOther()) + "')");
	if (intT <= 0) {
		out.print(show.errorBox("����ʧ��,������Ѿ��������µ�½!", "������Ϣ"));
		return;
	} else {
		out
				.print("<script>alert('�����ɹ�~!!');document.location='index1.html'</script>");
	}
%>