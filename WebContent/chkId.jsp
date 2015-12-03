<%@page import="com.f5.gigabox.dao.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");

	boolean result = MembersDAO.getDAO().chkId(id);

%>

{"result":<%=result%>}