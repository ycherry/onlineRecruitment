<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%//request.setCharacterEncoding("GBK");%>
<jsp:useBean id="companyPublishJob" scope="request" class="com.job.domain.CompanyPublishJob"/>
<!--构造companyPublishJob对象-->
<jsp:setProperty name="companyPublishJob" property="*"/>
<!--设置对象companyPublishJob的属性-->
<% 
DataBaseOperation date=new DataBaseOperation();
DealTime time=new DealTime();
ShowErrorBox show=new ShowErrorBox();
DealString str=new DealString();
int intT=0;
String strName=(String) session.getAttribute("usercode");
intT=date.insert("INSERT INTO t_pubjob(cusername,specialty, "+" jobName,salary,ptime,atime,other) VALUES('"+strName+"','"+str.toGb(companyPublishJob.getSpecialty())+"','"+str.toGb(companyPublishJob.getJobName())+"','"+str.toGb(companyPublishJob.getSalary())+"','"+time.getYMD()+"','"+str.toGb(companyPublishJob.getEndTime())+"','"+str.toGb(companyPublishJob.getOthers())+"')");
if(intT<=0){
out.print(show.errorBox("发布失败,你可能已经下线请新登陆!","错误信息"));
return;
}else{
out.print("<script>alert('发布成功!');document.location='index1.html'</script>");
}
%>
