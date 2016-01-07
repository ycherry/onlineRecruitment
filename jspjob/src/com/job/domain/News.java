package com.job.domain;

import java.util.Date;

/**
 * 		新闻实体
 */
public class News
{
	//主键
	private int id;
	
	//新闻的标题
	private String title;
	
	//新闻的内容
	private String content;
	
	//新闻的创建时间
	private Date createTime;
	
	//表示默认不发布
	private boolean isDeployee = false;
	
	//新闻的发布时间
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
