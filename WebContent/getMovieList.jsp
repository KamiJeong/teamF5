<%@ page import="com.f5.gigabox.dao.MoviesDAO" %>
<%@ page import="com.f5.gigabox.vo.Movie" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: kami
  Date: 10/1/15
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Movie> movieList = MoviesDAO.getDAO().selectList();

    out.print(movieList.toString());
%>