package com.job.mail;

import java.util.Properties;

import javax.mail.Multipart;
import javax.mail.Session;
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
		System.out.println("设置系统属性：mail.stmp.host="+hostName);
		if(props== null){
			props=System.getProperties();//获得系统属性对象
			props.put("mail.stmp.host", hostName);//设置SMTP主机
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
		System.out.println("设置smtp身份认证：mail.stmp.auth="+need);
		if(props==null){
			props=System.getProperties();
		}
		if(need){
			props.put("mail.stmp.auth", "true");
		}else{
			props.put("mail.stmp.auth","false");
		}
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
	//http://chenguanwei2008.iteye.com/blog/368178
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
