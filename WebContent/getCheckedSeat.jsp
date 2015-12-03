<%@ page import="com.f5.gigabox.dao.SeatsDAO" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: kami
  Date: 9/25/15
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String showingNoStr = request.getParameter("showingNo");

    int showingNo = Integer.parseInt(showingNoStr);

    List<Integer> bookedList = SeatsDAO.getDAO().selectBookedList(showingNo);

    out.print(bookedList);

%>
