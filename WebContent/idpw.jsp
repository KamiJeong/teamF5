<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="utf-8">
<title>GIGABOX</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/noto.sans.korea.css" />
<link rel="stylesheet" href="css/main.css" />
<style>

p {
	position: absolute;
	right: 20px;
	bottom: -15px;
}


#content{
width:1000px;
height:550px;
margin:auto;
margin-top:150px;
}

ul {
	position: relative;
}

.pageName {
	width: 1000px;
	height: 40px;
	line-height: 40px;
	padding: 0;
	margin: 40px 3px -20px auto;
	/*border: 1px solid black;*/
	font-size: 25px;
}

.pageName h2 {
	width: 300px;
	text-align: center;
	border-bottom: 3px solid #581F7D;
}

.findBox {
	width: 580px;
	height: 220px;
	margin: 80px auto;
	position: relative;
}

.findBox label {
	font-size: 15px;
}

.findBox input {
	border: 1px solid #E1E1E1;
	width: 140px;
	height: 18px;
	font-size: 15px;
	font-family: 'bon', sans-serif;
	font-weight: 300;
	padding: 6px;
	color: #606060;
	transition: .2s ease;
}

.findBox input:focus {
	border: 1px solid #9F7DF8;
}

.findBox h3 {
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

.findBox a {
	width: 140px;
	height: 47px;
	display: block;
	text-decoration: none;
	color: #fff;
}

.findBox h3.now a {
	background: #fff;
	color: #581F7D;
	border-bottom: 2px solid #fff;
}

.findBox h3:nth-of-type(1) {
	left: 0;
	top: 0;
}

.findBox h3:nth-of-type(2) {
	left: 140px;
	top: 0;
}

.findBox h3:first-child {
	border-left: 2px solid #581F7D;
}

#birthDate input {
	width: 50px;
}

#idFindForm, #pwFindForm {
	width: 576px;
	border: 2px solid #581F7D;
	padding-bottom: 15px;
	padding-top: 15px;
	position: absolute;
	left: 0;
	top: 50px;
	display: none;
}

#idFindForm.now, #pwFindForm.now {
	display: block;
}

#idFindForm li, #pwFindForm li {
	margin: 10px;
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

		<div id="content">
			<div class="pageName">
				<h2>아이디 / 비밀번호찾기</h2>
			</div>

			<div class="findBox">
				<h3 class="now">
					<a href="#">아이디찾기</a>
				</h3>

				<div id="idFindForm" class="now">
					<form id="idFind" action="" method="post">
						<ul>
							<li><label for="name">이름</label> <input type="text"
								id="name" name="name" /></li>

							<li><label for="birthDate">생년월일</label> <span id="birthDate">
									<label> <input type="text" id="year" name="year" /> 년
								</label> <label> <input type="text" id="month" name="month" />
										월
								</label> <label> <input type="text" id="day" name="day" /> 일
								</label>
							</span></li>

							<li><label for="phone">핸드폰 번호</label> <input type="text"
								id="phone" name="phone" placeholder="'-' 없이 입력해주세요" /></li>
							<li>
								<p>
									<button class="btn" type="submit">확인</button>
								</p>
							</li>
						</ul>

					</form>
				</div>
				<!-- //idFindForm -->

				<h3>
					<a href="#">비밀번호찾기</a>
				</h3>

				<div id="pwFindForm">
					<form id="pwFind" action="" method="post">
						<ul>

							<li><label for="id">아이디</label> 
							<input type="text" id="id2" name="id" /></li>

							<li><label for="birthDate">생년월일</label> <span id="birthDate">
									<label> <input type="text" id="year2" name="year" /> 년
								</label> <label> <input type="text" id="month2" name="month" />
										월
								</label> <label> <input type="text" id="day2" name="day" /> 일
								</label>
							</span></li>

							<li><label for="phone">핸드폰 번호</label> <input type="text"
								id="phone2" name="phone" placeholder="'-' 없이 입력해주세요" /></li>
							<p>
								<button class="btn" type="submit">확인</button>
							</p>
						</ul>
					</form>
				</div><!-- //pwFindForm -->
			</div><!-- //findBox-->
		</div><!-- //content-->
		
		<%@include file="template/footer.jsp" %>
	<script src="js/jquery.js"></script>
	<script>
		var $h3 = $(".findBox h3"),
			$idFind = $("#idFind"),
			$pwFind = $("#pwFind"),
			$loader = $("#loader");
		
		$("#header .aux li").eq(4).click(function(e){
			e.preventDefault();
			//$("#loginBox").fadeToggle(800);
			$("#myPageBox").fadeToggle(800);
		});

		$h3.click(function() {

			var $this = $(this);

			$(".now").removeClass("now");

			$this.addClass("now");

			$this.next().addClass("now");

		});
		
		$idFind.submit(function(e) {
			//form에서 submit을 막아주기 위해
			e.preventDefault();
			var name = $("#name").val();
			var year = $("#year").val();
			var month = $("#month").val();
			var date = $("#day").val();
			var phone = $("#phone").val();
			
			var birthDate = year + "-" + month + "-" + date;
			
			//alert(name+"/"+birthDate+"/"+phone);
			$loader.show();
			
			$.ajax("idFind.jsp", {
				type : "POST",
				dataType : "json",
				data : {
					name : name,
					birth : birthDate,
					phone : phone
				},
				error : function(xhr, error, code) {
					alert("에러야?" + code);
				},
				success : function(json) {
					//alert("성공");
					$loader.fadeOut(300);
					if (json.result!="null"){
						window.open('idpwPopup.jsp?data=' + json.result+"&no=1",'idpwFindPage','scrollbars=no,toolbar=no,resizable=yes,width=450,height=120,left=300,top=300');
					}
					if (json.result=="null"){
						alert("아이디를 찾을 수 없습니다.");
					}
				}
			});
			//alert("name : "+name+" / debutDate : "+debutDate);
		});
		
		$pwFind.submit(function(e) {
			//form에서 submit을 막아주기 위해
			e.preventDefault();
			var id = $("#id2").val();
			var year = $("#year2").val();
			var month = $("#month2").val();
			var date = $("#day2").val();
			var phone = $("#phone2").val();
			
			var birthDate = year + "-" + month + "-" + date;
			
			//alert(id+"/"+birthDate+"/"+phone);
			$loader.show();
			
			$.ajax("pwFind.jsp", {
				type : "POST",
				dataType : "json",
				data : {
					id : id,
					birth : birthDate,
					phone : phone
				},
				error : function(xhr, error, code) {
					alert("에러야?" + code);
				},
				success : function(json) {
					//alert("성공");
					$loader.fadeOut(300);
					if (json.result!="null"){
						window.open('idpwPopup.jsp?data=' + json.result+"&no=2",'idpwFindPage','scrollbars=no,toolbar=no,resizable=yes,width=500,height=120,left=300,top=300');
					}
					if (json.result=="null"){
						alert("비밀번호를 찾을 수 없습니다.");
					}
				}
			});
			//alert("name : "+name+" / debutDate : "+debutDate);
		});
		
	</script>
</body>
</html>

