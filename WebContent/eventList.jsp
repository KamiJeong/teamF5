<%@page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@page import="com.f5.gigabox.vo.Event" %>
<%@page import="com.f5.gigabox.dao.EventsDAO" %>
<%@page import="com.f5.gigabox.util.PaginateUtil" %>
<%@page import="com.f5.gigabox.vo.Eventboard" %>
<%@page import="java.util.List" %>
<%@page import="com.f5.gigabox.dao.EventBoardsDAO" %>
<%@page import="com.f5.gigabox.vo.PagingVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    //현재 페이지
    //int now = 1;

    //넘어온 파라미터에 page가 있으면 그 페이지이니까
    //String pageNo = request.getParameter("page");
    //String eventboardNoStr = request.getParameter("eventboardNo");
    //int eventboardNo = Integer.parseInt(eventboardNoStr);

    //if (pageNo != null) //
    //	now = Integer.parseInt(pageNo);
    //}

    //한 페이지당 보여질 게시물 수
    //int numPage = 5;

    //PagingVO객체를 생성
    //PagingVO paging = new PagingVO(now, numPage);

    //BoardDAO

    //EventBoardsDAO dao = EventBoardsDAO.getDAO();
    //EventsDAO daos = EventsDAO.getDAO();

    //Eventboard eventboards = dao.selectOne(eventboardNo);

    //List얻어오기
    //List<Eventboard> list = dao.selectList(paging);
    //List<Event> lists = daos.selectList(paging);

    //ObjectMapper om = new ObjectMapper();

    //String json = om.writeValueAsString(list);

    //int numBlock = 3;

    //String href = "eventList.jsp";

    //String param = "page";

    //int total = dao.selectCount();
    //int totals = daos.selectCount();

    //페이징 뿌리기
    //String paginate = PaginateUtil.getPaginate(now, numPage, numBlock, total, href, param);
    //String paginates = PaginateUtil.getPaginate(now, numPage, numBlock, totals, href, param);

    //1페이지가 아니고 리스트의 사이즈가 0이면
    //없는 페이지이기 때문에 1페이지로 이동
    //if (now != 1 && list.size() == 0) {
    //	response.sendRedirect("index.jsp?page=1");
    //} else {
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title></title>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/noto.sans.korea.css"/>
    <link rel="stylesheet" href="css/main.css"/>


    <style>
        #content {
            width: 1000px;
            height: 1000px;
            margin: auto;
            padding-top: 80px;

            /*background: silver;*/
        }

        #content .dark {
            width: 100%;
            height: 100%;
            position: fixed;
            margin: 0;
            background: rgba(0, 0, 0, .9);
            left: 0;
            top: 0;
            display: none;
            cursor: pointer;
            z-index: 2;
        }

        #header {
            position: absolute;
            z-index: 1;
        }

        #content .popupTest {
            width: 550px;
            height: 550px;
            font-size: 23px;
            color: #fff;
            display: none;
            text-align: center;
            position: absolute;
            /*margin: auto;*/
            top: 50%;
            left: 50%;
            margin-top: 250px;
            margin-left: -250px;
            /*background:red;*/
            z-index: 3;
        }

        .pageName {
            width: 1000px;
            height: 40px;
            margin: 30px auto 3px auto;
            /*padding-bottom: 30px;*/
            /*border: 1px solid black;*/
            font-size: 30px;
        }

        .pageName h2 {
            width: 120px;
            text-align: center;
            border-bottom: 3px solid #581F7D;
        }

        .content_box {
            width: 960px;
            height: 350px;
            margin: auto;
            position: relative;
            margin-top: 50px;
        }

        .content_box h3 {
            border-right: 3px solid #581F7D;
            border-top: 3px solid #581F7D;
            text-align: center;
            width: 140px;
            height: 49px;
            line-height: 49px;
            margin: 0 0;
            padding: 0;
            position: absolute;
            background: #581F7D;
        }

        .content_box h3:nth-of-type(1) {
            left: 0;
            top: 0;
        }

        .content_box h3:nth-of-type(2) {
            left: 140px;
            top: 0;
        }

        .content_box h3.now a {
            background: #fff;
            color: #581F7D;
            border-bottom: 2px solid #fff;
        }

        .content_box h3 a {
            width: 140px;
            height: 47px;
            display: block;
            text-decoration: none;
            color: #fff;
        }

        .content_box h3:first-child {
            border-left: 2px solid #581F7D;
        }

        /* item : 이미지 슬라이드 사진들이 출력되는 영역 */
        #item {
            width: 980px;
            height: 450px;
            margin: auto;
            position: relative;
            /*background :blue;*/
            /*margin-bottom: 60px;
                         /*background-image: url(img/the_throne_bigbanner_web_00.png);*/
            overflow: hidden;
        }

        /* imgBox : 이미지 슬라이드 사진 리스트들이 담겨져 있는 영역 */
        #imgBox {
            width: 4900px;
            position: absolute;
            transition: .2s ease;
            top: 50px;
            left: 0;
        }

        #imgBox img {
            float: left;
            cursor: pointer;
        }

        #prevBtn, #nextBtn {
            background-color: transparent;
            width: 120px;
            height: 120px; /* 대체되는 요소*/
            overflow: hidden;
            cursor: pointer;
            border: none;
            position: absolute;
            top: 165px; /* width의 절반-버튼크기의 절반*/
            color: #BDBDBD;
            font-size: 60px;
        }

        #nextBtn {
            right: 0;
        }

        #prevBtn:hover, #nextBtn:hover {
            color: #fff;
        }

        #slideDot li:hover {
            cursor: pointer;
        }

        #slideDot li:nth-child(1) {
            position: absolute;
            display: inline-block;
            vertical-align: middle;
            bottom: 20px;
            left: 440px;
        }

        #slideDot li:nth-child(2) {
            position: absolute;
            display: inline-block;
            vertical-align: middle;
            bottom: 20px;
            left: 460px;
        }

        #slideDot li:nth-child(3) {
            position: absolute;
            display: inline-block;
            vertical-align: middle;
            bottom: 20px;
            left: 480px;
        }

        #slideDot li:nth-child(4) {
            position: absolute;
            display: inline-block;
            vertical-align: middle;
            bottom: 20px;
            left: 500px;
        }

        #slideDot li:nth-child(5) {
            position: absolute;
            display: inline-block;
            vertical-align: middle;
            bottom: 20px;
            left: 520px;
        }

        #slideDot li {
            display: block;
            background: #333;
            text-indent: -9999px;
            width: 16px;
            height: 16px;
            margin: 4px;
            /*css3*/
            border-radius: 50%;
            box-shadow: 0 0 1px #fff;
            transition: .2s ease;
        }

        #progress_box, #prize_box {
            width: 960px;
            min-height: 300px;
            border: 2px solid #581F7D;
            padding-bottom: 15px;
            padding-top: 15px;
            position: absolute;
            left: 0;
            top: 50px;
            display: none;
        }

        .progress img {
            cursor: pointer;
        }

        #progress_box.now, #prize_box.now {
            display: block;
        }

        #progress_box table, #prize_box table {
            width: 900px;
            margin: auto;
        }

        .progressEvent tr {
            /*border-left: 2px solid #581F7D;

            border-bottom: 2px solid #581F7D;
            border-top: 2px solid #581F7D;*/
            height: 40px;
            border-right: 2px solid #581F7D;
        }

        .progressEvent .trTop {
            border-top: 2px solid #581F7D;
            border-left: 2px solid #581F7D;
        }

        .progressEvent td {
            border-left: 2px solid #581F7D;
            border-right: 2px solid #581F7D;
            vertical-align: middle;
            text-align: center;
            margin: auto;

        }

        .tdFirst {
            background-color: #581F7D;
        }

        .progressEvent td:nth-child(1) {
            width: 80px;
        }

        .progressEvent td:nth-child(2) {
            width: 390px;
        }

        .box_paginateEvent {
            border-bottom: 2px solid #581F7D;
            border-top: 2px solid #581F7D;
        }

        .prizeWinner th {
            border-left: 2px solid #581F7D;
            border-right: 2px solid #581F7D;
        }

        .prizeWinner tr {
            border-bottom: 2px solid #581F7D;
            border-top: 2px solid #581F7D;
        }

        .prizeWinner td {
            border-left: 2px solid #581F7D;
            border-right: 2px solid #581F7D;

            text-align: center;
            line-height: 47px;
        }

        .prizeWinner td > a {
            text-align: center;
            line-height: 47px;
            width: 240px;
            text-decoration: none;
        }

        .prizeWinner td:nth-child(1) {
            width: 50px;
        }

        .prizeWinner td:nth-child(2) {
            width: 400px;
        }

        .prizeWinner td:nth-child(3), td:nth-child(5) {
            width: 100px;
        }

        .prizeWinner td:nth-child(4) {
            width: 200px;
        }

        /*
        .prizeWinner {
            padding: 20px;
            width: 240px;
            height: 47px;
            display: block;
            text-decoration: none;
            color: #fff;
        }
        */

        /*
        페이징 CSS
        */
        .paginate, .paginates {
            font-size: 14px;
            text-align: center;
            height: 54px;
            line-height: 54px;
            font-weight: 500;
        }

        .paginate a, .paginates a, .paginate span, .paginates span, .paginate strong,
        .paginates strong {
            color: #858585;
            text-decoration: none;
            padding: 0 22px;
            border: 1px solid transparent;
            transition: .1s ease;
            display: inline-block;
        }

        .paginate span, .paginates span {
            border-color: #E1E1E1;
            cursor: not-allowed;
            color: #ededed;
        }

        .paginate a:hover, .paginates a:hover {
            background: #463a84;
            border-color: #E1E1E1;
            font-weight: 900;
            color: #fff;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .paginate strong, .paginates strong {
            background: #251F39;
            border-color: #251F39;
            color: #fff;
            cursor: not-allowed;
            font-weight: 900;
        }

        /*
        비활성화
        */
        .paginate
        span
        .next,
        .paginates
        span
        .next,
        .paginate
        span
        .prev,
        .paginates
        span
        .prev,
        {
            border-color: #E1E1E1;
            color: #E1E1E1;
            cursor: default;
            cursor: not-allowed;
        }

        #footer {
            margin-top: 250px;
        }

        #loader {
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, .5);
            position: fixed;
            left: 0;
            top: 0;
            background-image: url(img/ajax-loader.gif);
            background-repeat: no-repeat;
            background-position: center;
            /*
             * 기본으로 숨겼다가
             */
            display: none;
        }


    </style>
</head>
<body>
<%@include file="template/header.jsp" %>
<div id="content">
    <div class="dark"></div>
    <div class="popupTest"></div>
    <div class="pageName">
        <h2>이벤트</h2>
    </div>
    <div id="imageSlider">
        <div id="item">
            <div id="imgBox">
                <ul class="imageBox">
                    <li><img src="img/the_throne_bigbanner_web_00.png" alt="사도"
                             title="사도"/></li>
                    <li><img src="img/web_bigbanner_0911_03.png" alt="탐정"/></li>
                    <li><img src="img/big2.png" alt="주문형 극장"/></li>
                    <li><img src="img/CJ_20th_big2.png" alt="TOP20"/></li>
                    <li><img src="img/kakao_big_web_02.png" alt="카카오"/></li>
                </ul>
            </div>

            <button type="button" id="prevBtn" title="이전">
                <i class="fa fa-angle-double-left fa-2x"></i>
            </button>
            <button type="button" id="nextBtn" title="다음">
                <i class="fa fa-angle-double-right fa-2x"></i>
            </button>
            <div id="slideDot">
                <ol>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                </ol>
            </div>
            <!--slideDot end-->
        </div>
        <!--item end-->
    </div>
    <!-- imageSlider end-->

    <form action="#" method="post">
        <fieldset>
            <legend class="screen_out"> 이벤트 필드</legend>
            <div class="content_box">
                <h3 class="now">
                    <a href="#">진행중인 이벤트</a>
                </h3>

                <div id="progress_box" class="now">
                    <div class="progressEvent">
                        <table border="2">
                            <tbody class="progress">


                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="5" class="box_paginateEvent"></td>
                            </tr>
                            </tfoot>
                        </table>


                    </div>
                    <!-- progressEvent end-->


                </div>
                <!-- progress_box end-->


                <h3 class="end">
                    <a href="#">당첨자 발표</a>
                </h3>

                <div id="prize_box">
                    <div class="prizeWinner">
                        <table border="2">
                            <thead>
                            <tr>
                                <th>No</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>날짜</th>
                                <th>조회수</th>
                            </tr>
                            </thead>
                            <tbody class="winner">


                            </tbody>

                            <tfoot>
                            <tr>
                                <td colspan="5" class="box_paginateWinner"></td>
                            </tr>
                            </tfoot>
                        </table>

                    </div>
                    <!-- prizeWinner end-->

                </div>
                <!-- prize_box -->

            </div>
            <!--content_box end-->

        </fieldset>
    </form>
</div>
<!--content-->
<div id="loader"></div>
<%@include file="template/footer.jsp" %>
<script src="js/jquery.js"></script>
<script src="js/underscore.js"></script>
<script src="js/headerPopup.js"></script>
<script type="text/template" id="progressTmp" charset="UTF-8">
    <@ $(progress).each(function(){ @>
    <tr height="50" class="trTop">
        <td rowspan="2" class="tdFirst"><img class="imageClass" src="thumbnail/<@=this.image@>"
                                             title="<@=this.contents@>"></td>
        <td>이벤트 이름 : <@=this.title@></td>
        <td>주최 : <@=this.writer@></td>
    </tr>
    <tr class="trBottom">
        <td>기간 : <@=this.startDate@> ~ <@=this.endDate@></td>
        <td>등록날짜 : <@=this.regdate@></td>
    </tr>
    <@})@>
</script>
<script type="text/template" id="winnerTmp" charset="UTF-8">
    <@ $(winner).each(function(){ @>
    <tr class="winnerTr">
        <td><@=this.eventboardNo @></td>
        <td><a href="#" data-name="<@=this.eventboardNo @>"> <@=this.title@> </a></td>
        <td><@=this.writer@></td>
        <td><@=this.regdate@></td>
        <td><@=this.hits@></td>
    </tr>
    <@})@>
</script>
<script type="text/template" id="contentTmp" charset="UTF-8">
    <tr class="openContents">
        <td colspan="5"><@=contents @></td>
    </tr>
</script>
<script type="text/template" id="progressEventContentTmp" charset="UTF-8">
    <%--<@alert(eventData);@>--%>
    <img src="<@=eventData.image@>" alt=""/>
    <div><@=eventData.contents@></div>
</script>
<script>
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@(.+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };

    var ePage = 1, bPage = 1;

    $loader = $("#loader"),

            $imgBox = $("#imgBox"), idx = 0, startpoint = 0,
            $nextBtn = $("#nextBtn"), $prevBtn = $("#prevBtn");

    startPoint();

    function startPoint() {
        if (startpoint == idx) {
            $("#slideDot li:eq(0)").css("background-color", "#eee");

        }
    }

    /* 이미지 슬라이드 이전 버튼 */
    $prevBtn.click(function () {

        if (idx == 0) {
            idx = 4;
            $imgBox.css("left", -(idx * 980));
            $("#slideDot li:eq(0)").css("background-color", "#333");

        } else {
            --idx;
            $imgBox.css("left", -(idx * 980));
        }

        $("#slideDot li:eq(" + idx + ")").css("background-color", "#eee");
        $("#slideDot li:eq(" + (idx + 1) + ")").css("background-color",
                "#333");

    });

    /* 이미지 슬라이드 다음 버튼 */
    $nextBtn.click(function () {
        ++idx;
        $("#slideDot li:eq(" + idx + ")").css("background-color", "#eee");
        $("#slideDot li:eq(" + (idx - 1) + ")").css("background-color",
                "#333");

        $imgBox.css("left", -(idx * 980));
        if (idx == 5) {
            idx = 0;

            $imgBox.css("left", -(idx * 980));
            $("#slideDot li:eq(4)").css("background-color", "#333");
            $("#slideDot li:eq(0)").css("background-color", "#eee");

        }

    });
    // $("#slideDot li").css("background-color",blue);

    $("#slideDot li").click(
            function () {

                idx = $(this).index();

                $imgBox.css("left", -((idx) * 980));

                $("#slideDot li:eq(" + (idx - 3) + ")").css(
                        "background-color", "#333");
                $("#slideDot li:eq(" + (idx - 4) + ")").css(
                        "background-color", "#333");
                $("#slideDot li:eq(" + (idx - 2) + ")").css(
                        "background-color", "#333");
                $("#slideDot li:eq(" + (idx - 1) + ")").css(
                        "background-color", "#333");
                $("#slideDot li:eq(" + (idx) + ")").css("background-color",
                        "#eee");
                $("#slideDot li:eq(" + (idx + 1) + ")").css(
                        "background-color", "#333");
                $("#slideDot li:eq(" + (idx + 2) + ")").css(
                        "background-color", "#333");
                $("#slideDot li:eq(" + (idx + 3) + ")").css(
                        "background-color", "#333");
                $("#slideDot li:eq(" + (idx + 4) + ")").css(
                        "background-color", "#333");

                clearInterval(myVar);
            });

    var $h3 = $(".content_box h3");

    $h3.click(function (e) {

        e.preventDefault();
        //a태그 링크 막음?
        var $this = $(this);

        $(".now").removeClass("now");

        $this.addClass("now");

        $this.next().addClass("now");

    });

    startInterval();

    /* 자동 슬라이드 2초 간격 , 아직 첫번째 슬라이드 트랜지션 미적용*/
    function startInterval() {
        var myVar = setInterval(function () {
            ++idx;
            $imgBox.css("left", -(idx * 980));
            $("#slideDot li:eq(" + idx + ")").css("background-color",
                    "#eee");
            $("#slideDot li:eq(" + (idx - 1) + ")").css("background-color",
                    "#333");
            if (idx == 5) {
                idx = 0;

                $imgBox.css("left", -(idx * 980));
                $("#slideDot li:eq(4)").css("background-color", "#333");
                $("#slideDot li:eq(0)").css("background-color", "#eee");

            }
        }, 2000);
    }

    //ajax 부분!

    //progressEvent : 진행중인 이벤트
    $(".progressEvent").on("click", "a", function (e) {

        e.preventDefault();

        ePage = $(this).attr("title");
        var $this = $(this);

        getEvents();

    });

    function getEvents() {

        $.ajax("getEvents.jsp", {
            type: "post",
            dataType: "json",
            data: {
                page: ePage
            },
            error: function (xhr, error, code) {
                alert(code);
            },
            success: function (json) {

                console.log(json.list);

                $(".progressEvent tbody").empty();
                $(".box_paginateEvent").html(json.paginate);

                /////
                var templatePlaceCode = $("#progressTmp").html();

                var tmpPlace = _.template(templatePlaceCode);

                var mockupPlace = tmpPlace({
                    progress: json.list
                });
                $("tbody.progress").html(mockupPlace);
            }
        });
    }

    getEvents();

    var index = 0;

    $(".prizeWinner").on("click", ".winner a", function (e) {
        //$loader.show();
        e.preventDefault();
        var $this = $(this);
        index = $this.attr("data-name");
        //alert(index);
        //$("popup .content h3").text();
        //$popup.show();

        var $tr = $this.parents("tr");

        getEventContents($tr);

    });

    function getEventContents($tr) {

        $.ajax("eventContents.jsp", {
            type: "post",
            dataType: "json",
            data: {
                no: index
            },
            error: function (xhr, error, code) {
                alert(code);
            },
            success: function (json) {

                console.log(json.list);

                var templatePlaceCode = $("#contentTmp").html();

                var tmpPlace = _.template(templatePlaceCode);

                var mockupPlace = tmpPlace({
                    contents: json.result
                });
                //alert(tmpPlace);

                $(".openContents").remove();
                $tr.after(mockupPlace);

                $(".openContents").click(function () {
                    $(".openContents").remove();
                });

            }
        });

    }

    //prizeWinner : 당첨자 발표
    $(".prizeWinner").on("click", ".paginate a", function (e) {

        e.preventDefault();

        bPage = $(this).attr("title");

        getEventBoards();
    });

    getEventBoards();

    function getEventBoards() {

        $.ajax("getEventboards.jsp", {
            type: "post",
            dataType: "json",
            data: {
                page: bPage
            },
            error: function (xhr, error, code) {
                alert(code);
            },
            success: function (json) {

                console.log(json.list);

                $(".prizeWinner tbody").empty();
                $(".box_paginateWinner").html(json.paginate);

                /////
                var templatePlaceCode = $("#winnerTmp").html();

                var tmpPlace = _.template(templatePlaceCode);

                var mockupPlace = tmpPlace({
                    winner: json.list
                });
                $("tbody.winner").html(mockupPlace);

            }
        });

    }

    var $popupTest = $(".popupTest");
    //ajax underscore template로 받았기 때문에 on~
    $("body").on("click", ".progress img", function () {
        $(".dark").show();
        $popupTest.show();
        var img = $(this).attr("src");
        var temp = img.substring(10);


        $.ajax("progressEventContents.jsp", {
            type: "post",
            dataType: "json",
            data: {
                img: temp

            },
            error: function (xhr, error, code) {
                //alert(xhr.responseText);
                alert(error);
            },
            success: function (json) {
                //console.log(json.list);

                var templatePlaceCode = $("#progressEventContentTmp").html();

                var tmpPlace = _.template(templatePlaceCode);

                var mockupPlace = tmpPlace({
                    eventData: json
                });
                //alert(json.result);
                $popupTest.html(mockupPlace);
            }

        });

    });

    $(".dark").on("click", function () {
        $(this).hide();
        $(".popupTest").hide();
    });
</script>
</body>
</html>
