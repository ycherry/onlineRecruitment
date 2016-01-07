package com.job.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CountServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException
	{
		ServletContext context = request.getSession().getServletContext();
		
		Integer count = (Integer) context.getAttribute("count");
		
		if(count == null)
		{
			context.setAttribute("count", 1);
		}
		else
		{
			count = count + 1;
			
			context.setAttribute("count", count);
		}
		
	}
	
	
	
}
