<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%//request.setCharacterEncoding("GBK");%>
<jsp:useBean id="companyPublishJob" scope="request" class="com.job.domain.CompanyPublishJob"/>
<!--����companyPublishJob����-->
<jsp:setProperty name="companyPublishJob" property="*"/>
<!--���ö���companyPublishJob������-->
<% 
DataBaseOperation date=new DataBaseOperation();
DealTime time=new DealTime();
ShowErrorBox show=new ShowErrorBox();
DealString str=new DealString();
int intT=0;
String strName=(String) session.getAttribute("usercode");
intT=date.insert("INSERT INTO t_pubjob(cusername,specialty, "+" jobName,salary,ptime,atime,other) VALUES('"+strName+"','"+str.toGb(companyPublishJob.getSpecialty())+"','"+str.toGb(companyPublishJob.getJobName())+"','"+str.toGb(companyPublishJob.getSalary())+"','"+time.getYMD()+"','"+str.toGb(companyPublishJob.getEndTime())+"','"+str.toGb(companyPublishJob.getOthers())+"')");
if(intT<=0){
out.print(show.errorBox("����ʧ��,������Ѿ��������µ�½!","������Ϣ"));
return;
}else{
out.print("<script>alert('�����ɹ�!');document.location='index1.html'</script>");
}
%>
