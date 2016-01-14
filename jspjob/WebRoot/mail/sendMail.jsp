<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.util.*"%>
<%@ page import="com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page "
	class="com.jspsmart.upload.SmartUpload " />
<%
	class sendMail {
		private MimeMessage mimeMsg;
		private Session session;
		private Properties props;
		private boolean needAuth = false;
		private String username = "";
		private String password = "";
		/**Multipart对象、邮件内容、标题、附件等内容均添加到其中后再生成MimeMessage对象private Multipart mp;*/
		private Multipart mp;

		/**
		*
		*/
		public sendMail() {
			setSmtpHost("smtp.qq.com");
			createMimeMessage();
		}

		public sendMail(String stmp) {
			setSmtpHost(stmp);
			createMimeMessage();
		}

		/**
		* @param hostName String
		*/
		public void setSmtpHost(String hostName) {
			System.out.println("设置系统属性: mail.smtp.host=" + hostName);
			if (props == null)
				props = System.getProperties();
			props.put("mail.smtp.host", hostName);
		}

		/**
		*@return boolean
		*/
		public boolean createMimeMessage() {
			try {
				System.out.println("准备获取邮件会话对象!");
				session = Session.getDefaultInstance(props, null);
			} catch (Exception e) {
				System.err.println("获取邮件会话对象时发生错误!" + e);
				return false;
			}
			System.out.println("准备创建MIME邮件对象!");
			try {
				mimeMsg = new MimeMessage(session);
				mp = new MimeMultipart();
				return true;
			} catch (Exception e) {
				System.err.println("创建MIME邮件对象失败!" + e);
				return false;
			}
		}

		/**
		* @param need boolean 
		*/
		public void setNeedAuth(boolean need) {
			System.out.println("设置smtp身份认证:mail.smtp.auth=" + need);
			if (props == null)
				props = System.getProperties();
			if (need) {
				props.put("mail.smtp.auth", "true");
			} else {
				props.put("mail.stmp.auth", "false");

			}
		}

		/**
		* @param name String
		* @param pass String 
		*/
		public void setNamePass(String name, String pass) {
			username = name;
			password = pass;
		}

		/**
		* @param mailSubject String
		* @return boolean 
		*/
		public boolean setSubject(String mailSubject) {
			System.out.println("设置邮件主题!");
			try {
				mimeMsg.setSubject(mailSubject);
				return true;
			} catch (Exception e) {
				System.err.println("设置邮件主题发生错误!");
				return false;
			}
		}

		/**
		* 设置邮件正文内容
		* @param mailBody String
		*/
		public boolean setBody(String mailBody) {
			try {
				BodyPart bp = new MimeBodyPart();
				bp.setContent("<meta http-equiv=Content-Type content=text/html;charset=gb2312>" + mailBody,
						"text/html;charset=GB2312");
				mp.addBodyPart(bp);
				return true;
			} catch (Exception e) {
				System.err.println("设置邮件正文时发生错误!" + e);
				return false;
			}
		}

		/**
		* @param name String
		* @param pass String
		*/
		public boolean addFileAffix(String filename) {
			System.out.println("增加邮件附件:" + filename);
			try {
				BodyPart bp = new MimeBodyPart();
				FileDataSource fileds = new FileDataSource(filename);
				bp.setDataHandler(new DataHandler(fileds));
				bp.setFileName(fileds.getName());
				mp.addBodyPart(bp);
				return true;
			} catch (Exception e) {
				System.err.println("增加邮件附件:" + filename + "发生错误!" + e);
				return false;
			}
		}

		/**
		* @param name String
		* @param pass String
		*/
		public boolean setFrom(String from) {
			System.out.println("设置发件人!");
			try {
				mimeMsg.setFrom(new InternetAddress(from));
				return true;
			} catch (Exception e) {
				return false;
			}
		}

		/**
		* @param name String
		* @param pass String
		*/
		public boolean setTo(String to) {
			if (to == null)
				return false;
			try {
				mimeMsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
				return true;
			} catch (Exception e) {
				return false;
			}
		}

		/**
		* @param name String
		* @param pass String
		*/
		public boolean setCopyTo(String copyto) {
			if (copyto == null)
				return false;
			try {
				mimeMsg.setRecipients(Message.RecipientType.CC, (Address[]) InternetAddress.parse(copyto));
				return true;
			} catch (Exception e) {
				return false;
			}
		}

		/**
		* @param name String
		* @param pass String
		*/
		public boolean sendout() {
			try {
				mimeMsg.setContent(mp);
				mimeMsg.saveChanges();
				System.out.println("正在发送邮件.....");
				Session mailSession = Session.getInstance(props, null);
				Transport transport = mailSession.getTransport("smtp");
				transport.connect((String) props.get("mail.smtp.host"), username, password);
				transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.TO));
				System.out.println("发送邮件成功！");
				transport.close();
				return true;
			} catch (Exception e) {
				System.err.println("邮件发送失败！" + e);
				return false;
			}
		}
	}
	; //在文件中声明的类结尾以；标识类的结束
%>
<%
	DataBaseOperation data = new DataBaseOperation();
	ShowErrorBox show = new ShowErrorBox();
	DataBaseConn con = new DataBaseConn();
	boolean blnError = true;
	boolean isSent = false;
	String strFrom = request.getParameter("sfrom");
	String pass = request.getParameter("pass");
	InternetAddress[] address = null;
	String strMailserver = "mail.sohu.com";
	String[] arrstrTo = request.getParameterValues("from");
	String strSubject = request.getParameter("subject");
	String strMessage = request.getParameter("message");
	String attachFile = request.getParameter("file");
	String smtpserver = request.getParameter("smtpserver");
	if (arrstrTo.length > 0) {
		int intI = 0;
		for (int i = 0; intI < arrstrTo.length; intI++) {
			if (!arrstrTo[intI].equals("")) {
				try {
					String mailbody = "<meta http-equiv=Content-Type content=text/html;charset = gb2312>"
							+ "<div align=center> " + strMessage + "</div>";
					sendMail themail = new sendMail(smtpserver);
					themail.setNeedAuth(true);
					if (themail.setSubject(strSubject) == false)
						return;
					//以上设置邮件主题
					if (themail.setBody(mailbody) == false)
						return;
					//以上设置邮件内容
					if (themail.setTo(arrstrTo[intI]) == false)
						return;
					//以上指定收件人
					if (themail.setFrom(strFrom) == false)
						return;
					//以上指定收件人
					if (themail.addFileAffix(attachFile) == false)
						return;
					//以上完成附件添写
					String user = "";
					if (strFrom.indexOf("@") > 0) {
						user = strFrom.substring(0, strFrom.indexOf("@"));
					}
					themail.setNamePass(user, pass);
					//以上完成smtp服务器验证
					//下面完成邮件发送
					if (themail.sendout() == false) {
						blnError = true;
					} else {
						out.print("邮件已顺利传送到" + arrstrTo[intI] + "<br>");
						blnError = false;
						isSent = true;
					}
				} catch (Exception e) {
					if (blnError)
						out.print(show.errorBox(e.getMessage(), "发送失败"));
					blnError = false;
					e.printStackTrace();
				}
			}
		}
	} else {
		out.print(show.errorBox("请掭写完整信息！", "错误信息"));
	}
	if (isSent) {
		out.print(show.errorBox("邮件发送成功！", "发送信息"));
	} else if (blnError & !isSent) {
		out.print(show.errorBox("邮件发送失败!", "发送信息"));
	}
%>

