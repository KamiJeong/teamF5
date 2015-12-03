package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Like;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class LikesDAO {
	//SqlSessionFactory 
	private SqlSessionFactory factory;
	
	private LikesDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면
	private static LikesDAO dao;
	
	public static LikesDAO getDAO() {
		
		if(dao== null) {
			dao = new LikesDAO();
		}
		return dao;
	}
	
	public List<Like> likeCount(int commentNo){
		List<Like> likes = null;
		SqlSession session = null;
		try {
			session = factory.openSession();
			likes = session.selectList("likes.likeList", commentNo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null)session.close();
		}
		return likes;
	}
	
	public boolean insertLike(Like like){
		SqlSession session =  null;
		
		try {
			session = factory.openSession(true);
			int result = session.insert("insertLike",like);
			
			if(result>0){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null)session.close();
		}
		
		return false;
	}
	
	public String selectLike(Like like){
		String result = null;
		SqlSession session =  null;
		
		try {
			session = factory.openSession(true);
			result = session.selectOne("selectLike",like);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null)session.close();
		}
		
		return result;
	}
}


