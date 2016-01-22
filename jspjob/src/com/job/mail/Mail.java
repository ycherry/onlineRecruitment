package com.job.mail;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;


public class Mail {

	private MimeMessage mimeMsg;//MIME邮件对象
	private Session session;//邮件会话对象
	private Properties props;//系统属性
	private boolean needAuth=false;//smtp是哦福需要验证
	//smtp认证用户名和密码
	private String username;
	private String password;
	private Multipart mp;//Multipart对象，邮件内容，标题，福建等内容均添加到其中后再生成MimeMessage对象
	
	public Mail(String smtp){
		setSmtpHost(smtp);
		createMimeMesage();
	}
	
	public void setSmtpHost(String hostName){
		System.out.println("设置系统属性：mail.smtp.host="+hostName);
		if(props== null){
			System.setProperty("java.net.preferIPv4Stack", "true");
			props=System.getProperties();//获得系统属性对象
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", hostName);//设置SMTP主机
			System.out.println("ipv4："+props.get("java.net.preferIPv4Stack"));
		}
	}
	
	public boolean createMimeMesage(){
		try{
			
			System.out.println("准备获取邮件会话对象!");
			session=Session.getDefaultInstance(props,null);
		}catch(Exception e){
			System.out.println("获取邮件会话对象时发生错误!"+e);
			return false;
		}
		System.out.println("准备创建MIME邮件对象！");
		try{
			mimeMsg=new MimeMessage(session);//创建MIME邮件对象
			mp=new MimeMultipart();
			return true;
		}catch(Exception e){
			System.out.println("创建MIME邮件对象失败！"+e);
			return false;
		}
	}
	
	public void setNeedAuth(boolean need){
		System.out.println("设置smtp身份认证：mail.smtp.auth="+need);
		if(props==null){
			props=System.getProperties();
		}
		if(need){
			props.put("mail.smtp.auth", need);
		}else{
			props.put("mail.smtp.auth",need);
		}
		System.out.println(props.get("mail.smtp.auth"));
	}
	
	public void setNamePass(String name,String pass){
		username=name;
		password=pass;
	}
	
	public boolean setSubject(String mailSubject){
		System.out.println("设置邮件主题");
		try{
			mimeMsg.setSubject(mailSubject);
			return true;
		}catch(Exception e){
			System.out.println("设置邮件主题发生错误！");
			return false;
		}
	}
	
	public boolean setBody(String mailBody){
		try{
			BodyPart bp=new MimeBodyPart();
			bp.setContent(mailBody,"text/html;charset=UTF-8");
			mp.addBodyPart(bp);
			return true;
		}catch(Exception e){
			System.out.println("设置邮件正文是发生错误！"+e);
			return false;
		}
	}
	
	public boolean addFileAffix(String filename){
		System.out.println("增加邮件附件："+filename);
		try{
			BodyPart bp=new MimeBodyPart();
			FileDataSource fields=new FileDataSource(filename);
			bp.setDataHandler(new DataHandler(fields));
			mp.addBodyPart(bp);
			return true;
		}catch(Exception e){
			System.out.println("增加邮件附件"+filename+"发生错误！"+e);
			return false;
		}
	}
	
	public boolean setFrom(String from){
		System.out.println("设置写信人");
		try{
			mimeMsg.setFrom(new InternetAddress(from));//设置发信人
			return true;
		}catch(Exception e){
			System.out.println("设置写信人出错！"+e);
			return false;
		}
	}
	
	public boolean setTo(String to){
		if(to==null){
			return false;
		}
		try{
			mimeMsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	public boolean setCopyTo(String copyto){
		if(copyto==null){
			return false;
		}
		try{
			mimeMsg.setRecipients(Message.RecipientType.CC, (Address[])InternetAddress.parse(copyto));
			return true;
		}catch(Exception e){
			System.out.println("设置抄送人出错");
			return false;
		}
	}
	
	public boolean sendOut(){
		try{
			mimeMsg.setContent(mp);
			mimeMsg.saveChanges();
			System.out.println("邮件正在发送。。。。");
			Session mailSession = session.getInstance(props,null);
			Transport transport=mailSession.getTransport("smtp");
			System.out.println("设置用户名密码");
			System.out.println(props.get("mail.smtp.host"));
			transport.connect((String)props.get("mail.smtp.host"),username,password);
			System.out.println("设置接收者");
			transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.TO));
			transport.sendMessage(mimeMsg,mimeMsg.getRecipients(Message.RecipientType.CC));
			System.out.println("邮件发送成功！");
			transport.close();
			return true;
		}catch(Exception e){
			System.out.println("邮件发送失败！"+e);
			return false;
		}
	}
	
	public static boolean send(String smtp,String from,String to, String subject,String content,String username,String password ){
		Mail theMail=new Mail(smtp);
		theMail.setNeedAuth(true);
		if(!theMail.setSubject(subject)) return false;
		if(!theMail.setBody(content)) return false;
		if(!theMail.setTo(to)) return false;
		if(!theMail.setFrom(from)) return false;
		theMail.setNamePass(username, password);
		if(!theMail.sendOut()) return false;
		return true;
	}
	
	public static boolean sendAndCc(String smtp,String from,String to,String copyto,String subject,String content,String username,String password){
		Mail theMail=new Mail(smtp);
		theMail.setNeedAuth(true);
		if(!theMail.setSubject(subject)) return false;
		if(!theMail.setBody(content)) return false;
		if(!theMail.setTo(to)) return false;
		if(!theMail.setCopyTo(copyto)) return false;
		if(!theMail.setFrom(from)) return false;
		theMail.setNamePass(username, password);
		if(!theMail.sendOut()) return false;
		return true;
	}
	
	public static boolean sendWithAttachment(String smtp,String from,String to,String subject,String content,String username,String password,String filename){
		Mail theMail=new Mail(smtp);
	    theMail.setNeedAuth(true);
	    if(!theMail.setSubject(subject)) return false;
	    if(!theMail.setBody(content)) return false;
	    if(!theMail.addFileAffix(filename)) return false;
	    if(!theMail.setFrom(from)) return false;
	    if(!theMail.setTo(to)) return false;
		theMail.setNamePass(username, password);
		
		if(!theMail.sendOut()) return false;
		return true;
		
	}
	
	public static boolean sendWithAttachmentAndCc(String smtp,String from,String to,String copyto,String subject,String content,String username,String password,String filename){
		Mail theMail= new Mail(smtp);
		theMail.setNeedAuth(true);
		if(!theMail.setSubject(subject)) return true;
		if(!theMail.setBody(content)) return true;
		if(!theMail.addFileAffix(filename)) return true;
		if(!theMail.setTo(to)) return false;
		if(!theMail.setCopyTo(copyto)) return false;
		if(!theMail.setFrom(from)) return false;
		theMail.setNamePass(username, password);
		if(!theMail.sendOut()) return false;
		 return true;
	}
	//http://chenguanwei2008.iteye.com/blog/368178
	public static void main(String[] args) {
//		String smtp = "smtp.sina.com";  
//	    String from = "发信人";  
//	    String to = "收信人";
//	    String subject = "邮件主题";  
//	    String content = "邮件内容";  
//	    String username="cyan_test@sina.com";  
//	    String password="cyan_test"; 
//	    
	    String smtp = "smtp.qq.com";  
	    String from = "发信人";  
	    String to = "收信人";
	    String subject = "邮件主题";  
	    String content = "邮件内容";  
	    String username="2691611331@qq.com";  
	    String password="yyy,889124";  
	    Mail.send(smtp, from, to,subject, content, username, password);

	}

}
