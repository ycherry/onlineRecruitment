package com.job.domain;

import java.util.Date;

/**
 * 		����ʵ��
 */
public class News
{
	//����
	private int id;
	
	//���ŵı���
	private String title;
	
	//���ŵ�����
	private String content;
	
	//���ŵĴ���ʱ��
	private Date createTime;
	
	//��ʾĬ�ϲ�����
	private boolean isDeployee = false;
	
	//���ŵķ���ʱ��
	private Date deployTime;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public Date getCreateTime()
	{
		return createTime;
	}

	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	public boolean isDeployee()
	{
		return isDeployee;
	}

	public void setDeployee(boolean isDeployee)
	{
		this.isDeployee = isDeployee;
	}

	public Date getDeployTime()
	{
		return deployTime;
	}

	public void setDeployTime(Date deployTime)
	{
		this.deployTime = deployTime;
	}
}
