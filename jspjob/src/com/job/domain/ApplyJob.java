package com.job.domain;
public class ApplyJob {
	private int jobid;     //�������
	private String sname;    //���������� 
	private String jobName;    //ְλ����
	private String salary;    //н��
	private String other;    //����
	private String ptime;   //��������
	private String atime;   //��ֹ����
	private String specialty;  //�س�
	public ApplyJob(){
	}
	public int getJobid(){
		return jobid;
	}
	public void setJobid(int jobid){
		this.jobid = jobid;
	}
	public String getSname(){
		return sname;
	}
	public void setSobid(String sname){
		this.sname = sname;
	}
	public String getJobName(){
		return jobName;
	}
	public void setJobName(String jobName){
		this.jobName = jobName;
	}
	public String getSalary(){
		return salary;
	}
	public void setSalary(String salary){
		this.salary = salary;
	}
	public String getOther(){
		return other;
	}
	public void setOther(String other){
	    this.other = other;
	}
	public String getPtime(){
		return ptime;
	}
	public void setPtime(String ptime){
	    this.ptime = ptime;
	}
	public String getAtime(){
		return atime;
	}
	public void setAtime(String atime){
	    this.atime = atime;
	}
	public String getSpecialty(){
		return specialty;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	
}
