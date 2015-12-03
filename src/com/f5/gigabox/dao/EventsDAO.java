package com.f5.gigabox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Event;
import com.f5.gigabox.vo.Eventboard;
import com.f5.gigabox.vo.PagingVO;



public class EventsDAO {
	
	//SqlSessionFactory 
	private SqlSessionFactory factory;
	
	private EventsDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면
	private static EventsDAO dao;
	
	public static EventsDAO getDAO() {
		
		if(dao== null) {
			dao = new EventsDAO();
		}
		
		return dao;
	}
	
	
	
	public Event selectOne(int evenNo){
		Event events = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			events = session.selectOne("events.selectOne",evenNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return events;
	}
	
	public Event selectOneImage(String image){
		Event events = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			events = session.selectOne("events.selectOneImage",image);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return events;
	}
	
	public Event selectOneContent(String contents){
		Event events = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			events = session.selectOne("events.selectOneContent",contents);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return events;
	}
	
	public int selectCount() {
		int count = 0;
		
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			count = session.selectOne("events.selectCount");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return count;
	}
	
	public List<Event> selectList(PagingVO vo){
		List<Event> list = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			list = session.selectList("events.selectList",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
}


