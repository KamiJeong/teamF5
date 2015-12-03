<%@page import="com.f5.gigabox.vo.Member"%>
<%@page import="com.f5.gigabox.dao.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginMember");

	if(loginUser!=null){
		
	int memberNo = loginUser.getMemberNo();
	
	MembersDAO dao = MembersDAO.getDAO();
	
	Member member = dao.selectOne(memberNo);
	
%>
<!DOCTYPE html>
<html lang="KO">
	<head>
		<meta charset="utf-8">
		<title>updateForm</title>
		<link rel="stylesheet" href="css/reset.css"/>
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/main.css" />
		<style>
			body {
				font-family: 'bon', sans-serif;
			}
			
			#content {
				width: 1000px;
				height:800px;
				margin: 150px auto;
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

			#category li:nth-child(2) {
				left: 130px;
				border-bottom:5px solid #581F7D;
			}

			#category li:nth-child(3) {
				left: 330px;
			}

			h2 {
				padding:30px;
				text-align: center;
				font-size: 25px;
				color:#463A8B;
			}

			#updateBox {
				width:600px;
				margin: auto;
			}

			#updateBox p {
				margin: 20px 0;
			}

			#updateBox label {
				font-size: 15px;
				margin-right:15px;
			}

			#updateBox input {
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
			
			#updateBox input:focus {
           		border: 3px solid #581F7D;
			}
			
			#updateBox #idBox, #phoneBox {
				margin-left:120px;
			}
			
			#updateBox #pwBox, #birthDateBox {
				margin-left:106px;
			}
			
			#updateBox #confirmPwBox {
				margin-left:75px;
			}
			
			#updateBox #nameBox, #genderBox {
				margin-left:134px;
			}
			
			#updateBox #selfTestBox {
				margin-left:62px;
			}
			
			#birthDate input {
				width: 50px;
			}

			#gender input {
				width: 10px;
			}
			
			#phoneChkBtn {
				margin-left:5px;
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

			#selfTestBtn:hover {
				background: #fff;
				color: #251F39;
				box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
			}

			#buttonBox {
				text-align: center;
			}

			#male, #female {
				cursor: pointer;
			}

			#testPopup {

				width:100%;
				height:100%;
				position: fixed;
				background: rgba(0,0,0,.5);
				left:0;
				top:0;
				display: none;
				cursor: pointer;
			}
			
			#cancelBtn {
				margin-right:10px;
			}
			
			#updateBtn {
				margin-left:10px;
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

		</style>
	</head>
	<body>
		<%@include file="template/header.jsp" %>
		<div id="wrap">
			<div id="content">
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

				</div><!-- //category -->

				<div id="updateBox">
					<h2 class="screen_out">정보수정</h2>
					<form action="updateMember.jsp" method="POST">
					<input type="hidden" name="member_no" value="<%=member.getMemberNo() %>"/>
						<fieldset>
							<legend class="screen_out">
								정보수정폼
							</legend>
							
							<div id="idBox">
							
							<p>
								<label for="id2">아이디</label>
								<input type="text" id="id2" name="id2" disabled value="<%=member.getId() %>"/>
							</p>
							
							</div><!-- //idBox -->
							
							<div id="popup">

							</div>

							<div id="pwBox">
							
							<p>
								<label for="pwd">비밀번호</label>
								<input type="password" id="pwd" name="pwd" placeholder="새로운 비밀번호를 입력해주세요." />
							</p>
							
							</div><!-- //pwBox -->
							
							<div id="confirmPwBox">
							
							<p>
								<label for="confirmPw">비밀번호 확인</label>
								<input type="password" id="confirmPw" placeholder="새로운 비밀번호를 입력해주세요."/>
							</p>
							
							</div><!-- //confirmPwBox -->
							
							<div id="nameBox">
							
							<p>
								<label for="name">이름</label>
								<input type="text" id="name" name="name2" placeholder="<%=member.getName() %>"/>
							</p>
							
							</div><!-- //nameBox -->
							
							<div id="birthDateBox">
							
							<p>
								<label for="birthDate">생년월일</label>
								<span id="birthDate"> 
								<input type="text" id="year" name="year2" disabled value="<%=member.getYear() %>"/>
								<label>년 </label>
								<input type="text" id="month" name="month2" disabled value="<%=member.getMonth()+1 %>"/>
								<label>월 </label>
								<input type="text" id="day" name="day2" disabled value="<%=member.getDay() %>"/> 
								<label>일 </label> </span>
							</p>
							
							</div><!-- //birthDateBox -->
							
							<div id="genderBox">
							
							<p>
								<label for="gender">성별</label>
								
								<% if (member.getGender().equals("M")){ %>
									<span id="gender"> 남
										<input type="radio" checked="checked" name="gender" id="male" value="M"/>
										여
										<input type="radio" name="gender" id="female" value="F"/>
									</span>
								<% }else{ %>
									<span id="gender"> 남
										<input type="radio" name="gender" id="male" value="M"/>
										여
										<input type="radio" checked="checked" name="gender" id="female" value="F"/>
									</span>
								<% } %>
							</p>
							
							</div><!-- //genderBox -->
							
							<div id="phoneBox">
							
							<p>
								<label for="phone">연락처</label>
								<input type="text" id="phone" name="phone" placeholder="<%=member.getPhone() %>"/>
								<button class="btn" id="phoneChkBtn">
									인증
								</button>
							</p>
							
							</div><!-- //phoneBox -->
							
							<div id="selfTestBox">

							<p>
								<label for="selfTestBtn">자가진단 테스트</label>
								<button id="selfTestBtn">
									자리추천을 위해 "응답"해주세요.
								</button>
							</p>
							
							</div><!-- //selfTestBox -->
							
							<div id="testPopup"></div>
							<p id="buttonBox">
								<button class="btn" id="cancelBtn" type="reset">
									취소
								</button>
								<button class="btn" id="updateBtn" type="submit">
									수정
								</button>
							</p>

						</fieldset>
					</form>
				</div><!-- //updateBox-->

			</div><!-- //content -->
		
		</div><!-- //wrap -->
		
		<%@include file="template/footer.jsp" %>
		
		<script src="js/jquery.js"></script>
		<script>
			var $phone = $("#phone");
			var $testPopup = $("#testPopup");

			$("#phoneChkBtn").click(function() {

				var phone = $phone.val();

				if (phone.length == 10 || phone.length == 11) {
					alert("올바른 전화번호입니다.");
				} else {

					alert("잘못된 전화번호입니다.");
				}
			});

			$("#idChkBtn").click(function() {

				alert("test");

			});

			$("#selfTestBtn").click(function() {

				alert("test");
			});
			
			$("#header .aux li").eq(4).click(function(e){
				e.preventDefault();
				//$("#loginBox").fadeToggle(800);
				$(".loginMyPage").fadeToggle(800);
			});
		</script>
	</body>
</html>

<% }else{
	response.sendRedirect("index.jsp");
}%>
