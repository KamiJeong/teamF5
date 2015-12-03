<%@page import="com.f5.gigabox.vo.Event"%>
<%@page import="com.f5.gigabox.dao.EventsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String image = request.getParameter("img");

	EventsDAO dao = EventsDAO.getDAO();
	Event images = dao.selectOneImage(image);
	
%>

{"contents":"<%=images.getContents()%>", "image":"<%=images.getImage()%>"}