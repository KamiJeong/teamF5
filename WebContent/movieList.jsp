<%@ page import="com.f5.gigabox.vo.Movie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    List<Movie> movieList = MoviesDAO.getDAO().selectList();
    List<Movie> movieList2 = MoviesDAO.getDAO().selectListTwo();
    List<Movie> movieList3 = MoviesDAO.getDAO().selectListThree();
    String htmlTag = null;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>movieList</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/noto.sans.korea.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800,900);

        /* 화면 밀림과 함꼐 풋터부분이 위에서 당겨지기에 마진으로 밀어버림*/
        #footer {
            margin-top: 180px;
        }

        #content {
            width: 1000px;
            /*min-height: 1000px;*/
            height: auto;
            background: #fff;
            margin: auto;
            position: relative;
            /*background-color: yellow;*/
        }

        #content .movieBox {
            width: 1000px;
            min-height: 800px;
            height: auto;
            position: relative;
            top: 180px;
            left: 0;
        }

        #content ul {
            height: auto;
            position: relative;
            /*background-color: red;*/
        }

        #content .movieBox li {
            width: 210px;
            height: 316px;
            display: inline-block;
            margin: 10px;
            border: 5px solid transparent;
            cursor: pointer;
            transition: .2s ease;
            overflow: hidden;
            position: relative;
            box-shadow: 0 27px 24px 0 rgba(0, 0, 0, 0.2), 0 40px 77px 0 rgba(0, 0, 0, 0.22);
        }

        #content .movieBox li a > img {
            width: 210px;
            height: 316px;
            cursor: pointer;
            transition: .2s ease;
            overflow: hidden;
            position: relative;
        }

        #content .movieBox li > img {
            width: 200px;
            height: 30px;
            cursor: pointer;
            position: absolute;
            left: 0;
            bottom: -65px;
        }

        #content .movieBox li a {
            width: 210px;
            height: 316px;
            display: block;
        }

        #content .movieBox h3 {
            font-weight: 700;
            width: 210px;
            height: 150px;
            text-align: center;
            line-height: 50px;
            color: #eee;
            background: rgba(0, 0, 0, .5);
            font-size: 20px;
            position: absolute;
            bottom: -150px;
            left: 0;
            transition: .2s ease;
        }

        #content .movieBox li:hover {
            border: 5px solid #581F7D;
        }

        #content .movieBox li:hover h3 {
            bottom: -10px;
        }

        #content .movieBox li:hover .movieBtn {
            bottom: 10px;
        }

        #content .movieBox li:hover .movieBtn:hover {
            background-color: #eee;
            color: #333;
            cursor: pointer;

        }

        #content .movieBox li:hover .gradeBox {
            bottom: 60px;
        }

        #movieList1, #movieList2, #movieList3 {
            display: none;
        }

        #movieList1.now, #movieList2.now, #movieList3.now {
            display: block;
        }

        .movieSequence h2.now {
            border-bottom: 10px solid #581F7D;
        }

        .movieSequence h2 {
            border-bottom: 10px solid transparent;
            text-align: center;
            width: 140px;
            height: 50px;
            line-height: 50px;
            background-color: #fff;
            position: absolute;
            left: 0;
            top: 100px;
        }

        .movieSequence a {
            color: #333;
            text-decoration: none;
            font-size: 20px;
            font-weight: 700;
            display: block;
            height: 50px;
            width: 140px;
        }

        .movieSequence a:hover {
            cursor: pointer;
            color: #00BFFF;
        }

        .movieSequence h2:nth-of-type(1) {
            left: 0;
        }

        .movieSequence h2:nth-of-type(2) {
            left: 140px;
        }

        .movieSequence h2:nth-of-type(3) {
            left: 280px;
        }

        .movieSequence .movieBtn {
            width: 80px;
            height: 30px;
            position: absolute;
            bottom: -30px;
            border: none;
            border-radius: 15px;
            background-color: #581F7D;
            color: #fff;
            font: 700 16px 'Raleway', sans-serif;
        }

        .movieSequence .movieInfoBtn {
            left: 22px;
        }

        .movieSequence .bookingTicketBtn {
            right: 22px;
        }

        .movieBox .gradeBox {
            width: 185px;
            height: 30px;
            position: absolute;
            left: 10px;
            bottom: -60px;
            /*background-image: url(img/bg_star.png);*/
            background-position: 0 60px;
        }

        .starGrade1 {
            width: 38px;
            height: 30px;
            background: url(img/bg_star.png) 0 30px;
        }

        .starGrade2 {
            width: 76px;
            height: 30px;
            background: url(img/bg_star.png) 0 30px;
        }

        .starGrade3 {
            width: 114px;
            height: 30px;
            background: url(img/bg_star.png) 0 30px;
        }

        .starGrade4 {
            width: 152px;
            height: 30px;
            background: url(img/bg_star.png) 0 30px;
        }

        /*.starGrade5 {*/
        /*width: 185px;*/
        /*height: 30px;*/
        /*background-image: url(img/bg_star.png);*/
        /*background-position: 0 30px;*/
        /*}*/

        .starGrade5 {
            text-align: center;
            color: #eee;
        }


    </style>
</head>
<body>

<%@ include file="template/header.jsp" %>
<div id="content">
    <div class="movieSequence">
        <h2 class="now"><a href="#">순위별</a></h2>

        <div id="movieList1" class="movieBox now">
            <ul>
                <% for (Movie movie : movieList) {
                    switch ((int) (movie.getGrade() / 2)) {
                        case 1:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 2:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 3:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 4:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 5:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i>";
                            break;
                    }
                %>
                <li><a href="#"> <img src="<%=movie.getPoster()%>"/>

                    <h3><%=movie.getTitle()%>
                    </h3></a>

                    <div class="gradeBox">
                        <div class="starGrade5">
                            <%=htmlTag%>
                        </div>
                    </div>
                    <button class="movieBtn movieInfoBtn">상세보기</button>
                    <button class="movieBtn bookingTicketBtn">예매하기</button>
                </li>
                <%}%>
            </ul>
        </div>
        <!-- //movieList1 -->

        <h2><a href="#">개봉순</a></h2>

        <div id="movieList2" class="movieBox">
            <ul>
                <% for (Movie movie : movieList2) {
                    switch ((int) (movie.getGrade() / 2)) {
                        case 1:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 2:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 3:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 4:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 5:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i>";
                            break;
                    }
                %>
                <li><a href="#"> <img src="<%=movie.getPoster()%>"/>
                    <h3>
                        <%=movie.getTitle()%>
                    </h3></a>

                    <div class="gradeBox">
                        <div class="starGrade5">
                            <%=htmlTag%>
                        </div>
                    </div>
                    <button class="movieBtn movieInfoBtn">상세보기</button>
                    <button class="movieBtn bookingTicketBtn">예매하기</button>
                </li>
                <%}%>
            </ul>
        </div>
        <!-- //movieList2 -->

        <h2><a href="#">개봉예정</a></h2>

        <div id="movieList3" class="movieBox">
            <ul>
                <% for (Movie movie : movieList3) {
                    switch ((int) (movie.getGrade() / 2)) {
                        case 1:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 2:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 3:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 4:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star-o fa-2x\"></i>";
                            break;
                        case 5:
                            htmlTag = "<i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i><i class=\"fa fa-star fa-2x\"></i>";
                            break;
                    }
                %>
                <li><a href="#"> <img src="<%=movie.getPoster()%>"/>

                    <h3><%=movie.getTitle()%>
                    </h3></a>

                    <div class="gradeBox">
                        <div class="starGrade5">
                            <%=htmlTag%>
                        </div>
                    </div>
                    <button class="movieBtn movieInfoBtn">상세보기</button>
                    <button class="movieBtn bookingTicketBtn">예매하기</button>
                </li>
                <%}%>
            </ul>
        </div>
        <!-- //movieList3 -->
    </div>
    <!-- //movieSequence -->
</div>
<!-- //content -->

<%@include file="template/footer.jsp" %>

<script src="js/jquery.js"></script>
<script src="js/underscore.js"></script>
<script src="js/headerPopup.js"></script>

<script>
    var $h2 = $(".movieSequence h2");

    $h2.on("click", function () {
        var $this = $(this);

        $(".now").removeClass("now");
        $this.addClass("now");
        $this.next().addClass("now");
    });

    $("#header .aux li").eq(4).click(function (e) {
        e.preventDefault();
        $("#myPageBox").fadeToggle(800);
    });

</script>
</body>
</html>

