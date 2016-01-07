package com.job.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuanXianFilter implements Filter
{

	@Override
	public void destroy()
	{

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException
	{

		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		
		String isLogin  = (String) request.getSession().getAttribute("flag");
		
		if(isLogin != null && !"".equals(isLogin.trim()))
		{
			chain.doFilter(request, response);
		}
		else
		{
			response.sendRedirect("/jspjob/error.jsp");
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException
	{

	}

}
