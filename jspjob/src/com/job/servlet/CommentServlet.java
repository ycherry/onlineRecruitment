package com.job.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.job.dao.CommentDao;
import com.job.domain.Comment;

/**
 *		新闻的留言Servlet 
 */
public class CommentServlet extends BaseServlet
{
	private static final long serialVersionUID = -2197502473582713240L;

	private CommentDao dao = new CommentDao();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		this.doGet(request, response);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String content = request.getParameter("comment");
		String newsId = request.getParameter("newsId");

		Comment comment = new Comment();
		
		comment.setContent(content);
		comment.setNewsID(Integer.parseInt(newsId));
		
		
		dao.add(comment);
		
		System.out.println("留言成功");
		
		request.getRequestDispatcher("/admin/commentSuccess.jsp").forward(request, response);
		
	}

}
