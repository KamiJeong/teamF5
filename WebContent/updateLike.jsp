<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.f5.gigabox.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.f5.gigabox.dao.CommentsDAO"%>
<%@page import="com.f5.gigabox.dao.LikesDAO"%>
<%@page import="com.f5.gigabox.vo.Like"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberNo = request.getParameter("memberNo");
	String commentNo = request.getParameter("commentNo");
	String likeChart = request.getParameter("likes");
	
	
	int member = Integer.parseInt(memberNo);
	int comment = Integer.parseInt(commentNo);
	
	
	Like like = new Like(member,comment);
	Like like2 = new Like(likeChart,member,comment);
	
	LikesDAO dao = LikesDAO.getDAO();
	String preference = dao.selectLike(like);
	
	boolean result = false;
	
	int l = 0;
	int h = 0;
	
	if (preference == null) {
		result = dao.insertLike(like2);
	}
	
	List<Like> likes = dao.likeCount(comment);

	for (Like liked : likes) {
		if (liked.getPreference().equals("l")) {
			l = liked.getLikeCount();
		} else {
			h = liked.getLikeCount();
		}
	}

%>{"result":"<%=result %>","l":"<%=l %>","h":"<%=h %>"}
