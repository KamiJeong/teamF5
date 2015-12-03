package com.f5.gigabox.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.f5.gigabox.util.FactoryUtil;

public class PointsDAO {
	
	//SqlSessionFactory 
	private SqlSessionFactory factory;
	
	private PointsDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면
	private static PointsDAO dao;
	
	public static PointsDAO getDAO() {
		
		if(dao== null) {
			dao = new PointsDAO();
		}
		
		return dao;
	}
	
	public int recentPoint(int memberNo){
		int point = 0;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			point = session.selectOne("points.recentPoint", memberNo);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
		}
		return point;
	}
	
	public int allPoint(int memberNo){
		int point = 0;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			point = session.selectOne("points.allPoint", memberNo);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
		}
		return point;
	}
}


