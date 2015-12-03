<%@page import="com.f5.gigabox.dao.MembersDAO"%>
<%@page import="com.f5.gigabox.vo.Member"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String birth = request.getParameter("birth");
	String phone = request.getParameter("phone");
	
	Date birthDate = Date.valueOf(birth);
	
	Member member = new Member(birthDate,phone);
	
	member.setId(id);
	
	String pw = MembersDAO.getDAO().pwFind(member);
	//out.println(id);
%>{"result":"<%=pw %>"}
<%-- <script>

	if(<%=id.equals("null")%>){
		alert('새로 회원가입을 해주세요.');
		location.href="joinForm.jsp"; //전화면으로 돌아감(로그인 화면)
	}else{
		alert('고객님의 아이디는 * <%=id%> *입니다. 로그인해주세요.');
		location.href="index.jsp";
	}

</script> --%>