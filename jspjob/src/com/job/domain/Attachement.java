package com.job.domain;

import java.util.Date;

/**
 * 		新闻的附件实体,因为有的新闻的话会有图片等信息,我们会把这个图片作为这个新闻的一个附件
 */
public class Attachement
{
	private int id;
	
	//哪篇文章的附件
	private int newsId;
	
	//文件的名称(路径)
	private String name;
	
	//文件的类型
	private String contentType;
	
	//文件上传的时间
	private Date uploadTime;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getNewsId()
	{
		return newsId;
	}

	public void setNewsId(int newsId)
	{
		this.newsId = newsId;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getContentType()
	{
		return contentType;
	}

	public void setContentType(String contentType)
	{
		this.contentType = contentType;
	}

	public Date getUploadTime()
	{
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime)
	{
		this.uploadTime = uploadTime;
	}
}
