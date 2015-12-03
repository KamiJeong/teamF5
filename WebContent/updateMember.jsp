<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="com.f5.gigabox.dao.MembersDAO"%>
<%@page import="com.f5.gigabox.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String memberNoStr = request.getParameter("member_no");
	
	int memberNo = Integer.parseInt(memberNoStr);
	
	String pwd = request.getParameter("pwd");
	
	String name = request.getParameter("name2");
	
	String gender = request.getParameter("gender");
	
	String phone = request.getParameter("phone");
	
	//Timestamp regdate = Timestamp.valueOf("regdate");
	
	//String profile = request.getParameter("profile");
	
	//String type = request.getParameter("type");
	String type="f";
	
	Member vo = new Member(memberNo, pwd, name, phone, type);
	
	
	 boolean result = MembersDAO.getDAO().update(vo);
	
	 if(result){
		response.sendRedirect("index.jsp");}
	 else{
		 response.sendRedirect("infoUpdate.jsp");
	 }

%>