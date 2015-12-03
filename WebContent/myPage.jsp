<%@page import="com.f5.gigabox.vo.Comment" %>
<%@page import="com.f5.gigabox.dao.CommentsDAO" %>
<%@page import="java.util.List" %>
<%@page import="com.f5.gigabox.vo.Movie" %>
<%@page import="com.f5.gigabox.dao.MoviesDAO" %>
<%@page import="com.f5.gigabox.vo.Point" %>
<%@page import="com.f5.gigabox.dao.PointsDAO" %>
<%@page import="com.f5.gigabox.dao.MembersDAO" %>
<%@page import="com.f5.gigabox.util.PaginateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%

    //JSP는 내장객체(지역변수) request, response, out, page, session

    //몇 페이지인지 알 수 있는 파라미터
    //index.jsp?page=1

    //String pageStr = request.getParameter("page");

    //int now = 1;

    //만약 넘어온 파라미터가 있을경우
    //if(pageStr!=null) {
    //	now = Integer.parseInt(pageStr);
    //}

    //page는 내장객체니까 pageNo
    //int pageNo = Integer.parseInt(pageStr);

    //페이지당 갯수
    //int numPage = 2;
    //int numBlock = 3;

    //String href = "index.jsp";
    //String param = "page";

    //1페이지 : 1~3
    //2페이지 : 4~6
    //3페이지 : 7~9

    //PagingVO pagingVO = new PagingVO(now, numPage);

    //pagingVO.setStart(1);
    //pagingVO.setEnd(3);

    //GuestbookDAO dao = GuestbookDAO.getDAO();

    //List<GuestbookVO> list = dao.selectList(pagingVO);

    //int total = dao.selectTotalCount();

    //String paginate = PaginateUtil.getPaginate(now, numPage, numBlock, total, href, param);

    MembersDAO dao = MembersDAO.getDAO();
    PointsDAO dao2 = PointsDAO.getDAO();
    MoviesDAO dao3 = MoviesDAO.getDAO();
    CommentsDAO dao4 = CommentsDAO.getDAO();


%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>myPage</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/noto.sans.korea.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <style>

        strong {
            color: #463A8B;
        }

        #content {
            width: 1000px;
            margin: 150px auto 100px auto;
        }

        #category {
            font-size: 30px;
            margin-top: 30px;
            margin-bottom: 30px;
        }

        #category a {
            text-decoration: none;
        }

        #category ul {
            height: 50px;
            list-style: none;
            position: relative;
        }

        #category li {
            position: absolute;
        }

        #category li:first-child {
            border-bottom: 5px solid #581F7D;
        }

        #category li:nth-child(2) {
            left: 130px;
        }

        #category li:nth-child(3) {
            left: 330px;
        }

        #myProfile {
            height: 700px;
            border-radius: 5px;
            border: 3px solid #581F7D;
        }

        #myProfile li {
            margin-top: 10px;
        }

        #profile {
            width: 1000px;
            height: 330px;
            position: relative;
            margin: auto;
        }

        #imgBox, #profileBox {
            position: absolute;
        }

        #img {
            height: 250px;
            margin: 30px;
            border-radius: 125px;
            border: 1px solid #581F7D;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        #profileBox {
            height: 300px;
            top: 0;
            left: 350px;
        }

        #profileBox li {
            margin-top: 30px;
        }

        #profileBox span {
            font-size: 20px;
        }

        #profileBox strong {
            font-size: 30px;
        }

        #profileBox #name {
            margin-right: 100px;
        }

        #profileBox #phone {
            margin-right: 85px;
        }

        #profileBox #birthDay {
            margin-right: 65px;
        }

        #profileBox #gender {
            margin-right: 100px;
        }

        #myInfoBox {
            height: 200px;
            position: relative;
            margin: auto auto 50px auto;
        }

        #grade, #point, #favor {
            width: 280px;
            height: 350px;
            margin-top: 20px;
            position: absolute;
            border-top: 3px solid #581F7D;
            top: 0;
        }

        #grade li {
            margin-top: 75px;
        }

        #grade strong {
            padding-left: 20px;
            padding-right: 10px;
            font-size: 40px;
        }

        #grade #myGrade {
            margin-left: 80px;
        }

        #grade #myGradeEnd {
            margin-left: 220px;
        }

        #point {
            left: 280px;
            border-left: 3px solid #581F7D;
        }

        #point li {
            margin-top: 25px;
        }

        #point strong {
            padding: 20px;
            font-size: 50px;
        }

        #point span {
            padding: 5px;
        }

        #favor {
            width: 434px;
            left: 560px;
            border-left: 3px solid #581F7D;
        }

        #favor strong {
            padding: 20px;
            font-size: 25px;
        }

        #favor span {
            padding: 5px;
        }

        #past {
            min-height: 500px;
            margin-top: 50px;
            position: relative;
            font-size: 25px;
        }

        #past h3 {
            border-right: 3px solid #581F7D;
            border-top: 3px solid #581F7D;
            text-align: center;
            width: 200px;
            height: 50px;
            line-height: 50px;
            background-color: #581F7D;
            position: absolute;
            color: #fff;
            left: 0;
            top: 0;
            z-index: 1;
        }

        #past h3:nth-of-type(1) {
            left: 0;
            top: 0;
        }

        #past h3:nth-of-type(2) {
            left: 200px;
            top: 0;
        }

        #past h3.now a {
            background: #fff;
            color: #581F7D;
        }

        #past a {
            width: 200px;
            height: 50px;
            font-size: 20px;
            font-weight: 700;
            display: block;
            text-decoration: none;
            color: #fff;
        }

        #past h3:first-child {
            border-left: 3px solid #581F7D;
        }

        #past .paginate {
            clear: both;
            padding: 10px;
            text-align: center;
        }

        #past .paginate a, .paginate strong {
            font-size: 12px;
            background: url("img/sp_paginate_v2.gif") no-repeat -42px 0;
            color: #666666;
            cursor: pointer;
            display: inline-block;
            font-family: tahoma;
            font-weight: 500;
            height: 32px;
            line-height: 32px;
            margin-right: -1px;
            text-decoration: none;
            vertical-align: top;
            width: 32px;
            transition: font-size .2s ease;
        }

        #past .paginate strong, .paginate a:hover {
            background-position: -42px -64px;
            color: #3D6ED3;
            margin: -1px -2px -2px -1px;
            padding: 1px 1px 2px 1px;
            position: relative;
            z-index: 1;
            font-size: 16px;
            text-decoration: underline;
        }

        #past .paginate strong {
            font-size: 18px;
            cursor: default;
            text-decoration: none;
        }

        #past .paginate .prev, .paginate .next {
            background: url("img/sp_paginate_v2.gif") no-repeat;
            border: 0 none;
            display: inline-block;
            font-size: 0;
            text-indent: -9999px;
            height: 32px;
            line-height: 0;
            margin: 0;
            overflow: hidden;
            padding: 0;
            vertical-align: top;
            width: 42px;
        }

        #past .paginate .prev {
            background-position: 0 0;
            margin-right: -1px;
        }

        #past .paginate a.prev {
            background-position: 0 -32px;
        }

        #past .paginate a.prev:hover {
            background-position: 0 -65px;
            margin: 0;
            margin-right: -1px;
            padding: 0;
        }

        #past .paginate .next {
            background-position: -74px 0;
        }

        #past .paginate a.next {
            background-position: -74px -32px;
        }

        #past .paginate a.next:hover {
            background-position: -76px -65px;
            margin: 0;
            padding: 0;
        }

        .btn {
            font: 500 15px bon, sans-serif;
            width: 100px;
            height: 40px;
            margin-left: 10px;
            cursor: pointer;
            border-radius: 10px;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            background: #E1BEE7;
        }

        .btn:active {
            background: #9575CD;
        }

        #watchedList.now, #commentList.now {
            display: block;
        }

        #watchedList {
            position: absolute;
            top: 50px;
            width: 1000px;
            height: 485px;
            border-top: 3px solid #581F7D;
            border-bottom: 3px solid #581F7D;
            display: none;
        }

        #watchedList ul {
            height: 400px;
        }

        #watchedList li {
            position: relative;
            display: inline-block;
            transition: .2s ease;
            width: 200px;
            height: 285px;
            margin-top: 50px;
            margin-left: 20px;
            border: 3px solid rgba(0, 0, 0, 0);
            overflow: hidden;
        }

        #watchedList li a {
            display: block;
        }

        #watchedList img {
            width: 200px;
            height: 285px;
            position: absolute;
            transition: .2s ease;
        }

        #watchedList li:nth-child(2) {
            left: 28px;
        }

        #watchedList li:nth-child(3) {
            left: 56px;
        }

        #watchedList li:nth-child(4) {
            left: 84px;
        }

        #watchedList li:hover {
            cursor: pointer;
            opacity: 1;
            border: 3px solid #581F7D;
        }

        #watchedList h4 {
            width: 200px;
            height: 100px;
            line-height: 100px;
            bottom: -100px;
            background: rgba(0, 0, 0, .3);
            text-align: center;
            font-size: 20px;
            font-weight: 700;
            position: absolute;
            color: #fff;
            transition: .2s ease;
        }

        #watchedList li:hover h4 {
            bottom: 0;
            display: block;
        }

        #watchedList li > a {
            display: block;
        }

        #commentList {
            position: absolute;
            top: 50px;
            width: 1000px;
            height: 1185px;
            border-top: 3px solid #581F7D;
            border-bottom: 3px solid #581F7D;
            display: none;
        }

        #commentList .commentBox {
            position: relative;
            width: 950px;
            height: 160px;
            margin: 50px auto;
            box-shadow: 2px 2px 3px #333;
        }

        #commentList .commentBox span {
            position: absolute;
            font-size: 20px;
        }

        #commentList .commentBox img {
            position: absolute;
            width: 100px;
            height: 120px;
            margin-top: 20px;
            margin-left: 55px;
            transition: .2s ease;
            border: 3px solid rgba(0, 0, 0, 0);
        }

        #commentList .commentBox img:hover {
            border: 3px solid #581F7D;
        }

        #commentList .comment {
            position: absolute;
            top: 20px;
            left: 200px;
            width: 700px;
            height: 100px;
        }

        #commentList .comment #commentRegdate {
            bottom: 0;
        }

    </style>
</head>
<body>
<%@include file="template/header.jsp" %>
<%
    if (loginMember == null) {
        response.sendRedirect("index.jsp");
    } else {
        Member member = dao.selectOne(loginMember.getMemberNo());
        allPoint = dao2.allPoint(loginMember.getMemberNo());
        recentPoint = dao2.recentPoint(loginMember.getMemberNo());
        Point membershipPoint = new Point();
        String membershipGrade = membershipPoint.getMembership(allPoint);
        List<Movie> recentMovieList = dao3.recentMovieList(loginMember.getMemberNo());
        String frequentCinema = dao.frequentCinema(loginMember.getMemberNo());
        List<Member> showedMovieList = dao.showedMovieList(loginMember.getMemberNo());
        List<Comment> showedCommentList = dao4.commentListTemp(loginMember.getMemberNo());
%>

<div id="content">

    <div id="myinfo">

        <div id="category">

            <h2 class="screen_out">메뉴</h2>
            <ul>
                <li>
                    <a href="myPage.jsp">내정보</a>
                </li>
                <li>
                    <a href="infoUpdate.jsp">내정보 수정</a>
                </li>
                <li>
                    <a href="bookingList.jsp">예매목록</a>
                </li>
            </ul>

        </div>
        <!-- //category -->

        <div id="myProfile">

            <div id="profile">

                <div id="imgBox">

                    <img id="img" src="<%=member.getProfile() %>"/>

                </div>
                <!-- //img -->

                <div id="profileBox">

                    <ul>
                        <li>
                            <h3 class="screen_out">내정보</h3>
                        </li>
                        <li>
                            <span id="name">이 름</span><strong><%=member.getName() %>
                        </strong>
                        </li>
                        <li>
                            <span id="phone">연락처</span><strong><%=member.getPhoneNum() %>
                        </strong>
                        </li>
                        <li>
                            <span id="birthDay">생년월일</span><strong><%=member.getYear() %>년 <%=member.getMonth() + 1 %>
                            월 <%=member.getDay() %>일</strong>
                        </li>
                        <%if (member.getGender().equals("M")) { %>
                        <li>
                            <span id="gender">성 별</span><strong>남 자</strong>
                        </li>
                        <%} else { %>
                        <li>
                            <span id="gender">성 별</span><strong>여 자</strong>
                        </li>
                        <%} %>
                    </ul>
                </div>
                <!-- //profileBox -->

            </div>
            <!-- //profile -->

            <div id="myInfoBox">

                <div id="grade">

                    <ul>
                        <li>
                            <strong><%=member.getName() %>
                            </strong><span>님의 등급은</span>
                        </li>
                        <li>
                            <strong id="myGrade"><%=membershipGrade %>
                            </strong><span>입니다.</span>
                        </li>
                    </ul>

                </div>
                <!-- //grade -->

                <div id="point">

                    <ul>
                        <li>
                            <span>잔여포인트</span>
                        </li>
                        <li>
                            <strong><%=recentPoint %>
                            </strong><span>Point</span>
                        </li>
                        <li>
                            <span>누적포인트</span>
                        </li>
                        <li>
                            <strong><%=allPoint %>
                            </strong><span>Point</span>
                        </li>
                    </ul>
                </div>
                <!-- //point -->

                <div id="favor">

                    <ul>
                        <%
                            if (!recentMovieList.isEmpty()) {
                                for (Movie MovieList : recentMovieList) {

                                    String startHourText = MovieList.getMovieStartTime().substring(0, 2);
                                    startHourText = startHourText + "시";
                                    String startMinuteText = MovieList.getMovieStartTime().substring(2, 4);
                                    startMinuteText = startMinuteText + "분";
                                    String movieStart = startHourText + startMinuteText;

                                    String endHourText = MovieList.getMovieEndTime().substring(0, 2);
                                    endHourText = endHourText + "시";
                                    String endMinuteText = MovieList.getMovieEndTime().substring(2, 4);
                                    endMinuteText = endMinuteText + "분";
                                    String movieEnd = endHourText + endMinuteText;

                        %>
                        <li>
                            <span>최근 본 영화</span>
                        </li>
                        <li>
                            <strong><%=MovieList.getMovieTitle() %>
                            </strong><br>
                            <strong><%=MovieList.getCinemaName() %>
                            </strong><br>
                            <strong><%=movieStart%> ~ <%=movieEnd%>
                            </strong>
                        </li>
                        <li>
                            <span>자주보는 장르</span>
                        </li>
                        <li>
                            <strong>액션, 로맨스</strong>
                        </li>
                        <li>
                            <span>자주가는 극장</span>
                        </li>
                        <li>
                            <strong>GIGABOX <%=frequentCinema%>점</strong>
                        </li>
                        <%
                            }
                        } else {
                        %>
                        <li>
                            <span>최근 본 영화</span>
                        </li>
                        <li>
                            <strong>최근 본 영화가 없습니다 ㅠ_ㅠ</strong>
                        </li>
                        <li>
                            <span>자주보는 장르</span>
                        </li>
                        <li>
                            <strong>자주보는 장르가 없습니다 ㅠ_ㅠ</strong>
                        </li>
                        <li>
                            <span>자주가는 극장</span>
                        </li>
                        <li>
                            <strong>자주가는 극장이 없습니다 ㅠ_ㅠ</strong>
                        </li>
                        <% }%>
                    </ul>

                </div>
                <!-- //favor -->

            </div>
            <!-- //myInfoBox -->

        </div>
        <!-- //myProfile -->

        <div id="past">

            <h3 class="now"><a href="#">내가 본 영화</a></h3>

            <div id="watchedList" class="contentBox now">

                <ul>
                    <%
                        if (!showedMovieList.isEmpty()) {
                            for (Member showedMovie : showedMovieList) {
                    %>
                    <li>
                        <a href="movieInfo.jsp?no=<%=showedMovie.getMovieNo() %>"
                           title="<%=showedMovie.getMovieTitle() %>"><img src="<%=showedMovie.getMoviePoster() %>"
                                                                          title="<%=showedMovie.getMovieTitle() %> 포스터"/>
                            <h4><%=showedMovie.getMovieTitle() %>
                            </h4></a>
                    </li>
                    <%
                        }
                    } else {
                    %>
                    <span>내가 본 영화가 없습니다 ㅠ_ㅠ</span>
                    <%} %>
                </ul>

                <div class="paginate">
                    <h4 class="screen_out">페이지</h4>
                    <!-- 비활성화 이전버튼 -->
                    <span class="prev"><span>이전</span></span><!--
							--><a href="" class="prev"
                                  title="이전페이지"><span>이전</span></a><!--
							--><strong title="현재페이지">1</strong><!--
							--><a href="" title="2">2</a><!--
							--><a href="" title="3">3</a><!--
							--><a href="" title="4">4</a><!--
							--><a href="" title="5">5</a><!--
							--><a href="" title="다음페이지"
                                  class="next"><span>다음</span></a><!--
							--><span class="next"><span>다음</span></span>
                </div>
                <!-- //paginate -->

            </div>
            <!-- //watchedList -->

            <h3><a href="#">내가 쓴 코멘트</a></h3>

            <div id="commentList" class="contentBox">
                <%
                    if (!showedCommentList.isEmpty()) {
                        for (Comment commentList : showedCommentList) {
                %>
                <div id="commentBoxPoster" class="commentBox">
                    <a href="movieInfo.jsp?no=<%=commentList.getMovieNo() %>"><img src="<%=commentList.getPoster() %>"
                                                                                   title="<%=commentList.getTitle() %>"/></a>

                    <div id="commentBoxComment1" class="comment">
                        <span><%=commentList.getContents() %></span>
                        <span id="commentRegdate"><%=commentList.getRegdate() %></span>
                    </div>
                    <!-- //commentBoxComment -->

                </div>
                <!-- //commentBoxPoster -->

                <%
                    }
                } else {
                %>

                <div id="commentBoxPoster" class="commentBox">

                    <div id="commentBoxComment2" class="comment">

                        <span>내가 쓴 코멘트가 없습니다 ㅠ_ㅠ</span>

                    </div>
                    <!-- //commentBoxComment -->

                </div>
                <!-- //commentBoxPoster -->

                <%} %>

                <!-- paginate -->

            </div>
            <!-- //commentList -->

        </div>
        <!-- //past -->

    </div>
    <!-- //myInfo -->

</div>
<!-- //content -->

<%@include file="template/footer.jsp" %>

<script src="js/jquery.js"></script>
<script>

    $("#header .aux li").eq(4).click(function (e) {
        e.preventDefault();
        //$("#loginBox").fadeToggle(800);
        $(".loginMyPage").fadeToggle(800);
    });

    var $h3 = $("#past h3");

    $h3.click(function (e) {

        e.preventDefault();

        var $this = $(this);

        $(".now").removeClass("now");

        $this.addClass("now");

        var height = $this.next().addClass("now").height();

        //alert(height);

        $("#past").height(height + 15);

    });
</script>

</body>
</html>

<%}%>