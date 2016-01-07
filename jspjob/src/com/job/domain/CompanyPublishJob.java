package com.job.domain;
public class CompanyPublishJob {
	private int jobid;
	private String cuserName;
	private String specialty;
	private String jobName;
	private String salary;
	private String pubTime;
	private String endTime;
	private String others;
	public CompanyPublishJob(){
	}
	public int getJobid(){
		return jobid;
	}
	public void setJobid(int jobid){
		this.jobid = jobid;
	}
	public String getCuserName(){
		return cuserName;
	}
	public void setCuserName(String cuserName){
		this.cuserName = cuserName;
	}
	public String getSpecialty(){
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public String getJobName(){
		return jobName;
	}
	public void setJobName(String jobName){
		this.jobName= jobName;
	}
	public String getSalary(){
		return salary;
	}
	public void setSalary(String salary){
		this.salary= salary;
	}
	public String getPubTime(){
		return pubTime;
	}
	public void setPubTime(String pubTime){
		this.pubTime= pubTime;
	}
	public String getEndTime(){
		return endTime;
	}
	public void setEndTime(String endTime){
		this.endTime= endTime;
	}
	public String getOthers(){
		return others;
	}
	public void setOthers(String others){
		this.others= others;
	}
}
