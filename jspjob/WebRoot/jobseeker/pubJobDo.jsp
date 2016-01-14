<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="applyJob" scope="request"
	class="com.job.domain.ApplyJob" />
<!--构造applyJob对象-->
<jsp:setProperty name="applyJob" property="*" />
<!--设置对象applyJob的属性-->
<%
	System.out.println(applyJob.getJobName());
	DataBaseOperation data = new DataBaseOperation();
	DealTime time = new DealTime();
	ShowErrorBox show = new ShowErrorBox();
	DealString str = new DealString();
	int intT = 0;
	String strName = (String) session.getAttribute("usercode");
/*	intT = data.insert("insert INTO t_applyJob(auserName,specialty,jobName,salary,ptime,atime,other)VALUES('"
			+ strName + "','" + str.toGb(applyJob.getSpecialty()) + "','" + str.toGb(applyJob.getJobName())
			+ "','" + str.toGb(applyJob.getSalary()) + "','" + time.getYMD() + "','" + applyJob.getAtime()
			+ "','" + str.toGb(applyJob.getOther()) + "')");
*/
	intT = data.insert("insert INTO t_applyJob(auserName,specialty,jobName,salary,ptime,atime,other)VALUES('"
			+ strName + "','" + applyJob.getSpecialty() + "','" + applyJob.getJobName()
			+ "','" + applyJob.getSalary() + "','" + time.getYMD() + "','" + applyJob.getAtime()
			+ "','" + applyJob.getOther() + "')");
	if (intT <= 0) {
		out.print(show.errorBox("发布失败,你可能已经下线请新登陆!", "错误信息"));
		return;
	} else {
		out.print("<script>alert('发布成功~!!');document.location='index1.html'</script>");
	}
%>