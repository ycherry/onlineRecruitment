package com.job.domain;

public class Company {
	private String cusername; // ��˾�û��û���
	private String ctruename; // ��˾��ʵ����
	private String password; // ����
	private String email; // ��˾��ַ
	private String tel; // ��˾�绰
	private String manage; // ��˾��Ӫ
	private String address; // ��˾��ַ
	private String resume; // ��˾����

	public Company() {
	}

	public String getCusername() {
		return cusername;
	}

	public void setCusername(String cname) {
		this.cusername = cname;
	}

	public String getCtruename() {
		return ctruename;
	}

	public void setCtruename(String cname) {
		this.ctruename = cname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String pword) {
		this.password = pword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getManage() {
		return manage;
	}

	public void setManage(String mage) {
		this.manage = mage;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String add) {
		this.address = add;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String rsume) {
		this.resume = rsume;
	}
}