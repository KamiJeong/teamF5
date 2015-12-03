<%@ page import="com.f5.gigabox.vo.Seat" %>
<%@ page import="java.util.List" %>
<%@ page import="com.f5.gigabox.dao.SeatsDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%

    Member loginMemberForBooking = (Member) session.getAttribute("loginMember");
    if (loginMemberForBooking == null) {
        response.sendRedirect("index.jsp");
    } else {

        List<Seat> seats = SeatsDAO.getDAO().selectSeatsList(1);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>selectSeat.jsp</title>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/noto.sans.korea.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/main2.css"/>
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
            margin: 20px auto 3px auto;
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
            width: 1000px;
            height: 540px;
            border: 1px solid black;
            margin: 50px auto;
            position: relative;
        }

        .selectNum_box {
            width: 499px;
            height: 89px;
            border-right: 1px solid black;
            border-bottom: 1px solid black;
            /*background-color: yellow;*/
            line-height: 25px;
            position: relative;
        }

        .selectNum_box span {
            width: 50px;
            height: 40px;
            font-size: 18px;
            font-weight: 700;
            /*border: 1px solid black;*/
            display: block;
            text-align: right;
            line-height: 40px;
            position: absolute;
        }

        .selNormalNum_box span {
            top: 3px;
            left: 5px;
        }

        .selYoungNum_box span {
            bottom: 3px;
            left: 5px;
        }

        .selNormalNum, .selYoungNum {
            width: 400px;
            height: 40px;
            /*border: 1px solid black;*/
            position: absolute;
            line-height: 20px;
        }

        .selNormalNum button, .selYoungNum button {
            width: 40px;
            height: 40px;
            border: 1px solid black;
            background-color: ivory;
            font-size: 16px;
            font-weight: 700;
            /*line-height: 20px;*/
            cursor: pointer;
        }

        .selNormalNum button.checkedNum, .selYoungNum button.checkedNum {
            background-color: orange;
            color: #333333;
        }

        .selNormalNum button:hover, .selYoungNum button:hover {
            color: white;
            background-color: #581F7D;
        }

        .selNormalNum {
            top: 3px;
            left: 60px;
        }

        .selYoungNum {
            bottom: 3px;
            left: 60px;
        }

        .movieInfo_box {
            width: 500px;
            height: 89px;
            border-bottom: 1px solid black;
            /*background-color: orange;*/
            font-size: 30px;
            font-weight: 900;
            top: 0;
            left: 500px;
            position: absolute;
            line-height: 89px;
        }

        .movieInfo_box p {
            margin-left: 20px;
        }

        .selectSeat_box, .help_box {
            height: 450px;
            position: absolute;
            top: 90px;
        }

        .selectSeat_box {
            width: 799px;
            border-right: 1px solid black;
            background-color: rgba(0, 0, 0, 0.1);
            position: absolute;
        }

        .movieScreen {
            width: 600px;
            height: 30px;
            background-color: black;
            position: absolute;
            left: 50%;
            margin-top: 10px;
            margin-left: -300px;
            color: white;
            text-align: center;
            line-height: 30px;
        }

        .movieSeat {
            width: 600px;
            height: 350px;
            /*background-color: green;*/
            position: absolute;
            left: 50%;
            top: 50px;
            margin-top: 0;
            margin-left: -300px;
        }

        .movieSeatStep {
            width: 40px;
            height: 350px;
            /*background-color: khaki;*/
            position: relative;
            top: 50px;
            left: 50px;
        }

        .movieSeatStep div {
            width: 40px;
            height: 40px;
            color: whitesmoke;
            background-color: black;
            position: absolute;
            left: 0px;
            text-align: center;
            line-height: 40px;
        }

        .groupA {
            top: 0;
        }

        .groupB {
            top: 43px;
        }

        .groupC {
            top: 86px;
        }

        .groupD {
            top: 129px;
        }

        .groupE {
            top: 180px;
        }

        .groupF {
            top: 223px;
        }

        .groupG {
            top: 266px;
        }

        .groupH {
            top: 309px;
        }

        .movieSeat button {
            font-size: 20px;
            font-weight: 800;
            width: 40px;
            height: 40px;
            padding: 3px;
            margin: 0;
            background-color: white;
            border: 3px solid black;
            cursor: pointer;
            position: absolute;
        }

        .movieSeat button {
            background-color: lemonchiffon;
        }

        .movieSeat button:hover {
            background-color: #581F7D;
            color: white;
        }

        .movieSeat button.checked_seat {
            background-color: orange;
            color: #333333;
        }

        .movieSeat button.selected_seat {
            color: black;
            background-color: black;
            cursor: default;
        }

        .movieSeat button.recommend_seat {
            border-color: red;
        }

        /*.A1, .B1, .C1, .D1, .E1, .F1, .G1, .H1 {*/
        /*left: 35px;*/
        /*}*/

        /*.A2, .B2, .C2, .D2, .E2, .F2, .G2, .H2 {*/
        /*left: 80px;*/
        /*}*/

        /*.A3, .B3, .C3, .D3, .E3, .F3, .G3, .H3 {*/
        /*left: 190px;*/
        /*}*/

        /*.A4, .B4, .C4, .D4, .E4, .F4, .G4, .H4 {*/
        /*left: 235px;*/
        /*}*/

        /*.A5, .B5, .C5, .D5, .E5, .F5, .G5, .H5 {*/
        /*left: 280px;*/
        /*}*/

        /*.A6, .B6, .C6, .D6, .E6, .F6, .G6, .H6 {*/
        /*left: 325px;*/
        /*}*/

        /*.A7, .B7, .C7, .D7, .E7, .F7, .G7, .H7 {*/
        /*left: 370px;*/
        /*}*/

        /*.A8, .B8, .C8, .D8, .E8, .F8, .G8, .H8 {*/
        /*left: 480px;*/
        /*}*/

        /*.A9, .B9, .C9, .D9, .E9, .F9, .G9, .H9 {*/
        /*left: 525px;*/
        /*}*/

        .help_box {
            width: 200px;
            text-align: left;
            /*background-color: red;*/
            left: 800px;
        }

        .help_box ul {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 20px;
            font-weight: 700;
        }

        .help_box ul li:nth-child(2) {
            color: red;
        }

        .help_box ul li:nth-child(3) {
            color: orange;
        }

        .dummy_box {
            width: 1000px;
            height: 0;
            clear: both;
        }

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

        #btnBox a.prev {
            position: absolute;
            left: 0;
            top: 0;
        }

        #btnBox a.next {
            position: absolute;
            right: 0;
            top: 0;
        }

    </style>
</head>
<body>

<%@include file="template/header.jsp" %>
<div id="content">
    <div class="pageName">
        <h2>좌석 선택</h2>
    </div>
    <!-- 페이지 타이틀 -->
    <div class="content_box">
        <div class="selectNum_box">
            <div class="selNormalNum_box">
                <span>일반</span>

                <div class="selNormalNum">
                    <button class="checkedNum">0</button>
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                </div>
            </div>
            <!-- 일반 목록..-->
            <div class="selYoungNum_box">
                <span>청소년</span>

                <div class="selYoungNum">
                    <button class="checkedNum">0</button>
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                </div>
            </div>
            <!-- 청소년 목록..-->
        </div>
        <!-- 인원 선택 -->
        <div class="movieInfo_box">
            <p>앤트맨 / 신림 (1관 20:00)</p>
        </div>
        <!-- 선택한 영화관 및 영화 정보 -->
        <div class="selectSeat_box">
            <div class="movieScreen">
                Screen
            </div>
            <div class="movieSeatStep">
                <% for (Seat seat : seats) {%>
                <div class="group<%=seat.getColValue()%>"><%=seat.getColValue()%>
                </div>
                <%}%>
            </div>
            <div class="movieSeat">
                <% for (Seat seat : seats) {%>
                <button class="<%=seat.getColValue()%><%=seat.getRowValue()%> group<%=seat.getColValue()%>"
                        value="<%=seat.getSeatNo()%>"
                        style="left: <%=seat.getPositionX()%>px;"><%=seat.getRowValue()%>
                </button>
                <%}%>
            </div>
        </div>
        <!-- 좌석 선택 화면 -->
        <div class="help_box">
            <div>
                <h4 class="screen_out">좌석 선택 도움말</h4>
                <ul>
                    <li><i class="fa fa-square"></i>예매완료</li>
                    <li><i class="fa fa-square-o"></i>GIGABOX 추천석</li>
                    <li><i class="fa fa-square"></i>내가 선택한 자리</li>
                </ul>
            </div>
        </div>
        <!-- 좌석 선택 도움말 -->
    </div>
    <!-- 좌석 선택 박스!!-->
    <div id="btnBox">
        <a class="prev" href="selectMovie.jsp"><i class="fa fa-arrow-left"></i> 영화선택</a>
        <a class="next" href="payment.jsp">결제하기 <i class="fa fa-arrow-right"></i></a>
    </div>
    <!-- 버튼 박스 -->
</div>
<!--//content-->

<%@include file="template/footer.jsp" %>
<!--
    Javascript
-->


<script src="js/jquery.min.js"></script>
<script src="js/jquery.session.js"></script>
<!--<script src="js/selectSeat.js"></script>-->
<script>
    var $selNormalBtn = $(".selNormalNum button");
    var $selYoungBtn = $(".selYoungNum button");
    var $clickableSeat = $(".movieSeat button");
    var $checkedSeat = $(".checked_seat");
    var $movieSeatBtn = $(".movieSeat button");

    var normalNum = 0;
    var youngNum = 0;
    var totalCheckedSeat = 0;
    var totalNum = 0;

    var result = [];

    var showingNo = $.session.get('showingNo');

    setDefault();

    function setDefault() {
        $.ajax("getInfo.jsp", {
            type: "post",
            dataType: "json",
            data: {
                showingNo: showingNo
            }, error: function (xhr, error, code) {
                alert("에러라고!!");
            }, success: function (json) {
                $('.movieInfo_box p').text(json.title + " / " + json.cinemaName + " ( " + json.screenName + " " + json.movieTime + " ) ")
            }
        });
        $.ajax("getCheckedSeat.jsp", {
            type: "post",
            dataType: "json",
            data: {
                showingNo: showingNo
            }, error: function (xhr, error, code) {
                alert("에러라고!!");
            }, success: function (json) {
//                alert(json);
//                alert(json[0]);
//                alert(jQuery.inArray(42 , json));
                $movieSeatBtn.each(function () {
                    var $this = $(this);

                    for (var i = 0; i < json.length; i++) {

                        if ($this.attr("value") == json[i]) {


                            $this.addClass("selected_seat");
                        }
                    }

                });
            }
        });
    }

    //    function checkTemp() {
    //        $movieSeatBtn.each(function () {
    //            var $this = $(this);
    //            if (jQuery.inArray($this.val(), json) > -1) {
    //                $this.addClass("selected_seat");
    //            }
    //        });
    //    }

    $(".selected_seat").attr("disabled", "disabled");
    $clickableSeat.attr("disabled", "disabled");

    $("a.prev").on("click", function () {
        parent.history.back();
        return false;
    });

    // 청소년 수 선택!!
    $selYoungBtn.on("click", function (event) {
        var $this = $(this);
        var text = $this.text();
        youngNum = parseInt(text);
        if (totalNum > youngNum + normalNum) {
            $clickableSeat.removeClass("checked_seat");
            totalCheckedSeat = 0;
            alert("불편하시더라고 다시 자리를 선택해 주십시요");
        }
        totalNum = youngNum + normalNum;
//        alert(totalNum);
        if (totalNum == 0) {
            $clickableSeat.attr("disabled", "disabled");
        } else {
            $clickableSeat.prop("disabled", false);
        }

        $selYoungBtn.each(function () {
            var $this = $(this);
            var temp = $this.text();
            if (text == temp) {
                $this.addClass("checkedNum");
            } else {
                $this.removeClass("checkedNum");
            }
        })
    });
    // 일반인 수 선택!!
    $selNormalBtn.on("click", function () {
        var $this = $(this);
        var text = $this.text();
        normalNum = parseInt(text);
//        alert(totalNum);
        if (totalNum > youngNum + normalNum) {
            $clickableSeat.removeClass("checked_seat");
            totalCheckedSeat = 0;
            alert("불편하시더라고 다시 자리를 선택해 주십시요");
        }
        totalNum = youngNum + normalNum;
//        alert(totalNum);
        if (totalNum == 0) {
            $clickableSeat.attr("disabled", "disabled");
        } else {
            $clickableSeat.prop("disabled", false);
        }
        $selNormalBtn.each(function () {
            var $this = $(this);
            var temp = $this.text();
            if (text == temp) {
                $this.addClass("checkedNum");
            } else {
                $this.removeClass("checkedNum");
            }
        })
    });


    $clickableSeat.on("click", function () {
        var $this = $(this);
        var totalNum = normalNum + youngNum;

        if ($this.hasClass("selected_seat")) {
            alert("이 자리는 이미 예매가 된 자리입니다");
        } else {
            if ($this.hasClass("checked_seat")) {
                $this.removeClass("checked_seat");
                totalCheckedSeat--;
            }
            else {
                $this.addClass("checked_seat");
                totalCheckedSeat++;
            }
//            alert(totalCheckedSeat);
//            alert(totalNum);
            if (totalCheckedSeat == totalNum) {
                alert("예매하실 수 만큼 선택하셨습니다");
                $clickableSeat.attr("disabled", "disabled");
                $clickableSeat.each(function () {
                    if ($(this).hasClass("checked_seat")) {
                        $(this).prop("disabled", false);
                    }
                })
            } else {
                $clickableSeat.prop("disabled", false);
            }
            //        $(this).toggleClass("checkedSeat");
        }
    });

    $(".next").on("click", function () {
        var totalNum = normalNum + youngNum;
        if (totalNum == 0 || totalCheckedSeat != normalNum + youngNum) {
            alert("자리 선택이 완료 되지 않았습니다.");
            return false;
        }
        else {
            $(this).attr("href", "payment.jsp");
            var checkedSeat = [];
            $clickableSeat.each(function () {
                if ($(this).hasClass("checked_seat")) {
                    checkedSeat.push($(this).val());
                }
            });
            var total = (normalNum * 10000) + (youngNum * 8000);
//            alert("성인 :" + normalNum);
//            alert("청소년 :" + youngNum);
//            alert("예약하실 좌석 번호 :" + checkedSeat);
//            alert("결제하실 금액 :" + total);
            $.session.set('checkedSeat', checkedSeat);
            $.session.set('price', total);
            alert($.session.get('checkedSeat'));
            alert($.session.get('price'));
            alert($.session.get('showingNo'));
        }
    })
</script>
</body>
</html>
<%}%>