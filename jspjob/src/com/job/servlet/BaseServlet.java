package com.job.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class BaseServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		
		if(isMultipart)
		{
			req = new MultipartRequestWrapper(req);
		}
		
		super.service(req, resp);
		
	}
}
