package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.ShowingVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 * Created by kami on 9/24/15.
 */
public class ShowingDAO {
  private SqlSessionFactory factory;

  private ShowingDAO() {
    this.factory = FactoryUtil.getFactory();
  }

  private static ShowingDAO dao;

  public static ShowingDAO getDAO() {
    if (dao == null) {
      dao = new ShowingDAO();
    }
    return dao;
  }

  public List<ShowingVO> selectShowingList() {
    SqlSession session = null;
    List<ShowingVO> showing = null;
    try {
      session = factory.openSession();
      showing = session.selectList("showing.selectList");
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) {
        session.close();
      }
    }
    return showing;
  }

  public List<ShowingVO> selectTimeList(ShowingVO showingVO) {
    SqlSession session = null;
    List<ShowingVO> showing = null;
    try {
      session = factory.openSession();
      showing = session.selectList("showing.selectTimeList", showingVO);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) {
        session.close();
      }
    }
    return showing;
  }

  public ShowingVO selectInfo(int showingNo) {
    SqlSession session = null;
    ShowingVO showingVO = null;
    try {
      session = factory.openSession();
      showingVO = session.selectOne("showing.selectInfo", showingNo);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) {
        session.close();
      }
    }
    return showingVO;
  }


}
