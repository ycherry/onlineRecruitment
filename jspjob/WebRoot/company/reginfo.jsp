<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%//request.setCharacterEndcoding("GB2312");%>
<jsp:useBean id="company" class="com.job.domain.Company" scope="request"/>
<!--构造jobSeeker类的对象jobSeeker-->
<jsp:setProperty name="company" property="*"/>
<!-- 设置对象jobSeeker的属性 -->
<%
DealString str=new DealString();
ShowErrorBox show=new ShowErrorBox();
String cuserName=(String)session.getAttribute("usercode");
company.setCtruename(company.getCtruename());
company.setEmail(company.getEmail());
company.setTel(company.getTel());
company.setManage(company.getManage());
company.setAddress(company.getAddress());
company.setResume(company.getResume());
out.print("sssss"+cuserName);
if(company.getEmail().equals("")||company.getTel().equals("")){
out.print(show.errorBox("请填写完整信息!","错误信息"));
return;
}else{
DataBaseConn dbc=new DataBaseConn();
try{
java.sql.Statement st=dbc.getStmt();
String sql="UPDATE t_company SET ctrueName="+"'"+str.toGb(company.getCtruename())+"'"+",email="+"'"+str.toGb(company.getEmail())+"'"+",tel="+"'"+str.toGb(company.getTel())+"'"+",manage="+"'"+str.toGb(company.getManage())+"'"+",address="+"'"+str.toGb(company.getAddress())+"'"+",resume="+"'"+str.toGb(company.getResume())+"'"
+" WHERE cuserName="+"'"+cuserName+"'";
st.addBatch(sql);
//sql="update t_user set userName="+"'"+company.getCusername()+"'"+"where userName="+"'"+cuserName+"'";
//st.addBatch(sql);
st.executeBatch();
out.print("<script>alert('修改成功！');document.location='index1.html';</script>");
return;
}
catch(Exception e)
{
  out.print(show.errorBox("修改失败，数据库错误！","错误信息"));
}
}
%>
