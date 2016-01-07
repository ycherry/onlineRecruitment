package com.job.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import com.job.domain.Comment;
import com.util.DataBaseConn;

public class CommentDao
{
	/**
	 * 		新闻的添加
	*/
	public void add(Comment comment)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "insert into t_comment(content,newsId) values(?,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, comment.getContent());
			ps.setInt(2, comment.getNewsID());
			
			ps.executeUpdate();
			
		}
		catch (Exception e)
		{
			throw new RuntimeException("添加新闻失败........", e);
		}
		finally
		{
			//关闭连接
			DataBaseConn.close(conn,ps,null);
		}
	}
}
