package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Seat;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 * Created by kami on 9/24/15.
 */
public class SeatsDAO {
  private SqlSessionFactory factory;

  private SeatsDAO() {
    this.factory = FactoryUtil.getFactory();
  }

  private static SeatsDAO dao;

  public static SeatsDAO getDAO() {
    if (dao == null) {
      dao = new SeatsDAO();
    }
    return dao;
  }

  public List<Seat> selectSeatsList(int screenNo) {
    SqlSession session = null;
    List<Seat> seats = null;
    try {
      session = factory.openSession();
      seats = session.selectList("seats.selectList", screenNo);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) {
        session.close();
      }
    }
    return seats;
  }

  public List<Integer> selectBookedList(int showingNo) {
    SqlSession session = null;
    List<Integer> bookedList = null;
    try {
      session = factory.openSession();
      bookedList = session.selectList("seats.selectBooked", showingNo);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) {
        session.close();
      }
    }
    return bookedList;
  }

}
