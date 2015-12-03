<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%

    Member loginMemberForBooking = (Member) session.getAttribute("loginMember");
    if (loginMemberForBooking == null) {
        response.sendRedirect("index.jsp");
    } else {

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>payment.jsp</title>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/noto.sans.korea.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <style>

        #content {
            width: 1000px;
            height: 600px;
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
            width: 580px;
            height: 200px;
            margin: 50px auto;
            position: relative;
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
            z-index: 1;
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

        .content_box a {
            width: 140px;
            height: 47px;
            display: block;
            text-decoration: none;
            color: #fff;
        }

        .content_box h3:first-child {
            border-left: 2px solid #581F7D;
        }

        .content_box input {
            font-size: 14px;
            width: 140px;
            height: 20px;
            border: 1px solid #E1E1E1;
            font-weight: 300;
            padding: 6px;
            color: #606060;
            transition: .2s ease;
            font-family: 'bon', sans-serif;
        }

        .content_box input:focus {
            border: 1px solid #9F7DF8;
        }

        /*
            Card Payment
        */

        .cardInfo_box {
            margin: 10px;
        }

        .cardInfo_box label {
            padding: 3px 5px 3px 5px;
            text-align: right;
            /*background-color: orange;*/
        }

        .cardCompany {
            top: 5px;
        }

        .cardNumber {
            top: 50px;
        }

        .cardNumber input {
            font-size: 14px;
            width: 40px;
            height: 20px;
            text-align: center;
        }

        .cardNumber span {
            font-size: 20px;
            vertical-align: middle;
        }

        .cardPw {
            top: 95px;
        }

        .cardPw i {
            vertical-align: middle;
        }

        .validDate {
            top: 140px;
        }

        .validDate span {
            font-size: 20px;
            vertical-align: middle;
        }

        .cardBirthDate {
            top: 185px;
        }

        .cardBirthDate input {
            font-size: 14px;
            width: 110px;
            height: 20px;
            text-align: center;
        }

        /*
            Phone Payment
        */

        .phoneInfo_box {
            margin: 20px;
        }

        .phoneInfo_box label, strong {
            padding: 3px 5px 3px 5px;
            text-align: right;
            /*background-color: orange;*/
            vertical-align: middle;
        }

        .telecom {
            top: 25px;

        }

        .telecom label {
            color: #581F7D;

            cursor: pointer;
        }

        .telecom label:hover {
            background: #581F7D;
            color: #fff;
        }

        .telecom input {
            display: none;

        }

        .phone {
            top: 90px;
        }

        .phone select {
            font-size: 14px;
            width: 50px;
            height: 40px;
            text-align: center;
        }

        .phoneBirthDate {
            top: 155px;
        }

        .phoneBirthDate input {
            font-size: 14px;
            width: 140px;
            height: 20px;
            text-align: center;
            vertical-align: middle;

        }

        #btnBox {
            width: 1000px;
            height: 80px;
            margin: 100px auto;
            /*background-color: yellow;*/
            position: relative;
        }

        #btnBox a {
            display: block;
            width: 138.422px;
            height: 41px;
            border: 1px solid black;
            font-size: 18px;
            font-weight: 700;
            color: white;
            background-color: #581F7D;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            line-height: 41px;
        }

        #btnBox button {
            width: 138.422px;
            height: 41px;
            border: 1px solid black;
            color: white;
            background-color: #581F7D;
            cursor: pointer;
            font: 700 18px 'bon', sans-serif;
        }

        #btnBox a.prev {
            position: absolute;
            left: 0;
            bottom: 0;
        }

        #btnBox button.next {
            position: absolute;
            right: 0;
            bottom: 0;
        }

        #card_box, #phone_box {
            width: 560px;
            border: 2px solid #581F7D;
            padding-bottom: 15px;
            padding-top: 15px;
            position: absolute;
            left: 0;
            top: 50px;
            display: none;
        }

        #card_box.now, #phone_box.now {
            display: block;
        }


    </style>
</head>
<body>
<%@include file="template/header.jsp" %>
<div id="content">
    <div class="pageName">
        <h2>결제하기</h2>
    </div>
    <!-- 페이지 타이틀 -->
    <form action="insertBooking.jsp" method="post">
        <fieldset>
            <legend class="screen_out">결제 필드</legend>
            <div class="content_box">
                <h3 class="now"><a href="#">신용카드</a></h3>
                <!-- 결제방식 선택 박스-->
                <div id="card_box" class="now">
                    <div class="cardInfo_box cardCompany">
                        <label for="cardCompany">카드종류</label>
                        <select name="cardCompany" id="cardCompany">
                            <option value="KB" selected>국민은행카드</option>
                            <option value="SHINHAN" selected>신한은행카드</option>
                            <option value="BC" selected>BC카드</option>
                            <option value="VISA" selected>VISA카드</option>
                            <option value="MASTER" selected>Master카드</option>
                        </select>
                    </div>
                    <!-- 카드종류 -->
                    <div class="cardInfo_box cardNumber">
                        <label for="cardNumber">카드번호</label>
                        <input type="text" id="cardNumber" name="firstNumber" maxlength="4"/>
                        <span>-</span>
                        <input type="text" name="secondNumber" maxlength="4"/>
                        <span>-</span>
                        <input type="text" name="thirdNumber" maxlength="4"/>
                        <span>-</span>
                        <input type="text" name="fourthNumber" maxlength="4"/>
                    </div>
                    <!-- 카드번호 -->
                    <div class="cardInfo_box cardPw">
                        <label for="cardPw">비밀번호</label>
                        <input type="password" id="cardPw" name="cardPw" maxlength="2"/><i class="fa fa-star"></i><i
                            class="fa fa-star"></i>
                    </div>
                    <!-- 비밀번호 -->
                    <div class="cardInfo_box validDate">
                        <label for="validDate">유효기간</label>
                        <input type="text" id="validDate" name="validMonth" maxlength="2"/><span>월</span>
                        <input type="text" name="validYear" maxlength="4"/><span>년</span>
                    </div>
                    <!-- 유효기간 -->
                    <div class="cardInfo_box cardBirthDate">
                        <label for="cardBirthDate">생년월일</label>
                        <input type="text" name="cardBirthDate" id="cardBirthDate" maxlength="6"
                               placeholder="주민번호 앞 6자리   "/>
                    </div>
                    <!-- 생년월일 -->
                </div>
                <!-- 신용카드 결제 정보 박스 -->

                <h3><a href="#">휴대폰결제</a></h3>

                <div id="phone_box">
                    <div class="phoneInfo_box telecom">
                        <strong>이동통신사</strong>
                        <label for="SKT">SKT</label>
                        <label for="KT">KT</label>
                        <label for="LGU+">LGU+</label>
                        <input type="radio" id="SKT" name="telecom" value="SKT" checked/>
                        <input type="radio" id="KT" name="telecom" value="KT"/>
                        <input type="radio" id="LGU+" name="telecom" value="LGU+"/>
                    </div>
                    <!-- 이동통신사 박스 -->
                    <div class="phoneInfo_box phone">
                        <label for="phone">휴대폰번호</label>
                        <select name="frontPhoneNum" id="phone">
                            <option value="010" selected>010</option>
                            <option value="011">011</option>
                            <option value="011">016</option>
                            <option value="011">017</option>
                            <option value="011">018</option>
                            <option value="011">019</option>
                        </select>
                        <input type="text" name="midPhoneNum" maxlength="4"/>
                        <input type="text" name="endPhoneNum" maxlength="4"/>
                    </div>
                    <!-- 휴대폰번호 박스 -->
                    <div class="phoneInfo_box phoneBirthDate">
                        <label for="phoneBirthDate">생년월일</label>
                        <input type="text" name="phoneBirthDate" id="phoneBirthDate" maxlength="6"
                               placeholder="주민번호 앞 6자리   "/>
                    </div>
                    <!-- 생년월일 -->
                </div>
                <!-- 휴대폰 결제 정보 박스 -->
            </div>
            <!-- 결제 정보 박스 -->
            <!-- 결제 박스 -->
            <hr class="screen_out">
            <input type="hidden" name="price" id="price">
            <input type="hidden" name="selectedSeat" id="selectedSeat">
            <input type="hidden" name="showingNo" id="showingNo">

            <div id="btnBox">
                <a class="prev" href="selectMovie.jsp"><i class="fa fa-arrow-left"></i> 좌석선택</a>
                <button type="submit" class="next">결제완료 <i class="fa fa-arrow-right"></i></button>
            </div>
            <!-- 버튼 박스 -->
        </fieldset>
    </form>
</div>
<!--//#center-->
<%@include file="template/footer.jsp" %>
<!--
    Javascript
-->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.session.js"></script>
<script>
    $("#selectedSeat").val($.session.get('checkedSeat'));
    $("#price").val($.session.get('price'));
    $("#showingNo").val($.session.get('showingNo'));

    var $h3 = $(".content_box h3");

    $h3.click(function () {

        var $this = $(this);

        $(".now").removeClass("now");

        $this.addClass("now");

        $this.next().addClass("now");
    });

</script>
</body>
</html>
<%}%>