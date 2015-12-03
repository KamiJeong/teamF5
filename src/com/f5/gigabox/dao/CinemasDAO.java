package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Cinema;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 * Created by kami on 9/24/15.
 */
public class CinemasDAO {
  private SqlSessionFactory factory;

  private CinemasDAO() {
    this.factory = FactoryUtil.getFactory();
  }

  private static CinemasDAO dao;

  public static CinemasDAO getDAO() {
    if (dao == null) {
      dao = new CinemasDAO();
    }
    return dao;
  }

  public List<Cinema> selectCinemasList(int cityNo) {
    SqlSession session = null;
    List<Cinema> cinemas = null;
    try {
      session = factory.openSession();
      cinemas = session.selectList("cinemas.selectList", cityNo);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) {
        session.close();
      }
    }
    return cinemas;
  }
}
