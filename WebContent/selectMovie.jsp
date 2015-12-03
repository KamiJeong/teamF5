<%@ page import="com.f5.gigabox.vo.ShowingVO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.f5.gigabox.dao.ShowingDAO" %>
<%@ page import="com.f5.gigabox.vo.City" %>
<%@ page import="com.f5.gigabox.dao.CitiesDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    Member loginMemberForBooking = (Member) session.getAttribute("loginMember");
    if (loginMemberForBooking == null) {
        response.sendRedirect("index.jsp");
    } else {

        List<ShowingVO> showing = ShowingDAO.getDAO().selectShowingList();
        List<City> cities = CitiesDAO.getDAO().selectCitiesList();

        Calendar today = Calendar.getInstance();

        int currentYear = today.get(Calendar.YEAR);
        int currentMonth = today.get(Calendar.MONTH) + 1;
        int currentDay = today.get(Calendar.DATE);
        int lastDayOnMonth = today.getActualMaximum(Calendar.DAY_OF_MONTH);
        int test = today.get(Calendar.DAY_OF_WEEK);
        String position = "0";

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>selectMovie.jsp</title>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/noto.sans.korea.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <style>

        #content {
            width: 1000px;
            height: 800px;
            margin: auto;
            padding-top: 80px;
            /*background: silver;*/
        }

        .pageName {
            width: 1000px;
            height: 40px;
            margin: 3px auto 3px auto;
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
            width: 998px;
            height: 540px;
            border: 1px solid black;
            margin: 50px auto;
            position: relative;
        }

        .column {
            height: 40px;
        }

        .column > h3 {
            height: 40px;
            font-size: 25px;
            font-weight: 600;
            line-height: 40px;
            text-align: center;
            color: white;
            background-color: #581F7D;
        }

        .list_option {
            height: 30px;
            border-bottom: 1px solid black;
            border-top: 1px solid black;
            text-align: right;
            position: relative;
        }

        .list_option span {
            font-size: 13px;
            padding: 0 4px 0 4px;
            /*background-color: cyan;*/
            position: absolute;
            right: 0;
            bottom: 0;
        }

        .movie_box, .theater_box, .time_box, .date_box {
            height: 540px;
            position: absolute;
            top: 0;
        }

        .movie_box {
            width: 299px;
            border-right: 1px solid black;
            /*background-color: khaki;*/
            left: 0;
        }

        .movie_box li {
            width: 295px;
            height: 40px;
            margin: 2px auto 0 auto;
            border: 1px solid transparent;
        }

        .movie_box button {
            width: 295px;
            height: 40px;
            color: #581F7D;
            background-color: white;
            border: none;
            position: relative;
            cursor: pointer;
            font: 300 15px bon, sans-serif;
        }

        .movie_box button:hover {
            color: white;
            background-color: #581F7D;
        }

        .movie_box li .pgImage {
            font-size: 10px;
            width: 36px;
            height: 36px;
            text-indent: -999px;
            padding: 0;
            line-height: 18px;
            position: absolute;
            left: 10px;
            top: 50%;
            margin-top: -18px;
            background-image: url("/img/pg.png");
            background-size: 144px 36px;
            overflow: hidden;

        }

        .movie_box li span {
            width: 200px;
            height: 40px;
            /*background-color: lawngreen;*/
            font-size: 20px;
            font-weight: 700;
            line-height: 40px;
            text-align: left;
            display: block;
            position: absolute;
            top: 0;
            left: 60px;
        }

        .theater_box {
            width: 299px;
            border-right: 1px solid black;
            /*background-color: yellow;*/
            left: 300px;
        }

        .theater_box button:hover {
            color: white;
            background-color: #581F7D;
        }

        .list_cityWithPlace {
            width: 299px;
            height: 468px;
            /*background-color: ivory;*/
            position: relative;
        }

        .city_box {
            width: 119px;
            height: 468px;
            border-right: 1px solid black;
            /*background-color: lightblue;*/
            position: absolute;
            left: 0;
            top: 0;
        }

        .city_box button:hover {
            color: white;
            background-color: #581F7D;
        }

        .city_box ul {
            width: 119px;
            height: 468px;
        }

        .city_box li {
            width: 110px;
            height: 40px;
            margin: 2px auto 0 auto;
            border: 1px solid transparent;
            /*background-color: lightsalmon;*/
        }

        .city_box li button {
            width: 110px;
            height: 40px;
            border: none;
            cursor: pointer;
            line-height: 40px;
            color: #581F7D;
            background-color: white;
            font: 300 15px bon, sans-serif;
        }

        .place_box {
            width: 179px;
            height: 468px;
            /*background-color: lightcoral;*/
            position: absolute;
            right: 0;
            top: 0;
        }

        .place_box ul {
            width: 179px;
            height: 468px;
        }

        .place_box li {
            width: 169px;
            height: 40px;
            margin: 2px auto 0 auto;
            border: 1px solid transparent;
            /*background-color: lightsalmon;*/
        }

        .place_box li button {
            width: 169px;
            height: 40px;
            border: none;
            cursor: pointer;
            line-height: 40px;
            color: #581F7D;
            background-color: white;
            font: 300 15px bon, sans-serif;
        }

        .date_box {
            width: 99px;
            border-right: 1px solid black;
            /*background-color: greenyellow;*/
            left: 600px;
        }

        .dateYear_box {
            width: 99px;
            height: 30px;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            font-size: 24px;
            font-weight: 700;
            line-height: 30px;
            text-align: center;
            /*background-color: tomato;*/
        }

        .dateMonth_box {
            width: 99px;
            height: 42px;
            border-bottom: 1px solid black;
            font-size: 22px;
            font-weight: 700;
            line-height: 42px;
            text-align: center;
            /*background-color: yellow;*/
        }

        .dateDay_box {
            width: 99px;
            height: 421px;
            /*background-color: lightpink;*/
        }

        .dateDay_box ul {
            width: 99px;
            height: 421px;
            margin: 0;
            padding: 2px 0 2px 0;
            /*background-color: lavender;*/
        }

        .dateDay_box li {
            width: 90px;
            height: 40px;
            margin: 2px auto 0 auto;
            border: 1px solid transparent;
            /*background-color: lightsalmon;*/
        }

        .dateDay_box li button {
            width: 90px;
            height: 40px;
            border: none;
            cursor: pointer;
            line-height: 40px;
            color: #581F7D;
            background-color: white;
            font: 300 15px bon, sans-serif;
        }

        .dateDay_box button:hover {
            color: white;
            background-color: #581F7D;
        }

        .time_box {
            width: 298px;
            /*background-color: orange;*/
            left: 700px;
        }

        .time_box h4 {
            width: 298px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            font-size: 17px;
            font-weight: 400;
            /*background-color: lavender;*/
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }

        .time_list {
            background-color: white;
        }

        .time_list ul {
            width: 298px;
            padding-top: 4px;
        }

        .time_list li {
            width: 280px;
            height: 30px;
            margin: 4px auto 0 auto;
            text-align: center;
            /*background-color: orange;*/
            /*display: inline-block;*/
            border: 1px solid black;
        }

        .time_list li button {
            width: 280px;
            height: 30px;
            text-align: center;
            border: none;
            color: #581F7D;
            background-color: white;
            cursor: pointer;
            font: 700 18px bon, sans-serif;
        }

        .time_list button:hover {
            color: white;
            background-color: #581F7D;
        }

        .dummy_box {
            width: 1000px;
            height: 0;
            clear: both;
        }

        /* .clicked class for button */
        body .content_box .clicked {
            color: white;
            background-color: black;
        }

        /* button box */
        #btnBox {
            width: 1000px;
            height: 80px;
            margin: auto;
            /*background-color: yellow;*/
            position: relative;
        }

        #btnBox a {
            padding: 10px 25px 10px 25px;
            border: 1px solid black;
            font-size: 18px;
            font-weight: 700;
            color: white;
            background-color: #581F7D;
            cursor: pointer;
            text-decoration: none;
        }

        #btnBox a.disabled {
            background-color: gray;
            cursor: default;
        }

        #btnBox a.next {
            position: absolute;
            right: 0;
            top: 0;
        }

        li.noData {
            font-size: 20px;
            font-weight: 700;
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="template/header.jsp" %>
<div id="content">
    <div class="pageName">
        <h2>영화 선택</h2>
    </div>
    <!-- 페이지 타이틀 -->
    <div class="content_box">
        <h2 class="screen_out">영화 선택 박스</h2>

        <div class="movie_box">
            <div class="column">
                <h3>영 화</h3>
            </div>
            <div class="list_option">
                <span>가나다순</span>
            </div>
            <div>
                <h4 class="screen_out">상영 영화 목록</h4>
                <ul>
                    <% if (showing.size() == 0) { %>
                    <li class="noData">
                        죄송해요! 영화관이 망했어요 T_T....
                    </li>
                    <% } %>
                    <% for (ShowingVO showingVO : showing) { %>
                    <li>
                        <button value="<%=showingVO.getTitle()%>">
                            <% switch (showingVO.getPg()) {
                                case "전체":
                                    position = "0";
                                    break;
                                case "12세":
                                    position = "-36px";
                                    break;
                                case "15세":
                                    position = "-72px";
                                    break;
                                case "18세":
                                    position = "-108px";
                                    break;
                            }%>
                            <span class="pgImage"
                                  style="background-position-x: <%=position%>;"><%=showingVO.getPg()%>관람가</span>
                            <span><%=showingVO.getTitle()%></span>
                        </button>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
        <!-- 영화 선택 -->
        <div class="theater_box">
            <div class="column">
                <h3>극 장</h3>
            </div>
            <div class="list_option">
                <span>가나다순</span>
            </div>
            <div class="list_cityWithPlace">
                <div class="city_box">
                    <h4 class="screen_out">도시 목록</h4>
                    <ul>
                        <% if (cities.size() == 0) { %>
                        <li>
                            도시가 모두 무너졌습니다!
                        </li>
                        <% } %>
                        <% for (City city : cities) { %>
                        <li>
                            <button value="<%=city.getCityNo()%>"><%=city.getName()%>
                            </button>
                        </li>
                        <% } %>
                    </ul>
                </div>
                <div class="place_box">
                    <h4 class="screen_out">극장 목록</h4>
                    <ul>
                        <%-- 극장 목록 --%>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 극장 선택 -->
        <div class="date_box">
            <div class="column">
                <h3>날 짜</h3>
            </div>
            <div class="dateYear_box">
                <h4><%=currentYear%>
                </h4>
            </div>
            <div class="dateMonth_box">
                <h4><%=currentMonth%>
                </h4>
            </div>
            <div class="dateDay_box">
                <h5 class="screen_out">예약 날짜 목록</h5>
                <ul>
                    <% for (int i = 0; i < 9; i++) {
                        int year = currentYear;
                        int month = currentMonth;
                        int day = currentDay + i;
                        if (day > lastDayOnMonth) {
                            day = day - lastDayOnMonth;
                            month = month + 1;
                        }
                        if (month > 12) {
                            year = year + 1;
                        }

                        int temp = test + i;
                        String todayDate = null;
                        if (temp > 7) {
                            temp = temp - 7;
                        }
                        switch (temp) {
                            case 1:
                                todayDate = "일";
                                break;
                            case 2:
                                todayDate = "월";
                                break;
                            case 3:
                                todayDate = "화";
                                break;
                            case 4:
                                todayDate = "수";
                                break;
                            case 5:
                                todayDate = "목";
                                break;
                            case 6:
                                todayDate = "금";
                                break;
                            case 7:
                                todayDate = "토";
                                break;
                        }
                    %>
                    <li>
                        <button value="<%=year%> <%=month%> <%=day%>"><span><%=todayDate%></span> <%=day%>
                        </button>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
        <!-- 날짜 선택 -->
        <div class="time_box">
            <div class="column">
                <h3>시 간</h3>
            </div>
            <div>
                <h4>상영관</h4>
            </div>
            <div class="time_list">
                <h4 class="screen_out">상영 시간 목록</h4>
                <ul>
                </ul>
            </div>
        </div>
        <!-- 시간 선택 -->
    </div>
    <!-- 영화 선택 박스 -->
    <div id="btnBox">
        <a class="next disabled" href="">좌석선택 <i
                class="fa fa-arrow-right"></i></a>
    </div>
    <!-- 버튼 박스 -->
</div>
<!--//content-->
<%@include file="template/footer.jsp" %>

<!--

Javascript

-->
<script src="js/jquery.min.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/jquery.session.js"></script>
<!-- Template For .place_box -->
<script type="text/template" id="placesTmp" charset="UTF-8">
    <@ if(places.length==0){@>
    <li class="noData">
        죄송합니다. 준비중입니다.
    </li>
    <@}@>
    <@ $(places).each(function(){@>
    <li>
        <button value="<@=this.cinemaNo@>">
            <@=this.name@>
        </button>
    </li>
    <@})@>
</script>

<!-- Template For .time_box -->
<script type="text/template" id="timesTmp" charset="UTF-8">
    <@ if(times.length==0){@>
    <li class="noData">
        죄송합니다. 준비중입니다.
    </li>
    <@}@>
    <@ $(times).each(function(){@>
    <li class="hasData">
        <button value="<@=this.showingNo@>" data-name="<@=this.screenNo@>">
            <@=this.screenName@> <@=this.showingNth@>회 <@=this.movieTime@>
        </button>
    </li>
    <@})@>
</script>

<script>
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@(.+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };
    var year;
    var month;
    var date;
    var temp = "";

    var $movieBtn = $(".movie_box button");
    var $cityBtn = $(".city_box button");
    var $dateDayBtn = $(".dateDay_box button");
    var $timeBtn = $(".time_box button");
    var $nextBtn = $("a.next");

    var cinemaNo = "";
    var title = "";
    var showingNo = "";

    $nextBtn.on("click", function (e) {
        e.preventDefault();
        if ($(this).hasClass("disabled")) {
            return false;
        } else {
            if (showingNo == "") {
                return false;
            }
            else {
                window.location.href = $(this).attr("href");
                $.session.set('showingNo', showingNo);
//                alert($.session.get('showingNo'));
            }
        }
    });

    $movieBtn.on("click", function () {
        var $this = $(this);
        var val = $this.val();
        //        alert(val);
        $movieBtn.each(function () {
            var $this = $(this);
            var value = $this.val();
            if (val == value) {
                $this.addClass("clicked");
                title = value;
                getTimeStamp();
            } else {
                $this.removeClass("clicked");
            }
        })
    });

    $cityBtn.on("click", function () {
        var $this = $(this);
        var val = $this.val();
        //        alert(val);
        $cityBtn.each(function () {
            var $this = $(this);
            var value = $this.val();
            if (val == value) {
                $this.addClass("clicked");
                $dateDayBtn.each(function () {
                    var $this = $(this);
                    $this.removeClass("clicked");
                });
                $(".time_list ul").empty();
                $nextBtn.addClass("disabled");
                temp = "";
                $.ajax("getPlace.jsp", {
                    type: "post",
                    dataType: "json",
                    data: {
                        cityNo: value
                    }, error: function (xhr, error, code) {
                        alert("에러라고!!");
                    }, success: function (json) {
                        setPlaceList(json);
                    }
                });
            } else {
                $this.removeClass("clicked");
            }
        })
    });

    //문제감이로다...
    $(".place_box").on("click", "button", function () {
        var $this = $(this);
        var val = $this.val();
        //alert(val);
        var $placeBtn = $(".place_box button");
        $placeBtn.each(function () {
            var $this = $(this);
            var value = $this.val();
            if (val == value) {
                $this.addClass("clicked");
                cinemaNo = value;
                $(".time_list ul").empty();
                getTimeStamp();
            } else {
                $this.removeClass("clicked");
            }
        })
    });

    $dateDayBtn.on("click", function () {
        var $this = $(this);
        var val = $this.val();
        //alert(val);
        $dateDayBtn.each(function () {
            var $this = $(this);
            var value = $this.val();
            if (val == value) {
                var tempTxt = $this.val();
                year = tempTxt.substring(0, 4);

                if (tempTxt.charAt(6) == " ") {
                    month = "0" + tempTxt.charAt(5);
                    if (tempTxt.length == 8) {
                        date = "0" + tempTxt.charAt(7);
                    } else {
                        date = tempTxt.substring(7);
                    }
                } else {
                    month = tempTxt.substring(5, 7);
                    if (tempTxt.length == 9) {
                        date = "0" + tempTxt.charAt(8);
                    } else {
                        date = tempTxt.substring(8);
                    }
                }

                temp = year + "-" + month + "-" + date;
//                alert(temp);
                $this.addClass("clicked");
                $(".time_list ul").empty();
                getTimeStamp();
            } else {
                $this.removeClass("clicked");
            }
        })
    });

    $(".time_box").on("click", "button", function () {
        var $this = $(this);
        var val = $this.val();
        //alert(val);
        var $timeBtn = $(".time_box button");
        $timeBtn.each(function () {
            var $this = $(this);
            var value = $this.val();
            var url = "selectSeat.jsp";
            if (val == value) {
                $this.addClass("clicked");
                showingNo = value;
                $nextBtn.removeClass("disabled");
                var screenNo = $this.attr("data-name");
                url = url + "?screenNo=" + screenNo;
                $nextBtn.attr("href", url);
            } else {
                $this.removeClass("clicked");
            }
        })
    });

    function setPlaceList(json) {
        var city = json;
        //alert(City);
        var templatePlaceCode = $("#placesTmp").html();

        var tmpPlace = _.template(templatePlaceCode);

        var mockupPlace = tmpPlace({places: city});

        $(".place_box ul").html(mockupPlace);
    }

    function setTimeList(json) {
        var timeList = json;
        var templateTimeCode = $("#timesTmp").html();

        var tmpTime = _.template(templateTimeCode);

        var mockupTime = tmpTime({times: timeList});
        $(".time_list ul").html(mockupTime);
    }

    function getTimeStamp() {
        $nextBtn.addClass("disabled");
        if (cinemaNo != "" && title != "" && temp != "") {
            $.ajax("getTime.jsp", {
                type: "post",
                dataType: "json",
                data: {
                    cinemaNo: cinemaNo,
                    title: title,
                    temp: temp
                }, error: function (xhr, error, code) {
                    alert("에러라고!!");
                }, success: function (json) {
                    setTimeList(json);
                }
            });
        }
    }
</script>
</body>
</html>
<%}%>