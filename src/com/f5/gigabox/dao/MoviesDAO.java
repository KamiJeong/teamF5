package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Movie;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class MoviesDAO {
	
	//SqlSessionFactory 
	private SqlSessionFactory factory;
	
	private MoviesDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면
	private static MoviesDAO dao;
	
	public static MoviesDAO getDAO() {
		
		if(dao== null) {
			dao = new MoviesDAO();
		}
		
		return dao;
	}
	
	public List<Movie> selectList() {
		List<Movie> movieList = null;
		
		SqlSession session = null;
		
		try {
			
			session = factory.openSession();
			
			movieList = session.selectList("movies.selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return movieList;
	}
	
	public List<Movie> selectListTwo() {
		List<Movie> movieList = null;
		
		SqlSession session = null;
		
		try {
			
			session = factory.openSession();
			
			movieList = session.selectList("movies.selectListTwo");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return movieList;
	}
	
	public List<Movie> selectListThree() {
		List<Movie> movieList = null;
		
		SqlSession session = null;
		
		try {
			
			session = factory.openSession();
			
			movieList = session.selectList("movies.selectListThree");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return movieList;
	}
	
	public String recentMovie(int memberNo){
		String movie=null;
		SqlSession session = null;
		
		try {
			
			session = factory.openSession();
			movie = session.selectOne("movies.recentMovie",memberNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return movie;
	}


  public List<Movie> recentMovieList(int memberNo) {
    List<Movie> recentMovie = null;

    SqlSession session = null;

    try {

      session = factory.openSession();

      recentMovie = session.selectList("movies.recentMovieList", memberNo);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if(session!=null) session.close();
    }
    return recentMovie;
  }
  public Movie movieOne(int movieNo) {
    Movie movie = null;
    SqlSession session = null;
    try {
      session = factory.openSession();
      movie = session.selectOne("movies.movieOne",movieNo);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if(session!=null) session.close();
    }
    return movie;
  }
}


