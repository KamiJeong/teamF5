package com.f5.gigabox.dao;

import com.f5.gigabox.util.FactoryUtil;
import com.f5.gigabox.vo.Comment;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class CommentsDAO {
  // SqlSessionFactory
  private SqlSessionFactory factory;

  private CommentsDAO() {
    factory = FactoryUtil.getFactory();
  }

  // dao의 레퍼런스를 계속 가지고 있으려면
  private static CommentsDAO dao;

  public static CommentsDAO getDAO() {
    if (dao == null) {
      dao = new CommentsDAO();
    }
    return dao;
  }

  public List<Comment> commentListTemp(int memberNo) {
    List<Comment> list = null;

    SqlSession session = null;

    try {

      session = factory.openSession();

      list = session.selectList("comments.commentListTemp", memberNo);

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null) session.close();
    }
    return list;
  }

  public List<Comment> commentList(int movieNo){
    List<Comment> comments = null;
    SqlSession session = null;

    try {
      session = factory.openSession();
      comments = session.selectList("comments.commentList", movieNo);

    } catch (Exception e) {
      // TODO: handle exception
    }finally{
      if(session!=null)session.close();
    }
    return comments;
  }

  public double getAvgStar(int movieNo) {
    double avgStar = 0;
    SqlSession session = null;

    try {
      session = factory.openSession();
      avgStar = session.selectOne("comments.getAvgStar", movieNo);

    } catch (Exception e) {
      // TODO: handle exception
    } finally {
      if (session != null) session.close();
    }
    return avgStar;
  }

}