<%@ page import="com.f5.gigabox.dao.ShowingDAO" %>
<%@ page import="com.f5.gigabox.vo.ShowingVO" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: kami
  Date: 9/24/15
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String cinemaNoStr = request.getParameter("cinemaNo");
    String title = request.getParameter("title");
    String temp = request.getParameter("temp") + "%";

    int cinemaNo = Integer.parseInt(cinemaNoStr);

    ShowingVO showingVO = new ShowingVO(cinemaNo, title, temp);


    List<ShowingVO> showing = ShowingDAO.getDAO().selectTimeList(showingVO);

    out.print(showing.toString());
%>