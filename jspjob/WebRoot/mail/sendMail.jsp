<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.util.*"%>
<%@ page import="com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload"scope="page"class="com.jspsmart.upload.SmartUpload"/>
<%
class sendMail{
private MimeMessage mimeMsg;
private Session session;
private Properties props;
private boolean needAuth=false;
private String username="";
private String password="";
/**Multipart�����ʼ����ݡ����⡢���������ݾ���ӵ����к�������MimeMessage����private Multipart mp;*/
private Multipart mp;
/**
*
*/
public sendMail()
{
setSmtpHost("smtp.sohu.com");
createMimeMessage();
}
public sendMail(String stmp){
setSmtpHost(stmp);
createMimeMessage();
}
/**
* @param hostName String
*/
public void setSmtpHost(String hostName)
{
System.out.println("����ϵͳ����: mail.smtp.host="+hostName);
if(props==null)props=System.getProperties();
props.put("mail.smtp.host",hostName);
}
/**
*@return boolean
*/
public boolean createMimeMessage()
{
  try{
       System.out.println("׼����ȡ�ʼ��Ự����!");
       session=Session.getDefaultInstance(props,null); 
      }
      catch(Exception e){
      System.err.println("��ȡ�ʼ��Ự����ʱ��������!"+e);
      return false;
      }
      System.out.println("׼������MIME�ʼ�����!");
      try{
      mimeMsg =new MimeMessage(session);
      mp =new MimeMultipart();
      return true;
      }
      catch(Exception e){
      System.err.println("����MIME�ʼ�����ʧ��!"+e);
      return false;
      }
}
/**
* @param need boolean 
*/
public void setNeedAuth(boolean need){
System.out.println("����smtp�����֤:mail.smtp.auth="+need);
if(props== null)props= System.getProperties();
if(need){
props.put("mail.smtp.auth","true");
}else{
props.put("mail.stmp.auth","false");

}
}
/**
* @param name String
* @param pass String 
*/
public void setNamePass(String name,String pass)
{
 username =name;
 password =pass;
}
/**
* @param mailSubject String
* @return boolean 
*/
public boolean setSubject(String mailSubject){
System.out.println("�����ʼ�����!");
try 
{
mimeMsg.setSubject(mailSubject);
return true;
}
catch(Exception e)
{
System.err.println("�����ʼ����ⷢ������!");
return false;
}
}
/**
* �����ʼ���������
* @param mailBody String
*/
public boolean setBody(String mailBody){
try{
BodyPart bp=new MimeBodyPart();
bp.setContent("<meta http-equiv=Content-Type content=text/html;charset=gb2312>"+mailBody,"text/html;charset=GB2312");
mp.addBodyPart(bp);
return true;
}
catch(Exception e){
System.err.println("�����ʼ�����ʱ��������!"+e);
return false; 
}
}
/**
* @param name String
* @param pass String
*/
public boolean addFileAffix(String filename){
System.out.println("�����ʼ�����:"+filename);
try{
BodyPart bp =new MimeBodyPart();
FileDataSource fileds =new FileDataSource(filename);
bp.setDataHandler(new DataHandler(fileds));
bp.setFileName(fileds.getName());
mp.addBodyPart(bp);
return true;
}
catch(Exception e){
System.err.println("�����ʼ�����:"+filename+"��������!"+e);
return false;
}
}
/**
* @param name String
* @param pass String
*/
public boolean setFrom(String from){
System.out.println("���÷�����!");
 try{
  mimeMsg.setFrom(new InternetAddress(from));
  return true;
}
 catch(Exception e)
{return false;}
}
/**
* @param name String
* @param pass String
*/
public boolean setTo(String to){
  if(to == null) return false;
    try{
         mimeMsg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
return true;
}
catch(Exception e)
{return false;}
}
/**
* @param name String
* @param pass String
*/
public boolean setCopyTo(String copyto){
  if(copyto == null) return false;
    try{
         mimeMsg.setRecipients(Message.RecipientType.CC,(Address[])InternetAddress.parse(copyto));
return true;
}
catch(Exception e)
{return false;}
}
/**
* @param name String
* @param pass String
*/
public boolean sendout()
{
    try{
       mimeMsg.setContent(mp);
       mimeMsg.saveChanges();
System.out.println("���ڷ����ʼ�.....");
Session mailSession = Session.getInstance(props,null);
Transport transport = mailSession.getTransport("smtp");
transport.connect((String)props.get("mail.smtp.host"),username,password);
transport.sendMessage(mimeMsg,mimeMsg.getRecipients(Message.RecipientType.TO));
System.out.println("�����ʼ��ɹ���");
transport.close();
return true;
}
catch(Exception e)
{
  System.err.println("�ʼ�����ʧ�ܣ�" +e);
  return false;
}
}
};  //���ļ������������β�ԣ���ʶ��Ľ��� 
%>
<%
DataBaseOperation data=new DataBaseOperation();
ShowErrorBox show=new ShowErrorBox();
DataBaseConn con=new DataBaseConn();
boolean blnError=true;
boolean isSent=false;
String strFrom=request.getParameter("sfrom");
String pass=request.getParameter("pass");
InternetAddress[] address = null;
String strMailserver = "mail.sohu.com";
String [] arrstrTo = request.getParameterValues("from");
String strSubject = request.getParameter("subject");
String strMessage = request.getParameter("message");
String attachFile = request.getParameter("file");
String smtpserver = request.getParameter("smtpserver");
if(arrstrTo.length>0){
int intI=0;
for(int i=0;intI<arrstrTo.length;intI++){
if(!arrstrTo[intI].equals("")){
  try{
    String mailbody = "<meta http-equiv=Content-Type content=text/html;charset = gb2312>"+"<div align=center> "+strMessage+"</div>";
sendMail themail = new sendMail(smtpserver);
themail.setNeedAuth(true);
if(themail.setSubject(strSubject) == false) return;
//���������ʼ�����
if(themail.setBody(mailbody) == false) return;
//���������ʼ�����
if(themail.setTo(arrstrTo[intI]) == false) return;
//����ָ���ռ���
if(themail.setFrom(strFrom) == false) return;
//����ָ���ռ���
if(themail.addFileAffix(attachFile) == false) return;
//������ɸ�����д
String user="";
if(strFrom.indexOf("@")>0){
  user=strFrom.substring(0,strFrom.indexOf("@"));
}
themail.setNamePass(user,pass);
//�������smtp��������֤
//��������ʼ�����
if(themail.sendout()== false) {blnError=true;}
else {out.print("�ʼ���˳�����͵�"+arrstrTo[intI]+ "<br>");blnError=false;isSent=true;}
}catch (Exception e) {
  if(blnError) out.print(show.errorBox(e.getMessage(),"����ʧ��"));
blnError=false;
e.printStackTrace();
}
}
}
}else{
out.print(show.errorBox("����д������Ϣ��","������Ϣ"));}
if(isSent){
out.print(show.errorBox("�ʼ����ͳɹ���","������Ϣ"));
}else if(blnError&! isSent){
out.print(show.errorBox("�ʼ�����ʧ��!","������Ϣ"));
}
%>
 
