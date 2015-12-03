<%@page import="com.f5.gigabox.dao.MembersDAO"%>
<%@page import="com.f5.gigabox.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("pw");

	Member member = new Member(id, password);

	Member loginMember = MembersDAO.getDAO().selectLogin(member);
	
	if(loginMember!=null){
		session.invalidate();
		session = request.getSession();
		
		session.setAttribute("loginMember", loginMember);

		String referer = request.getHeader("referer");

		response.sendRedirect(referer);	
	}
	
%>
<script>

	if(<%=loginMember%>==null){
		alert('아이디 또는 비밀번호를 확인해주세요');
		location.href="index.jsp"; //전화면으로 돌아감(로그인 화면)
	}
	
</script>

