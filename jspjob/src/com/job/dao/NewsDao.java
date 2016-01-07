package com.job.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.job.domain.News;
import com.util.DataBaseConn;

public class NewsDao
{
	/**
	 * 		新闻的添加
	*/
	public void add(News news)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "insert into t_news(title,content,createTime,isDeploy,deployTime) values(?,?,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, news.getTitle());
			ps.setString(2, news.getContent());
			ps.setTimestamp(3, new Timestamp(news.getCreateTime().getTime()));
			ps.setTimestamp(5, new Timestamp(news.getDeployTime().getTime()));
			ps.setBoolean(4, news.isDeployee());
			
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
	
	/**
	 *		新闻的列表显示 
	*/
	public List<News> getNewsList()
	{
		List<News> newses = new ArrayList<News>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "select * from t_news";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				News news = new News();
				
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title")); 
				news.setContent(rs.getString("content"));
				news.setCreateTime(rs.getDate("createTime"));
				news.setDeployTime(rs.getDate("deployTime"));
				news.setDeployee(rs.getBoolean("isDeploy"));
			
				newses.add(news);
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("查询新闻列表", e);
		}
		
		return newses;
	}
	
	
	
	/**
	 *		通过id查找一个指定的新闻 
	*/
	public News findNewsById(int id)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		News news = null;
		try
		{
			
			String sql = "select id,title,content,isDeploy from t_news where id = ?";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setDeployee(rs.getBoolean("isDeploy"));
				news.setContent(rs.getString("content"));
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过id查找新闻出错......", e);
		}
		
		return news;
	}
	
	/**
	 *		更新指定的一个新闻 
	*/
	public void updateNews(News news)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			
			String sql = "update t_news set isDeploy = ? where id = ?";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setBoolean(1, news.isDeployee());
			ps.setInt(2, news.getId());
			
			ps.executeUpdate();
		}
		catch (Exception e)
		{
			throw new RuntimeException("更新新闻出错......", e);
		}
		
	}
	
	
	/**
	 *		根据id删除指定的新闻
	*/
	public void deleteNews(int id)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			String sql = "delete from t_news where id = ?";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ps.executeUpdate();
			
		}
		catch (Exception e)
		{
			throw new RuntimeException("删除新闻出错......", e);
		}
		
	}
	
	
	
	
}
