package com.job.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.FilenameUtils;

import com.job.domain.Attachement;

@SuppressWarnings("unchecked")
public class MultipartRequestWrapper extends HttpServletRequestWrapper
{
	private Map allParams;
	
	public MultipartRequestWrapper(HttpServletRequest request)
	{
		super(request);
		
		//�����ж��Ƿ�multipart��������
		//�����multipart�������ͣ��������request��ȡ����������
		//�����������ͨ�ı���������ֵȡ�����ŵ�allParams��
		//����������ļ�����
		//1�����ļ��ȴ洢�����̵�ĳ��Ŀ¼�У�
		//2�����ļ����й���Ϣ�����ƣ����ͣ��ϴ�ʱ�䣩��װ��Attachment[]����
		//3���Ѱ�װ�õ�Attachment[]���ͣ��ŵ�allParams��
		
		
		try
		{
			//���ȣ��ж��Ƿ�multipart��������
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
			if(!isMultipart)
			{
				allParams = request.getParameterMap();
			}
			else
			{
				allParams = new HashMap();
				
				ServletFileUpload fileUpload = new ServletFileUpload();
				
				FileItemIterator fileItemIterator = fileUpload.getItemIterator(request);
				
				while(fileItemIterator.hasNext())
				{
					FileItemStream itemStream = fileItemIterator.next();//���ϵ�ÿһ���ؼ�����һ��Item
					
					//�õ�����Ŀؼ�������
					String inputName = itemStream.getFieldName();
					//�õ�����Ŀؼ���ֵ������һ����������,����������Ǽ����Ǹ�����õ���ֵ����һ��������
					InputStream inputStream = itemStream.openStream();
					
					if(itemStream.isFormField())
					{
						//�ж����item(һ��item�ʹ�����һ���ؼ���)
						String value = Streams.asString(inputStream, request.getCharacterEncoding());
						
						addFieldsAndValuesToMap(inputName, value);
					}
					else
					{
						//��ʾ�û���ȷ�ϴ����ļ�
						if(inputStream.available() > 0)
						{
							//�õ��ļ�������
							String fileName = itemStream.getName();
							
							if(fileName != null && !"".equals(fileName.trim()))
							{
								//��Ϊ��IE���棬�ϴ����ļ��������д��ļ��ڿͻ��˻�����·��
					    		//���ԣ�Ҫ�����·��ȥ����ֻȡ�ļ���
								fileName = FilenameUtils.getName(fileName);
							}
							
							//�����ļ������Ŀ¼
							String pathdir = "/upload";
							
							//�õ�ͼƬ����Ŀ¼����ʵ·��
							String saveDir = request.getSession().getServletContext().getRealPath(pathdir);
							
							File file = new File(saveDir);
							
							if(!file.exists())
							{
								file.mkdirs();
							}
							
							//�����ļ�
							File saveFile = new File(file,fileName);
							
							Streams.copy(inputStream, new FileOutputStream(saveFile), true);
							
							/**
							 * 		��ȥ�����ļ�����Ϣ
							*/
							Attachement attachment = new Attachement();
							
							attachment.setContentType(itemStream.getContentType());
							attachment.setName(saveDir + "\\" + fileName);
							attachment.setUploadTime(new Date());
							
							addFieldsAndValuesToMap(inputName, attachment);
						}
					}
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 		��������ϴ����ļ���Ϣ
	*/
	private void addFieldsAndValuesToMap(String inputName, Attachement attachment)
	{
		Attachement[] attachments = (Attachement[]) allParams.get(inputName);
		
		if(attachments == null)
		{
			allParams.put(inputName, new Attachement[]{attachment});
		}
		else
		{
			//�������鳤��
			attachments = Arrays.copyOf(attachments, attachments.length + 1);
			
			attachments[attachments.length - 1] = attachment;
			
			allParams.put(inputName, attachments);
		}
	}
	
	
	/**
	 * 		���������ͨ�ı����ֵ
	 */
	private void addFieldsAndValuesToMap(String inputName, String value)
	{
		String[] fieldValues = (String[]) allParams.get(inputName);
		
		if(fieldValues == null)
		{
			allParams.put(inputName, new String[]{value});
		}
		else
		{
			//����Ѿ���ֵ��,��ô����������ĳ���,ʹԭ�������鳤��+1
			//����ԭ�����飺["1","2"]
			//����֮��["1","2",null]
			fieldValues = Arrays.copyOf(fieldValues, fieldValues.length + 1);
			
			fieldValues[fieldValues.length - 1] = value;

			allParams.put(inputName, fieldValues);
		}
	}
	
	@Override
	public String getParameter(String name)
	{
		Object[] values = (Object[]) allParams.get(name);
		
		if(values != null)
		{
			return (String)values[0];
		}
		
		return null;
	}

	
	@Override
	public Map getParameterMap()
	{
		return allParams;
	}
}
