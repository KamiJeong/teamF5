package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Ticket;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 * Created by kami on 9/24/15.
 */
public class TicketsDAO {
  private SqlSessionFactory factory;

  private TicketsDAO() {
    this.factory = FactoryUtil.getFactory();
  }

  private static TicketsDAO dao;

  public static TicketsDAO getDAO() {
    if (dao == null) {
      dao = new TicketsDAO();
    }
    return dao;
  }

  public boolean insertTicketData(Ticket ticket) {
    SqlSession session = null;
    try {
      session = factory.openSession(true);
      int result = session.insert("tickets.insertOne", ticket);
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

  public List<Ticket> bookingList(int memberNo) {
    List<Ticket> list = null;

    SqlSession session = null;

    try {

      session = factory.openSession();

      list = session.selectList("tickets.bookingList", memberNo);


    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) session.close();
    }
    return list;
  }// bookingList() end

  public boolean deleteTicket(Ticket ticket) {

    SqlSession session = null;

    try {

      session = factory.openSession(true);

      int size = session.delete("tickets.deleteTicket", ticket);

      if (size >= 1) {
        return true;
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) session.close();
    }
    return false;
  }

  public boolean deleteBooking(int bookingNo) {

    SqlSession session = null;

    try {

      session = factory.openSession(true);

      int size = session.delete("tickets.deleteBooking", bookingNo);

      if (size >= 1) {
        return true;
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) session.close();
    }
    return false;
  }
}
