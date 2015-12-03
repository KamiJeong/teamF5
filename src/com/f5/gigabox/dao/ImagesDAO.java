package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Image;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class ImagesDAO {
	
	//SqlSessionFactory 
	private SqlSessionFactory factory;
	
	private ImagesDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면
	private static ImagesDAO dao;
	
	public static ImagesDAO getDAO() {
		
		if(dao== null) {
			dao = new ImagesDAO();
		}
		return dao;
	}
	
	public List<Image> imageList(int movieNo){
		List<Image> images = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			images = session.selectList("images.imageList", movieNo);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
		}
		return images;
	}
}


