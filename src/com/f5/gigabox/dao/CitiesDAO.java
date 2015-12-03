package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.City;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 * Created by kami on 9/24/15.
 */
public class CitiesDAO {
  private SqlSessionFactory factory;

  private CitiesDAO() {
    this.factory = FactoryUtil.getFactory();
  }

  private static CitiesDAO dao;

  public static CitiesDAO getDAO() {
    if (dao == null) {
      dao = new CitiesDAO();
    }
    return dao;
  }

  public List<City> selectCitiesList(){
    SqlSession session = null;
    List<City> cities = null;
    try {
      session = factory.openSession();
      cities = session.selectList("cities.selectList");
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) {
        session.close();
      }
    }
    return cities;
  }
}
