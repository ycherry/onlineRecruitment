<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
		DataBaseConn dbc=new DataBaseConn();
	    String userName=(String)session.getAttribute("usercode");
	    String password=request.getParameter("password");
	    System.out.println("userName:"+userName);
	    ResultSet rs=dbc.getRs("select * from t_user where userName='"+userName+"'and userPass='"+password+"'");
	   System.out.println("request password:"+request.getParameter("password"));
	    if(rs.next()){
	       java.sql.Statement stat=dbc.getStmt();
	       String sql="update t_user set userPass='"+request.getParameter("newPassword")+"' where userName='"+userName+"'";
	       stat.addBatch(sql);
	       stat.execute(sql);
	       out.print("<script>alert('修改成功!');parent.location.href='../logout.jsp'; </script>");
	    }else{
	    	out.print("<script>alert('当前密码错误，请重新输入!');</script>");
	    }
	%>