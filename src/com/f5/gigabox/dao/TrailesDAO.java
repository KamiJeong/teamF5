package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Trailer;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class  TrailesDAO {
	
	//SqlSessionFactory 
	private SqlSessionFactory factory;
	
	private TrailesDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면
	private static TrailesDAO dao;
	
	public static TrailesDAO getDAO() {
		
		if(dao== null) {
			dao = new TrailesDAO();
		}
		return dao;
	}
	
	public List<Trailer> trailerList(int movieNo){
		List<Trailer> trailers = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			trailers = session.selectList("trailers.trailerList", movieNo);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
		}
		return trailers;
	}
}


