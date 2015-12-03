<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="utf-8">
<title>joinForm</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/noto.sans.korea.css" />
<link rel="stylesheet" href="css/main.css" />
<style>
body {
	font-family: 'bon', sans-serif;
}

#content {
	width: 1000px;
	height: 800px;
	margin: 150px auto;
}

#content h2 {
	width: 150px;
	font-size: 25px;
	margin: 30px 0 30px 150px;
	border-bottom: 3px solid #581F7D;
	text-align: center;
	color: #463A8B;
}

#joinBox {
	width: 600px;
	margin: auto;
}

#joinBox p {
	margin: 20px 0;
}

#joinBox label {
	font-size: 15px;
	margin-right: 15px;
}

#joinBox input {
	font-size: 14px;
	width: 250px;
	height: 20px;
	border: 3px solid #E1E1E1;
	font-weight: 300;
	padding: 6px;
	color: #606060;
	transition: .2s ease;
	font-family: 'bon', sans-serif;
}

#joinFormId.now, #joinFormPw.now {

	font-size: 14px;
	width: 250px;
	height: 20px;
	border: 3px solid red;
	font-weight: 300;
	padding: 6px;
	color: #606060;
	transition: .2s ease;
	font-family: 'bon', sans-serif;
	}
	
	
	#joinFormId.yes {
	
		font-size: 14px;
	width: 250px;
	height: 20px;
	border: 3px solid green;
	font-weight: 300;
	padding: 6px;
	color: #606060;
	transition: .2s ease;
	font-family: 'bon', sans-serif;
	
	}



#joinBox input:focus {
	border: 3px solid #9F7DF8;
}




#idChkBtn {
	margin-left: 5px;
}

#joinBox #idBox, #phoneBox {
	margin-left: 120px;
}

#joinBox #pwBox, #birthDateBox {
	margin-left: 106px;
}

#joinBox #confirmPwBox {
	margin-left: 75px;
}

#joinBox #nameBox, #genderBox {
	margin-left: 134px;
}

#joinBox #selfTestBox {
	margin-left: 62px;
}

#birthDate input {
	width: 50px;
}

#gender input {
	width: 10px;
}

#phone.now{

	font-size: 14px;
	width: 250px;
	height: 20px;
	border: 3px solid #42a5f5;
	font-weight: 300;
	padding: 6px;
	color: #606060;
	transition: .2s ease;
	font-family: 'bon', sans-serif;

}

#phone.yes{

	font-size: 14px;
	width: 250px;
	height: 20px;
	border: 3px solid red;
	font-weight: 300;
	padding: 6px;
	color: #606060;
	transition: .2s ease;
	font-family: 'bon', sans-serif;

}

#selfTestBtn {
	font-family: 'bon', sans-serif;
	font-size: 18px;
	height: 30px;
	background: #581F7D;
	color: #fff;
	border: 0;
	cursor: pointer;
}


#selfTestBtn.now {
	font-family: 'bon', sans-serif;
	font-size: 18px;
	height: 30px;
	background: #1976d2;
	color: #fff;
	border: 0;
	cursor: pointer;

}

#selfTestBtn:hover {
	background: #fff;
	color: #251F39;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

#selfTestBtn:hover.now {
	background: #fff;
	color: #251F39;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}



#phoneChkBtn {
	margin-left: 5px;
}

#buttonBox {
	text-align: center;
}

.btn {
	border: 0;
	margin: 0;
	padding: 8px 14px;
	color: #463a84;
	text-decoration: none;
	font-weight: 500;
	transition: .2s ease;
}

button.btn {
	cursor: pointer;
	font: 500 17px 'bon', sans-serif;
}

.btn:hover {
	color: #fff;
	background: #581F7D;
}

#male, #female {
	cursor: pointer;
}

#cancelBtn {
	margin-right: 10px;
}

#joinBtn {
	margin-left: 10px;
}

/*
*자가진단 테스트
*/
#testPopup {
	width: 100%;
	height: 100%;
	position: fixed;
	background: rgba(0, 0, 0, .8);
	left: 0;
	top: 0;
	display: none;
	cursor: pointer;
}

#testPopup button {
	width: 100px;
	height: 50px;
	border: 0;
	margin: 0;
	padding: 8px 14px;
	color: #463a84;
	text-decoration: none;
	font-weight: 500;
	transition: .2s ease;
	cursor: pointer;
	font: 500 17px 'bon', sans-serif;
}

#testPopup button:hover {
	color: #fff;
	background: #581F7D;
}

#selfTest {
	width: 1000px;
	height: 600px;
	margin: auto;
	text-align: center;
}

#selfTest #one, #selfTest #two, #selfTest #three, #selfTest #four,
	#selfTest #five, #selfTest #six, #selfTest #seven, #selfTest #eight {
	width: 800px;
	height: 500px;
	font-size: 22px;
	color: #fff;
	display: none;
	text-align: center;
	position: absolute;
	/*margin: auto;*/
	top: 50%;
	left: 50%;
	margin-top: -250px;
	margin-left: -400px;
}

/*
         * 질문쪽....
         */
.questionBox, .selectBox {
	width: 750px;
	margin: auto;
	position: absolute;
}

.questionBox {
	top: 200px;
}

.selectBox {
	top: 450px;
}

#three .questionBox, #four .questionBox {
	top: 350px;
}

#three .selectBox, #four .selectBox {
	top: 400px;
}

#testPopup #testBox {
	width: 800px;
	height: 500px;
	position: fixed;
	left: 50%;
	top: 50%;
	margin: -250px 0 0 -400px
}

#count span {
	font-size: 100px;
}

/*
id중복체크
*/
#idCheck span.now {
	display: none;
}

#idCheck span.no {
	color: red;
}

#idCheck span.yes {
	color: green;
}

#idBox button {
	border: 0;
	margin: 0;
	padding: 8px 14px;
	color: #463a84;
	text-decoration: none;
	font-weight: 500;
	transition: .2s ease;
	font: 500 17px 'bon', sans-serif;
	cursor: pointer;
}

#idBox button:hover {
	color: #fff;
	background: #581F7D;
}

#eight {
margin:20px;

}

#eight div {
margin:20px;

}


#eight span {
margin:10px;
}



#imgeBox{
top:0;
}

#selectpreBox {
width:1000px;

}

#preferenceSelect {
margin:0;
padding:0;
}

#twopreSelect ,#fourpreSelect{
margin:0;
padding:0;
color:#2196f3;
font-size:35px;
}

#threepreSelect {
margin:0;
padding:0;
}




</style>
</head>
<body>

	<%@include file="template/header.jsp"%>

	<div id="content">

		<h2>회원가입</h2>

		<div id="joinBox">
			<form action="insertMember.jsp" method="post" id="joinForm">
				<fieldset>
					<legend class="screen_out"> 회원가입폼 </legend>

					<div id="idBox">

						<div>
							<label for="joinFormId">아이디</label> <input type="text"
								id="joinFormId" name="joinFormId" />
							<button type="button" class=".btn" id="idChkBtn">중복확인</button>
						</div>

						<div id="idCheck">
							<span class="no now">사용하실 수 없는 아이디입니다.</span> <span
								class="yes now">사용하실 수 있는 아이디입니다.</span>
						</div>

					</div>
					<!-- //idBox -->

					<div id="pwBox">

						<p>
							<label for="joinFormPw">비밀번호</label> <input type="password"
								id="joinFormPw" name="joinFormPw" />
						</p>

					</div>
					<!-- //pwBox -->

					<div id="confirmPwBox">

						<p>
							<label for="confirmPw">비밀번호 확인</label> <input type="password"
								id="confirmPw" />
						</p>

					</div>
					<!-- //confirmPwBox -->

					<div id="nameBox">

						<p>
							<label for="name">이름</label> <input type="text" id="name"
								name="name" />
						</p>

					</div>
					<!-- //nameBox -->

					<div id="birthDateBox">

						<p>
							<label for="birthDate">생년월일</label> <span id="birthDate">
								<label> <input type="text" id="year" name="year" maxlength="4" /> 년
							</label> <label> <input type="text" id="month" name="month" maxlength="2" /> 월
							</label> <label> <input type="text" id="day" name="day" maxlength="2"  /> 일
							</label>
							</span>
						</p>

					</div>
					<!-- //birthDateBox -->

					<div id="genderBox">

						<p>
							<label for="gender">성별</label> <span id="gender"> 남 <input
								type="radio" checked="checked" name="gender" id="male" value="M" />
								여 <input type="radio" name="gender" id="female" value="F" />
							</span>
						</p>

					</div>
					<!-- //genderBox -->

					<div id="phoneBox">

						<p>
							<label for="phone">연락처</label> <input type="text" id="phone"
								name="phone" placeholder="'-' 없이 입력해주세요" maxlength="11" />
							<button class="btn" id="phoneChkBtn">인증</button>
						</p>

					</div>
					<!-- //phoneBox -->

					<div id="selfTestBox">

						<p>
							<label for="selfTestBtn">자가진단 테스트</label>
							<button type="button" id="selfTestBtn">자리추천을 위해 "응답"해주세요.</button>
						</p>

					</div>
					<!-- //selfTestBox -->

					<div id="testPopup">
						<div id="testBox">
							<div id="selfTest">

								<div id="one">
									<div id="questionBox">지금부터 "자가진단 테스트"를 시작합니다.</div>
								</div>
								<!-- //one -->

								<div id="two">
									<div>

										<img src="img/GIGABOX_LOGO3.png" />

									</div>

									<div class="questionBox">

										<span> * 오른쪽 왼쪽 눈을 번갈아 가려보고 잘 보이는 쪽을 선택해주세요 * </span>
									</div>

									<div class="selectBox">
										<button class="eyesBtn" id="eysesBtnLeft" name="eysesBtnLeft"
											value="left">왼쪽</button>
										<button class="eyesBtn" id="eyesBtnRight" name="eyesBtnRight"
											value="right">오른쪽</button>
									</div>
								</div>
								<!-- //two -->

								<div id="three">
								<iframe id="videoIframe" width="560" height="315" 
								src="https://www.youtube.com/embed/moSFlvxnbgk" 
								frameborder="0" 
								allowfullscreen></iframe>
									<div class="questionBox">
										<span> * 이런 영상을 볼 때 효과 or 배경음을 중시하는지 영상에 더 집중하는지 선택! *
										</span>
									</div>

									<div class="selectBox">
										<button class="videoBtn" id="video" name="video" value="video">
											영상</button>
										<button class="videoBtn" id="sound" name="sound" value="sound">
											사운드</button>
									</div>
								</div>
								<!-- //three -->

								<div id="four">
									<div>
										<img src="img/seatseat.jpg" />
									</div>

									<div class="questionBox">
										<span> * 내가 선호하는 자리? * </span>
									</div>

									<div class="selectBox">
										<button class="seatBtn" id="front" name="front" value="front">
											앞쪽</button>
										<button class="seatBtn" id="hide" name="hide" value="back">
											뒷쪽</button>
									</div>
								</div>
								<!-- //four -->

								<div id="five">
									<div class="questionBox">
										<span> * 영화볼때 애인과 스킨십은? * </span>
									</div>

									<div class="selectBox">
										<button class="coupleBtn" id="o" name="o" value="o">
											O</button>
										<button class="coupleBtn" id="x" name="x" value="x">
											X</button>
									</div>
								</div>
								<!-- //five -->

								<div id="six">
									<div class="questionBox">
										<span> * 시선을 옆으로 돌렸을 때 어느쪽 목근육이 더 땡기시나요 ? * </span>
									</div>

									<div class="selectBox">
										<button class="neckBtn" id="neckBtnLeft" name="neckBtnLeft"
											value="neckLeft">왼쪽</button>
										<button class="neckBtn" id="neckBtnRight" name="neckBtnRight"
											value="neckRight">오른쪽</button>
									</div>
								</div>
								<!-- //six -->

								<div id="seven">
									<div>잠시후 "자가진단 테스트"의 결과가 출력됩니다.</div>
									<div id="count">
										<span></span>
									</div><!-- //count -->
								</div><!-- //seven -->

								<div id="eight">
								<div id="imgeBox"><img id="imgBox" src=""/></div>								
									<div id="h3Box">
									<h3 class="h3Css" id="oneH3"></h3><h3 id="userSelect"></h3>
									</div>
									<span id="fourpreSelect"></span><span id="preferenceSelect"></span><!-- -->
									<span id="twopreSelect"></span><!--  --><span id="threepreSelect"></span>
									<div class="selectBox">
										<button type="reset" class="btn" id="restart">다시하기</button>
										<button type="button" class="btn" id="finish">완료</button>
									</div><!-- //selectBox -->
								</div><!-- //eight -->
							</div><!-- //selfTest -->
						</div><!-- //testBox -->
					</div><!-- //testPopup -->
					<input type="hidden" name="type" id="type">
					<p id="buttonBox">
						<button type="reset" class="btn" id="cancelBtn">취소</button>
						<button type="submit" class="btn" id="joinBtn">회원가입</button>
					</p><!-- //buttonBox -->

				</fieldset>
			</form>
		</div><!-- //joinBox-->
	</div><!-- //content -->

	<%@include file="template/footer.jsp"%>

	<script src="js/jquery.js"></script>
	<script src="js/underscore-min.js"></script>
    <script src="js/headerPopup.js"></script>
	<script>
	var url = $("#videoIframe").attr('src');
	var results = "";
	var $userSelect = $("#userSelect"),$preferenceSelect = $("#preferenceSelect"),
	$imgeBox = $("#imgeBox"),$imgBox = $("#imgBox"),$imgOther = $("#imgOther"),$joinFormId =$("#joinFormId"),
	$imgeOtherBoxes = $("#imgeOtherBoxes"),$phone = $("#phone"), $testPopup = $("#testPopup"), 
	$this = $(this), $joinForm = $("#joinForm"),$one = $("#one"), $two = $("#two") , $three = $("#three"),
	$four = $("#four"), $five = $("#five"), $six = $("#six"), $seven = $("#seven"), $eight = $("#eight"),
	$videoIframe= $("#videoIframe"),$twopreSelect = $("#twopreSelect"), $threepreSelect = $("#threepreSelect"),
	$selfTestBtn=$("#selfTestBtn"),$joinFormPw = $("#joinFormPw"),$fourpreSelect = $("#fourpreSelect");
		var result = {
			"first" : "",
			"second" : "",
			"third" : "",
			"fourth" : ""
		};
		var $typeSelect = $("#typeSelect");
		//전화번호 자리수 체크

		$("#phoneChkBtn").click(function(e) {
			e.preventDefault();
			var phone = $phone.val();

			if (phone.length == 10 || phone.length == 11) {
				alert("올바른 전화번호입니다.");
				$phone.removeClass("yes");
				$phone.addClass("now");
				
			} else {

				alert("잘못된 전화번호입니다.");
				$phone.addClass("yes");
			}
		});

		$joinFormId.on('keydown', function(e) {

			if (e.keyCode == 32)
				return false;

		});

		//ID 중복체크

		$("#idChkBtn").on("click", function(e) {
			e.preventDefault();

			var idThis = $joinFormId.val();

			//alert("열리라고!!!");
			//alert(idThis);

			$.ajax("/chkId.jsp", {

				type : "post",
				dataType : "json",
				data : {
					id : idThis
				},
				error : function(xhr, error, code) {
					alert("에러!!!!");
				},
				success : function(json) {
					
					if (json.result) {
						//사용할 수 없는 아이디입니다.	
						$("span.no").removeClass("now");
						$("span.yes").addClass("now");
						$joinFormId.addClass("now");
						$joinFormId.removeClass("yes");
				

					} else if(idThis==""){
						alert("아이디를 입력해주세요");
						
						
					}else{
						//사용할 수 있는 아이디입니다.
						$("span.no").addClass("now");
						$("span.yes").removeClass("now");
						$joinFormId.addClass("yes");

					}
				}
			})
		});

		//자가진단 테스트 

		var timeSet03 = -1, timeSet02 = -1, timeSet01 = -1;

		$selfTestBtn.click(function(e) {
			e.preventDefault();

			$testPopup.fadeIn(0);
			$one.show();
			
			

			timeSet03 = setTimeout(function() {

				//alert("2초가 지났네요~");
				//주소창을 의미하는 객체

				$two.show();
				$one.hide();

			}, 2000);
		});

		$testPopup.click(function() {
			$("#selfTest>div").hide();
			clearTimeout(timeSet01);
			clearTimeout(timeSet02);
			clearTimeout(timeSet03);

			$testPopup.fadeOut(500);
			//alert("사라짐");
		});

		$("#testBox").click(function() {

			return false;

		});

		$(".eyesBtn").click(function() {

			$three.show();
			$two.hide();
			result.first = $(this).val();
			//alert(result.first);
			

		});

		$(".videoBtn").click(function() {
			$videoIframe.attr("src", '');
			$four.show();
			$three.hide();
			result.second = $(this).val();
			//alert(result.second);
			

		});

		$(".seatBtn").click(function() {
		
			$five.show();
			$four.hide();
			result.third = $(this).val();
			//alert(result.third);
		

		});

		$(".coupleBtn").click(function() {
					$six.show();
					$five.hide();
					
			
					function handleTimer() {
						if (count == 0) {
							clearInterval(timer);
							//endCountdown();
							//alert("first:" + result.first + " second:"
							//+ result.second + " third:" + result.third
							//+ " fourth:" + result.fourth);							

							if (result.first == "right"
									&& result.second == "video"
									&& result.third == "front"
									&& result.fourth == "x") {

								results = "a";
								$imgBox.attr({src:"img/wowwowwow.png",
															width:100,
															height:100,
															title: "video right",
													          alt: "wowwwow"
															});
								
								//$imgeBox.append($img);
								$userSelect.text("정말 영화에 집중할 줄 아는 당신!");
								$fourpreSelect.hide();
								$preferenceSelect.text("영상을 중요시하고");
								$twopreSelect.show();
								$threepreSelect.show();
								$twopreSelect.text("오른쪽");
								$threepreSelect.text("으로 보는게 개이득!");
							
								
								//alert($typeSelect);
							}
							
							if (result.first == "left"
								&& result.second == "sound"
								&& result.third == "front"
								&& result.fourth == "x") {

							results = "b";	
							$imgBox.attr({src:"img/jyp.jpg",
								width:404,
								height:233,
								title: "sound left",
						          alt: "jyp"});
								//$imgeBox.append($img);
									
							$userSelect.text("영화에 집중하는 걸 중시하지만");
							$fourpreSelect.hide();
							$preferenceSelect.text("영상보단");
							$twopreSelect.show();
							$twopreSelect.text("사운드지!");
							$threepreSelect.hide();
							//alert($typeSelect);
							//alert($type);
						}
							
							if (result.first == "right"
								&& result.second == "sound"
								&& result.third == "front"
								&& result.fourth == "x") {

							results = "b";
							$imgBox.attr({src:"img/jyp.jpg",
								width:404,
								height:233,
								title: "sound right",
						          alt: "jyp"});
							//$imgeBox.append($img);
							$userSelect.text("영화에 집중하는 걸 중시하지만");
							$fourpreSelect.hide();
							$preferenceSelect.text("영상보단");
							$twopreSelect.show();
							$twopreSelect.text("사운드지!");
							$threepreSelect.hide();
							//alert($typeSelect);
							//alert($type);
						}
							
							if (result.first == "left"
								&& result.second == "video"
								&& result.third == "front"
								&& result.fourth == "x") {
									
							results = "c";
							$imgBox.attr({src:"img/wowwowwow.png",
								width:100,
								height:100,
								title: "video left",
						          alt: "wowwow"});
							//$imgeBox.append($img);
							$userSelect.text("정말 영화에 집중할 줄 아는 당신!");
							$fourpreSelect.hide();
							$preferenceSelect.text("영상을 중요시하고");
							$twopreSelect.show();
							$threepreSelect.show();
							$twopreSelect.text("왼쪽");
							$threepreSelect.text("으로 보는게 개이득!");
							//alert($typeSelect);
							//alert($type);
						}
							
							if (result.first == "right"
								&& result.second == "video"
								&& result.third == "back"
								&& result.fourth == "x") {

							results = "d";
							$imgBox.attr({src:"img/eyessix.jpg",
								width:403,
								height:236,
								title: "video right",
						          alt: "eyessix"});
							//$imgeBox.append($img);
							$userSelect.text("오른쪽 화면을 중시하고");
							$fourpreSelect.show();
							$fourpreSelect.text("화면");
							$preferenceSelect.text("이 꽉차게 보이는걸 좋아하는군요!");
							$twopreSelect.hide();
							$threepreSelect.hide();
							//alert($typeSelect);
						}							

							if (result.first == "left"
								&& result.second == "sound"
								&& result.third == "back"
								&& result.fourth == "x") {
							results = "e";
							$imgBox.attr({src:"img/heojiwoong.jpg",
								width:432,
								height:204,
								title: "sound left",
						          alt: "heojiwoong"});
							//$imgeBox.append($img);
							$userSelect.text("영화,사운드 두마리 토끼를 다잡은 당신!");
							$fourpreSelect.show();
							$fourpreSelect.text("영상과 사운드");
							$preferenceSelect.text("를 둘다 중시 하는군요!");
							$twopreSelect.hide();
							$threepreSelect.hide();
							//alert($typeSelect);
							//alert($type);
						}
							
							if (result.first == "right"
								&& result.second == "sound"
								&& result.third == "back"
								&& result.fourth == "x") {
							results = "e";
							$imgBox.attr({src:"img/heojiwoong.jpg",
								width:432,
								height:204,
								title: "sound right",
						          alt: "heojiwoong"});
							//$imgeBox.append($img);					
							$userSelect.text("영화,사운드 두마리 토끼를 다잡은 당신!");
							$fourpreSelect.show();
							$fourpreSelect.text("영상과 사운드");
							$preferenceSelect.text("를 둘다 중시 하는군요!");
							$twopreSelect.hide();
							$threepreSelect.hide();
							//alert($typeSelect);
							//alert($type);
						}
														
							if (result.first == "left"
								&& result.second == "video"
								&& result.third == "back"
								&& result.fourth == "x") {
							results = "f";
							$imgBox.attr({src:"img/eyessix.jpg",
								width:403,
								height:236,
								title: "video left",
						          alt: "eyessix"});
							//$imgeBox.append($img);
							$userSelect.text("왼쪽 화면을 중시하고");
							$fourpreSelect.show();
							$fourpreSelect.text("넓은 시야");
							$preferenceSelect.text("에서 영화 보는걸 즐기는 당신!");
							$twopreSelect.hide();
							$threepreSelect.hide();
							
							//alert($typeSelect);
							//alert($type);
						}
														
							if (result.first == "right"
								&& result.second == "video"
								&& result.third == "back"
								&& result.fourth == "o") {
							results = "g";
							$imgBox.attr({src:"img/sindongyeop.jpg",
								width:400,
								height:209,
								title: "video right",
						          alt: "sindonghyeop"});
							//$imgeBox.append($img);
							$userSelect.text("음란마귀 같은 당신!");
							$fourpreSelect.hide();
							$preferenceSelect.text("영상을 중시하고");
							$twopreSelect.show();
							$threepreSelect.show();
							$twopreSelect.text("스킨십");
							$threepreSelect.text("을 좋아하는군요!");
							//alert($typeSelect);
							//alert($type);
						}							

							if (result.first == "right"
								&& result.second == "video"
								&& result.third == "front"
								&& result.fourth == "o") {
							results = "g";
							$imgBox.attr({src:"img/sindongyeop.jpg",
								width:400,
								height:209,
								title: "video right",
						          alt: "sindongyeop"});
							//$imgeBox.append($img);
							$userSelect.text("음란마귀 같은 당신!");
							$fourpreSelect.hide();
							$preferenceSelect.text("영상을 중시하고");
							$twopreSelect.show();
							$threepreSelect.show();
							$twopreSelect.text("스킨십");
							$threepreSelect.text("을 좋아하는군요!");
							//alert($typeSelect);
							//alert($type);
						}
							
							
							
							if (result.first == "left"
								&& result.second == "sound"
								&& result.third == "back"
								&& result.fourth == "o") {
							results = "h";
							$imgBox.attr({src:"img/peachpeach.png",
								width:254,
								height:246,
								title: "sound left",
						          alt: "peachpeach"});
							//$imgeBox.append($img);
							$userSelect.text("스킨십을 좋아하지만");
							$fourpreSelect.show();
							$fourpreSelect.text("영화");
							$preferenceSelect.text("좀 볼줄 아는군요!");
							$twopreSelect.hide();
							$threepreSelect.hide();
							//alert($typeSelect);
							//alert($type);
						}
							
							if (result.first == "left"
								&& result.second == "sound"
								&& result.third == "front"
								&& result.fourth == "o") {
							results = "h";							
							$imgBox.attr({src:"img/peachpeach.png",
								width:254,
								height:246,
								title: "sound left",
						          alt: "peachpeach"});
							//$imgeBox.append($img);
							$userSelect.text("스킨십을 좋아하지만");
							$fourpreSelect.show();
							$fourpreSelect.text("영화");
							$preferenceSelect.text("좀 볼줄 아는군요!");
							$twopreSelect.hide();
							$threepreSelect.hide();
							//alert($typeSelect);
							//alert($type);
						}
							
							if (result.first == "right"
								&& result.second == "sound"
								&& result.third == "front"
								&& result.fourth == "o") {
							results = "h";
							$imgBox.attr({src:"img/peachpeach.png",
								width:254,
								height:246,
								title: "sound right",
						          alt: "peachpeach"});
							//$imgeBox.append($img);
							$userSelect.text("스킨십을 좋아하지만");
							$fourpreSelect.show();
							$fourpreSelect.text("영화");
							$preferenceSelect.text("좀 볼줄 아는군요!");
							$twopreSelect.hide();
							$threepreSelect.hide();
							//alert($typeSelect);
							//alert($type);
						}
							
							if (result.first == "right"
								&& result.second == "sound"
								&& result.third == "back"
								&& result.fourth == "o") {
							results = "h";
							$imgBox.attr({src:"img/peachpeach.png",
								width:254,
								height:246,
								title: "sound right",
						          alt: "peachpeach"});
							//$imgeBox.append($img);
							$userSelect.text("스킨십을 좋아하지만");
							$fourpreSelect.show();
							$fourpreSelect.text("영화");
							$preferenceSelect.text("좀 볼줄 아는군요!");
							$twopreSelect.hide();
							$threepreSelect.hide();
							//alert($typeSelect);
							//alert($type);
						}

							
							if (result.first == "left"
								&& result.second == "video"
								&& result.third == "back"
								&& result.fourth == "o") {
							results = "i";
							$imgBox.attr({src:"img/sindongyeop.jpg",
								width:400,
								height:209,
								title: "video left",
						          alt: "sindongyeop"});
							//$imgeBox.append($img);
							$userSelect.text("음란마귀 같은 당신!");
							$fourpreSelect.hide();
							$preferenceSelect.text("영상을 중시하고");
							$twopreSelect.show();
							$threepreSelect.show();
							$twopreSelect.text("스킨십");
							$threepreSelect.text("을 좋아하는군요!");
							//alert($typeSelect);
							//alert($type);
						}
							
							if (result.first == "left"
								&& result.second == "video"
								&& result.third == "front"
								&& result.fourth == "o") {
							results = "i";
							$imgBox.attr({src:"img/sindongyeop.jpg",
								width:400,
								height:209,
								title: "video left",
						          alt: "front"});
							//$imgeBox.append($img);
							$userSelect.text("음란마귀 같은 당신!");
							$fourpreSelect.hide();
							$preferenceSelect.text("영상을 중시하고");
							$twopreSelect.show();
							$threepreSelect.show();
							$twopreSelect.text("스킨십");
							$threepreSelect.text("을 좋아하는군요!");
							//alert($typeSelect);
							//alert($type);
						}
							
							
							//alert(results);
							
							$("#type").val(results);
							$selfTestBtn.text("당신은 "+results+"형 입니다.");
							$selfTestBtn.addClass("now");

						} else {
							$("#seven span").text(count);
							count--;
						
						}
					
					}
					var count =3;
					var timer = setInterval(function() {
						handleTimer(count);
					}, 1000);
					result.fourth = $(this).val();
					//alert(result.fourth);
				

				});

		$(".neckBtn").click(function() {

			$seven.show();
			$six.hide();
			//result.fifth = $(this).val();
			//alert(result.fifth);

			timeSet01 = setTimeout(function() {

				//alert("2초가 지났네요~");
				//주소창을 의미하는 객체
				$eight.show();
				$seven.hide();

			}, 4000);
			
			
		
		});

		$("#restart").click(function() {
			//alert("눌렀군!");	
			//restart();
			//e.preventDefault();
			//$testPopup.fadeIn(0);
			$one.show();
			$eight.hide();

			timeSet02 = setTimeout(function() {

				//alert("2초가 지났네요~");
				//주소창을 의미하는 객체

				$two.show();
				$one.hide();

			}, 2000);
			
			var count = 3;
			$("#seven span").text(count);
			count--;
		
			$videoIframe.attr("src", url);
		
		});

		$("#finish").click(function(e) {
			e.preventDefault();
			$testPopup.fadeOut(500);
			$eight.hide();
			

		});
		
		$("#content").click(function(){
			var count = 3;
			$("#seven span").text(count);
			count--;
			
			$videoIframe.attr("src", url);
		});

		
		
	
	</script>
</body>
</html>

