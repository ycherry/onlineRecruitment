<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.util.*,javax.servlet.http.HttpServletRequest"%>
<%//request.setCharacterEncoding("gb2312");%>
<jsp:useBean id="Company" class="com.job.domain.Company" scope="request"/>
<!--���� Company ��Ķ��� Company-->
<jsp:setProperty name="Company" property="*"/>
<!--���ö��� Company ������-->
<%
DealString str=new DealString();
ShowErrorBox show=new ShowErrorBox();
out.print("sssss"+Company.getCusername());

DataBaseConn dbc=new DataBaseConn();
try{
java.sql.Statement st=dbc.getStmt();
String sql="INSERT INTO t_company(cuserName,ctrueName,tel,manage,address,email,resume) VALUES('"+Company.getCusername()+"','"+str.toGb(Company.getCtruename())+"','"+Company.getTel()+"','"+str.toGb(Company.getManage())+"','"+str.toGb(Company.getAddress())+"','"+str.toGb(Company.getEmail())+"','"+str.toGb(Company.getResume())+"')";
st.addBatch(sql);
sql="insert into t_user(userName,userPass,userType)values('"+Company.getCusername()+"','"+Company.getPassword()+"','2')";
st.addBatch(sql);
st.executeBatch();
out.print("<script>alert('�޸ĳɹ���');document.location='../index.jsp';</script>");
return;
}
catch(Exception e)
{
out.print(show.errorBox("�޸�ʧ�ܣ����ݿ����","������Ϣ"));
}

%>