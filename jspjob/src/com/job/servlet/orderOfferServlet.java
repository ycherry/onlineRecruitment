package com.job.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.job.dao.NewsDao;
import com.job.domain.News;

/**
 *		ÃÓ–¥ºÚ¿˙Serlvet 
 */
public class orderOfferServlet extends BaseServlet
{
	private static final long serialVersionUID = 1L;

	private NewsDao dao = new NewsDao();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
		String id = request.getParameter("id");
		
		News news = dao.findNewsById(Integer.parseInt(id));
		
		request.setAttribute("news", news);
		
		request.getRequestDispatcher("/admin/newsListById.jsp").forward(request, response);
		
	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		this.doPost(request, response);
	}
}
