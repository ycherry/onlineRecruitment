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
	 * 		具体的业务处理
	*/
	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String method = request.getParameter("method");
		
		if("list".equals(method))
		{
			/**
			 * 功能是新闻的列表显示
			*/
			List<News> news = newsDAO.getNewsList();

			request.setAttribute("news", news);
			
			request.getRequestDispatcher("/admin/news_list.jsp").forward(request, response);
		}
		else if("addUI".equals(method))
		{
			/**
			 *	打开新闻的添加页面 
			*/
			this.addUI(request, response);
			
		}
		else if("add".equals(method))
		{
			/**
			 * 	添加新闻的具体业务处理
			*/
			this.add(request, response);
			
		}
		else if("delete".equals(method))
		{
			/**
			 * 	新闻的删除功能
			*/
			
			this.delete(request,response);
			
		}
		else if("updateUI".equals(method))
		{
			/**
			 * 	打开要更新的新闻的页面
			*/
			this.updateUI(request, response);
			
		}
		else if("update".equals(method))
		{
			/**
			 * 	更新新闻的具体的业务处理
			*/
			this.update(request, response);
			
		}
		else if("deploy".equals(method))
		{
			/**
			 *		发布新闻 
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
	 * 		打开新闻添加页面
	*/
	public void addUI(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		request.getRequestDispatcher("/admin/add_news.jsp").forward(request, response);
	}
	
	/**
	 * 		添加新闻
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
		
		//接收从页面用户输入的数据
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
		//判断一下用户是否要发布该篇文章,如果是要发布，那么就设置发布时间为当前时间
		if(isDeploy != null && !"".equals(isDeploy))
		{
			news.setDeployTime(new Date());
		}
		
		newsDAO.add(news);
		
		request.getRequestDispatcher("/admin/add_news_success.jsp").forward(request, response);
	}
	
	/**
	 * 		打开新闻更新页面
	*/
	public void updateUI(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
	}
	
	/**
	 * 		更新新闻
	*/
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
	}
	
	/**
	 * 		发布新闻
	*/
	public void deploy(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		//从页面上得到要发布的新闻的id
		String id = request.getParameter("id");
		
		//通过id从数据库中得到指定的新闻
		News news = newsDAO.findNewsById(Integer.parseInt(id));
		
		//设置是否发布,现在是要发布,为true就表示要发布
		news.setDeployee(true);
		
		//修改完之后,把数据更新到数据库
		newsDAO.updateNews(news);
		
		request.getRequestDispatcher("/admin/deployee_news_success.jsp").forward(request, response);
		
	}

}
