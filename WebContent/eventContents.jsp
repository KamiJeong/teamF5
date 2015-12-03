
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.f5.gigabox.vo.Event"%>
<%@page import="com.f5.gigabox.dao.EventsDAO"%>
<%@page import="com.f5.gigabox.util.PaginateUtil"%>
<%@page import="com.f5.gigabox.vo.PagingVO"%>
<%@page import="java.util.List"%>
<%@page import="com.f5.gigabox.dao.EventBoardsDAO"%>
<%@page import="com.f5.gigabox.vo.Eventboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String eventboardNoStr = request.getParameter("no");
	int eventboardNo = Integer.parseInt(eventboardNoStr);

	EventBoardsDAO dao = EventBoardsDAO.getDAO();
	//Eventboard eventboard = dao.selectOne(eventboardNo);
	Eventboard content = dao.selectOne(eventboardNo);
	
	
	//ObjectMapper om = new ObjectMapper();
	
	//String json = om.writeValueAsString(eventboard);

	//List의 toString()이 배열형태로 출력할 수 있도록 오버라이딩 되어있어서.
	//out.print(json);
	Set<Integer> hits = (Set)session.getAttribute("hits");
	
	if(hits==null){
		hits = new TreeSet<Integer>();
		System.out.println("만들어집니다.");
		
		//session에 세팅
		session.setAttribute("hits", hits);
		
		
	}
	
	//session에 있는 hits에 현재 글번호가 들어있는지 여부를 확인한다.
	boolean hasNo = hits.contains(eventboardNo);
	
	if(!hasNo){
		//조회수 증가는 update구문
		boolean result = dao.updateHits(eventboardNo);
		
		if(result) {
			content.setHits(content.getHits()+1);
		}
		
		//번호를 넣어준다.
		hits.add(eventboardNo);
		System.out.println("당신은 게시물 "+eventboardNo+"번 글을 처음봤어요!");
	}else{
		System.out.println("한번이상 보셨네요? 조회수 증가안되용~ :)");
		
	}
	
%>
{"result":"<%=content.getContents() %>"}


