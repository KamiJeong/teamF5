<%@ page import="com.f5.gigabox.vo.ShowingVO" %>
<%@ page import="com.f5.gigabox.dao.ShowingDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: kami
  Date: 9/25/15
  Time: 12:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String showingNoStr = request.getParameter("showingNo");

    int showingNo = Integer.parseInt(showingNoStr);

    ShowingVO showingVO = ShowingDAO.getDAO().selectInfo(showingNo);

    out.print(showingVO.toString());
%>
