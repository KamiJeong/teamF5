<%@ page import="com.f5.gigabox.vo.Cinema" %>
<%@ page import="java.util.List" %>
<%@ page import="com.f5.gigabox.dao.CinemasDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: kami
  Date: 9/24/15
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String cityNoStr = request.getParameter("cityNo");

    int cityNo = Integer.parseInt(cityNoStr);

    List<Cinema> cinemas = CinemasDAO.getDAO().selectCinemasList(cityNo);

    out.print(cinemas.toString());
%>
