package com.job.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.job.dao.NewsDao;
import com.job.domain.News;

public class NewsServlet extends BaseServlet
{
	private static final long serialVersionUID = 4634030045608790494L;

	private NewsDao newsDAO = new NewsDao();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		this.process(request, response);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		this.process(request, response);
	}
	
	
	/**
	 * 		�����ҵ����
	*/
	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String method = request.getParameter("method");
		
		if("list".equals(method))
		{
			/**
			 * ���������ŵ��б���ʾ
			*/
			List<News> news = newsDAO.getNewsList();

			request.setAttribute("news", news);
			
			request.getRequestDispatcher("/admin/news_list.jsp").forward(request, response);
		}
		else if("addUI".equals(method))
		{
			/**
			 *	�����ŵ����ҳ�� 
			*/
			this.addUI(request, response);
			
		}
		else if("add".equals(method))
		{
			/**
			 * 	������ŵľ���ҵ����
			*/
			this.add(request, response);
			
		}
		else if("delete".equals(method))
		{
			/**
			 * 	���ŵ�ɾ������
			*/
			
			this.delete(request,response);
			
		}
		else if("updateUI".equals(method))
		{
			/**
			 * 	��Ҫ���µ����ŵ�ҳ��
			*/
			this.updateUI(request, response);
			
		}
		else if("update".equals(method))
		{
			/**
			 * 	�������ŵľ����ҵ����
			*/
			this.update(request, response);
			
		}
		else if("deploy".equals(method))
		{
			/**
			 *		�������� 
			*/
			
			this.deploy(request, response);
			
		}
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String id = request.getParameter("id");
		
		newsDAO.deleteNews(Integer.parseInt(id));
		
		request.getRequestDispatcher("/admin/delete_news_success.jsp").forward(request, response);
		
	}

	/**
	 * 		���������ҳ��
	*/
	public void addUI(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		request.getRequestDispatcher("/admin/add_news.jsp").forward(request, response);
	}
	
	/**
	 * 		�������
	*/
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		if(isMultipart)
		{
			System.out.println("helo.world");
		}
		
		System.out.println("dfjakldkj");
		
		//���մ�ҳ���û����������
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String isDeploy = request.getParameter("isDeploy");
		
		System.out.println("dfd");
		
		System.out.println(title);
		
		News news = new News();
		news.setTitle(title);
		news.setContent(content);
		news.setDeployee(Boolean.parseBoolean(isDeploy));
		news.setCreateTime(new Date());
		news.setDeployTime(new Date());
		//�ж�һ���û��Ƿ�Ҫ������ƪ����,�����Ҫ��������ô�����÷���ʱ��Ϊ��ǰʱ��
		if(isDeploy != null && !"".equals(isDeploy))
		{
			news.setDeployTime(new Date());
		}
		
		newsDAO.add(news);
		
		request.getRequestDispatcher("/admin/add_news_success.jsp").forward(request, response);
	}
	
	/**
	 * 		�����Ÿ���ҳ��
	*/
	public void updateUI(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
	}
	
	/**
	 * 		��������
	*/
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
	}
	
	/**
	 * 		��������
	*/
	public void deploy(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		//��ҳ���ϵõ�Ҫ���������ŵ�id
		String id = request.getParameter("id");
		
		//ͨ��id�����ݿ��еõ�ָ��������
		News news = newsDAO.findNewsById(Integer.parseInt(id));
		
		//�����Ƿ񷢲�,������Ҫ����,Ϊtrue�ͱ�ʾҪ����
		news.setDeployee(true);
		
		//�޸���֮��,�����ݸ��µ����ݿ�
		newsDAO.updateNews(news);
		
		request.getRequestDispatcher("/admin/deployee_news_success.jsp").forward(request, response);
		
	}

}
