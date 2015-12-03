package com.f5.gigabox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Eventboard;
import com.f5.gigabox.vo.PagingVO;



public class EventBoardsDAO {
	
	//SqlSessionFactory 
	private SqlSessionFactory factory;
	
	private EventBoardsDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면
	private static EventBoardsDAO dao;
	
	public static EventBoardsDAO getDAO() {
		
		if(dao== null) {
			dao = new EventBoardsDAO();
		}
		
		return dao;
	}
	
	
	
/*	public Eventboard selectOne(int eventboardNo){
		Eventboard eventboards = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			eventboards = session.selectOne("eventboards.selectOne",eventboardNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return eventboards;
	}*/
	
	public Eventboard selectOne(int eventboardNo){
		Eventboard eventboard = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			eventboard = session.selectOne("eventboards.selectOne",eventboardNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return eventboard;
	}
	
	public int selectCount() {
		int count = 0;
		
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			count = session.selectOne("eventboards.selectCount");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return count;
	}
	
	public List<Eventboard> selectList(PagingVO vo){
		List<Eventboard> list = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			list = session.selectList("eventboards.selectList",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}
	
	public boolean updateHits(int no){
		boolean result = false;
		SqlSession session = null;
		
		try {
			session = factory.openSession(true);
			int num = session.update("eventboards.updateHits", no);
			
			if(num>=1){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}


