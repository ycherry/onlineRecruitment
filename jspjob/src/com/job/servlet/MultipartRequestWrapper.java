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
		
		//首先判断是否multipart编码类型
		//如果是multipart编码类型，就逐个从request中取出各个表单域
		//如果表单域是普通的表单域，则将它的值取出，放到allParams中
		//如果表单域是文件，则
		//1、把文件先存储到磁盘的某个目录中！
		//2、把文件的有关信息（名称，类型，上传时间）包装成Attachment[]类型
		//3、把包装好的Attachment[]类型，放到allParams中
		
		
		try
		{
			//首先，判断是否multipart编码类型
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
					FileItemStream itemStream = fileItemIterator.next();//表单上的每一个控件都是一个Item
					
					//得到表单域的控件的名称
					String inputName = itemStream.getFieldName();
					//得到表单域的控件的值（这是一个输入流）,不管这个域是简单域还是复杂域得到的值都是一个输入流
					InputStream inputStream = itemStream.openStream();
					
					if(itemStream.isFormField())
					{
						//判断这个item(一个item就代表了一个控件域)
						String value = Streams.asString(inputStream, request.getCharacterEncoding());
						
						addFieldsAndValuesToMap(inputName, value);
					}
					else
					{
						//表示用户的确上传了文件
						if(inputStream.available() > 0)
						{
							//得到文件的名称
							String fileName = itemStream.getName();
							
							if(fileName != null && !"".equals(fileName.trim()))
							{
								//因为在IE下面，上传的文件还包含有此文件在客户端机器的路径
					    		//所以，要把这个路径去掉，只取文件名
								fileName = FilenameUtils.getName(fileName);
							}
							
							//构建文件保存的目录
							String pathdir = "/upload";
							
							//得到图片保存目录的真实路径
							String saveDir = request.getSession().getServletContext().getRealPath(pathdir);
							
							File file = new File(saveDir);
							
							if(!file.exists())
							{
								file.mkdirs();
							}
							
							//保存文件
							File saveFile = new File(file,fileName);
							
							Streams.copy(inputStream, new FileOutputStream(saveFile), true);
							
							/**
							 * 		再去保存文件的信息
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
	 * 		保存的是上传的文件信息
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
			//扩充数组长度
			attachments = Arrays.copyOf(attachments, attachments.length + 1);
			
			attachments[attachments.length - 1] = attachment;
			
			allParams.put(inputName, attachments);
		}
	}
	
	
	/**
	 * 		保存的是普通的表单域的值
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
			//如果已经有值了,那么就扩充数组的长度,使原来的数组长度+1
			//比如原来数组：["1","2"]
			//扩充之后：["1","2",null]
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
