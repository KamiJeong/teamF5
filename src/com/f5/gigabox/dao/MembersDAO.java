package com.f5.gigabox.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Member;

import java.util.List;

public class MembersDAO {

  //SqlSessionFactory
  private SqlSessionFactory factory;

  private MembersDAO() {
    factory = FactoryUtil.getFactory();
  }

  //dao의 레퍼런스를 계속 가지고 있으려면
  private static MembersDAO dao;

  public static MembersDAO getDAO() {

    if (dao == null) {
      dao = new MembersDAO();
    }

    return dao;
  }

  public Member selectLogin(Member member) {
    Member loginMember = null;

    SqlSession session = null;

    try {

      session = factory.openSession();

      loginMember = session.selectOne("members.selectLogin", member);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) session.close();
    }

    return loginMember;
  }

  public String idFind(Member member) {
    String id = "false";
    SqlSession session = null;

    try {

      session = factory.openSession();

      id = session.selectOne("members.idFind", member);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) session.close();
    }

    return id;
  }

  public String pwFind(Member member) {
    String pw = "false";
    SqlSession session = null;

    try {

      session = factory.openSession();
      pw = session.selectOne("members.pwFind", member);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) session.close();
    }

    return pw;
  }

  public boolean chkId(String id) {
    SqlSession session = null;
    try {
      // auto commit
      // DB내용이 변경될 경우 TRUE
      session = factory.openSession();
      int result = session.selectOne("members.check", id);
      if (result >= 1) {
        return true;
      }
    } catch (Exception e) {

      e.printStackTrace();

    } finally {
      if (session != null)
        session.close();
    }
    return false;
  }

  public boolean insertMember(Member member) {

    boolean result = false;
    SqlSession session = null;
    try {
      // auto commit
      // DB내용이 변경될 경우 TRUE
      session = factory.openSession(true);
      int num = session.insert("members.insertMember", member);
      if (num >= 1) {
        return true;
      }
    } catch (Exception e) {

      e.printStackTrace();

    } finally {
      if (session != null)
        session.close();
    }

    return false;
  }

  public boolean update(Member member) {
    SqlSession session = null;

    try {

      session = factory.openSession(true);
      int num = session.update("member.update", member);
      if (num > 1) {
        return true;
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null)
        session.close();
    }

    return false;
  }// update() end

  public Member selectOne(int memberNo) {

    Member member = null;

    SqlSession session = null;

    try {

      session = factory.openSession();

      member = session.selectOne("members.selectOne", memberNo);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null)
        session.close();
    }

    return member;
  }// selectOne() end

  public List<Member> movieInfoList(int memberNo) {
    List<Member> list = null;

    SqlSession session = null;

    try {

      session = factory.openSession();

      list = session.selectList("members.movieInfoList", memberNo);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if(session!=null) session.close();
    }
    return list;
  }// movieInfoList() end

  public String frequentCinema(int memberNo) {
    String result = null;

    SqlSession session = null;

    try {

      session = factory.openSession();

      result = session.selectOne("members.frequentCinema", memberNo);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if(session!=null) session.close();
    }
    return result;
  }

  public List<Member> showedMovieList(int memberNo) {
    List<Member> list = null;

    SqlSession session = null;

    try {

      session = factory.openSession();

      list = session.selectList("members.showedMovieList", memberNo);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if(session!=null) session.close();
    }

    return list;
  }
}


