<%@page import="com.f5.gigabox.dao.MembersDAO" %>
<%@page import="com.f5.gigabox.vo.Member" %>
<%@page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%

    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("joinFormId");
    String pw = request.getParameter("joinFormPw");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
//    String getbirthDate = request.getParameter("birthDate");
    String phone = request.getParameter("phone");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String type = request.getParameter("type");

    Date birthDate = Date.valueOf(year + "-" + month + "-" + day);

    Member member = new Member(id, pw, name, birthDate, gender, phone, type);

    MembersDAO dao = MembersDAO.getDAO();


    boolean result = dao.insertMember(member);

    if (result) {
        response.sendRedirect("index.jsp");
    } else {
        out.print("ERROR 404");
    }
%>