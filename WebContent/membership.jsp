<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				    margin: 120px auto;
				    /*background: silver;*/
				}
				
				.pageName {
				    width: 1000px;
				    height: 40px;
				    margin: 30px auto 3px auto;
				    /*padding-bottom: 30px;*/
				    /*border: 1px solid black;*/
				    font-size: 28px;
				}

				.pageName .gigaboxBenefit {
					width: 425px;					
					border-bottom: 3px solid #581F7D;
					font-size: 25px;
				}
				
				.BenefitMain img{
					width:1000px;
					height:285px;
					margin-top:30px;
					text-align:center;
				}

				
				.pageClass .gigaboxClass{
					width:125px;
					border-bottom: 3px solid #581F7D;
					font-size: 25px;
					margin-top:30px;
				}
				
				
				.memberBenefit{
					margin-top:30px;
					width:1000px;
					height:450px;
				
					
				}
				
				.benefitClass {
				padding-bottom:100px;
				
				}

		
				.benefitClass li{
					margin:auto;
					text-align:center;
					float:left;
					margin-left:30px;
					margin-top:15px;
				}
				
				.benefitClass li:nth-child(1){
					width:290px;
					height:350px;
					
				
					
				}
				
				.benefitClass li:nth-child(2){
					width:290px;
					height:350px;
					
				
					
				}
				.benefitClass li:nth-child(3){
					width:290px;
					height:350px;
					
				
				}
		</style>
	</head>
	<body>
		<%@include file="template/header.jsp" %>
		<div id="content">
			<div class="pageName">
			<h2 class="gigaboxBenefit">2015 GIGABOX Membership benefits</h2>
			</div>
			<div class="BenefitMain">
				<img src="img/bnr_benefits.png" alt="혜택안내"/>
			</div>
			
			<div class="pageClass">
			<h2 class="gigaboxClass">등급별 혜택</h2>
			</div>
			<div class="memberBenefit">
				<div class="classListVVIP">
					<ul class="benefitClass">
						<li><img src="img/VVIP.png" alt="vvip"/></li>
						<li><img src="img/VIP.png" alt="vip"/></li>
						<li><img src="img/GENERAL.png" alt="general"/></li>
					</ul>
				</div>
			</div>
		</div>	
		<%@include file="template/footer.jsp" %>
        <script src="js/jquery.js"></script>
        <script src="js/headerPopup.js"></script>
	</body>
</html>
