<%@page import="com.f5.gigabox.vo.Member" %>
<%@page import="com.f5.gigabox.dao.LikesDAO" %>
<%@page import="com.f5.gigabox.vo.Like" %>
<%@page import="java.util.List" %>
<%@page import="com.f5.gigabox.dao.CommentsDAO" %>
<%@page import="com.f5.gigabox.vo.Comment" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@page import="com.f5.gigabox.dao.ImagesDAO" %>
<%@page import="com.f5.gigabox.vo.Image" %>
<%@page import="com.f5.gigabox.dao.MoviesDAO" %>
<%@page import="com.f5.gigabox.vo.Movie" %>
<%@page import="com.f5.gigabox.dao.TrailesDAO" %>
<%@page import="com.f5.gigabox.vo.Trailer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String noStr = request.getParameter("no");
    int movieNo = Integer.parseInt(noStr);
    //SESSION 로그인멤버객체받기.
    List<Trailer> trailers = TrailesDAO.getDAO().trailerList(movieNo);
    Movie movies = MoviesDAO.getDAO().movieOne(movieNo);
    List<Image> images = ImagesDAO.getDAO().imageList(movieNo);
    List<Comment> comments = CommentsDAO.getDAO().commentList(movieNo);
    double avgStar = CommentsDAO.getDAO().getAvgStar(movieNo);

    for (Comment comment : comments) {
        List<Like> likes = LikesDAO.getDAO().likeCount(comment.getCommentNo());
        for (Like like : likes) {
            if (like.getPreference().equals("l")) {
                comment.setLikes(like.getLikeCount());
            } else {
                comment.setHates(like.getLikeCount());
            }
        }

    }
    Member member = (Member) session.getAttribute("loginMember");
    Map map = new HashMap();
    map.put("trailers", trailers); //aaaa
    map.put("movies", movies);
    map.put("images", images);
    map.put("comments", comments);
    map.put("session", member);
    map.put("avgStar", avgStar); //aaaa
    ObjectMapper om = new ObjectMapper();
    String json = om.writeValueAsString(map);
    System.out.println(json);
    out.print(json);
%>