package com.job.domain;

import java.util.Date;

/**
 * 		���ŵĸ���ʵ��,��Ϊ�е����ŵĻ�����ͼƬ����Ϣ,���ǻ�����ͼƬ��Ϊ������ŵ�һ������
 */
public class Attachement
{
	private int id;
	
	//��ƪ���µĸ���
	private int newsId;
	
	//�ļ�������(·��)
	private String name;
	
	//�ļ�������
	private String contentType;
	
	//�ļ��ϴ���ʱ��
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
