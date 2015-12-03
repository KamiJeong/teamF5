package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Booking;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

/**
 * Created by kami on 9/24/15.
 */
public class BookingsDAO {
  private SqlSessionFactory factory;

  private BookingsDAO() {
    this.factory = FactoryUtil.getFactory();
  }

  private static BookingsDAO dao;

  public static BookingsDAO getDAO() {
    if (dao == null) {
      dao = new BookingsDAO();
    }
    return dao;
  }

  public int selectBookingNo(Booking booking) {
    SqlSession session = null;
    int result = 0;
    try {
      session = factory.openSession();
      result = session.selectOne("bookings.selectBookingNo", booking);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) {
        session.close();
      }
    }
    return result;
  }

  public boolean insertBookingData(Booking booking) {
    SqlSession session = null;
    try {
      session = factory.openSession(true);
      int result = session.insert("bookings.insertOne", booking);
      if (result > 0) {
        return true;
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) {
        session.close();
      }
    }
    return false;
  }
}
