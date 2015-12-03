<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//세션에 있는 'loginMember' attribute를 제거(무효화처리)
//session.removeAttribute("loginMember");
//세션에 있는 모든 attribute를 초기화 loginMember,hits도 초기화
session.invalidate();

//이전 페이지로 이동

String referer = request.getHeader("referer");

response.sendRedirect(referer);

%>