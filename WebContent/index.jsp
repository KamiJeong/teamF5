<%@page import="com.f5.gigabox.dao.MoviesDAO"%>
<%@page import="com.f5.gigabox.vo.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.f5.gigabox.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Movie> movieList = MoviesDAO.getDAO().selectList();
	List<Movie> movieList2 = MoviesDAO.getDAO().selectListTwo();
	List<Movie> movieList3 = MoviesDAO.getDAO().selectListThree();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>header</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/movieInfo.css" />
		
		<style>
			@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800,900);
			html {
				overflow-y:scroll;
			}

			body {
				font: 300 15px bon, sans-serif;
				/*font:300 14px 'Raleway',sans-serif;*/
			}

			#header, #footer {
				width: 100%;
				height: 64px;
				background-color: #fff;
				border: 1px solid #581F7D;
				position: relative;
			}
			
			#header {
				position: fixed;
				left:0;
				top:0;
				z-index: 10;
				background-color:#2D2522;
				background-image:url(img/advertise.JPG);
				background-size:660px 66px;
				background-position:center 0;
				background-repeat: no-repeat;
				transition:.5s ease;
			}
			
			#header.small {
				background-color:#fff;
				background-position:center -64px;
			}

			.aux {
				width: 1000px;
				position: relative;
				margin: auto;
				text-align: center;
			}
			
			#mainLogo{
				width:170px;
				height:64px;
			}
			
			#header #mainLogo a{
				display:block;
				width:170px;
				height:170px;
				background-color:#581F7D;
				background-image:url(img/mainLogo2.JPG),url(img/mainLogo.JPG),url(img/GIGABOX_LOGO.jpg);
				background-size:170px 64px,170px 64px,170px 170px;
				background-position:0 170px,0 234px,0 0;
				background-repeat: no-repeat;
				transition:.3s cubic-bezier(.45,.14,.56,1.44) .1s;
				position: relative;
				left:0;
				top:0;
			}
			
			#header.small #mainLogo a {
				width:170px;
				height:170px;
				top:-106px;
				background-position:0 0, 0 106px,0 0;
			}
			
			#header.small #mainLogo a:hover {
				width:170px;
				height:170px;
				top:-106px;
				background-position:0 106px,0 0,0 0;
				border-left:1px solid #581F7D;
			}

			#header ul{
				position:absolute;
				left:170px;
				top:0;
				margin:0;
				padding:0;
			}

			#header .aux li {
				display: inline-block;
				border-right: 1px solid transparent;
				width:164px;
				height:64px;
				line-height:64px;
				transition:top .2s ease;
				vertical-align: middle;
				position: relative;
				left:0;
				top:64px;
			}
			
			#header.small .aux li {
				background:white;
				top:0;
				border-color:#581F7D;
			}
			
			#header .aux li:last-child {
				top:0;
				background:#fff;
			}
			
			#header a {
				color: #fff;
				text-decoration: none;
				font-size:20px;
				font-weight:700;
				display:block;
				height:64px;
				width:164px;
			}
			
			#header.small .aux li a {
				color:#581F7D;
			}
			
			#header.small .aux li:first-child {
				border-left: 1px solid #581F7D;
			}
			
			#header .aux li:last-child a {
				color:#581F7D;
				font-size:18px;
			} 
			
			#header .aux li a:hover {
				color:#00BFFF;
			}
			
			#header.small .aux li a:hover {
				color:#00BFFF;
			}
			
			#content {
				width: 100%;
				min-height: 1000px;
				margin-top:564px;
				background:#fff;
				position: relative;
				z-index: 9;
			}

			.imageSlider {
				width: 100%;
				height: 500px;
				margin: auto;
				background-color: #333;
				position: fixed;
				left:0;
				top:64px;
			}

			.imageSlider img {
				width: 1000px;
				height: 500px;
			}
			
			#item{
				width:1000px;
				height:500px;	
				margin: auto;
				display: block;
				position: absolute;
				top:50%;
				left:50%;
				margin:-250px 0 0 -500px;
				/*background-image: url(img/the_throne_bigbanner_web_00.png);*/
				overflow: hidden;
			}
			
			#item img {
				width:1000px;
				height:500px;
				cursor: pointer;
			}
			
			/* imgBox : 이미지 슬라이드 사진 리스트들이 담겨져 있는 영역 */
			.imageSlider #item #imgBox{
				width:5000px;
				height:500px;
				position: absolute;
				left:0;
				top:0;
				transition:.5s ease;
			}
			
			.imageSlider #item #imgBox img{
				float: left;
			}
			
			.movieList{
				width:1000px;
				height:500px;
				margin: auto;
				margin-top:564px;
			}

			#footer {
				background-color: #581F7D;
				text-align: center;
				color: #FFF;
				line-height: 64px;
			}

			#footer address {
				position: absolute;
				top: 0;
				right: 0;
			}

			#header img,#footer img {
				width: 165px;
				height: 32px;
				position: absolute;
				top: 16px;
				left: 0;
			}

			#footer a {
				color: #FFF;
				text-decoration: none;
			}
			#footer a:hover {
				text-decoration: underline;
			}

			#policy {
				position: absolute;
				top: 0;
				left: 130px;
				width: 750px;
				text-align: center;
			}

			#policy li {
				display: inline;
				border-right: 1px solid #FFF;
				padding-right: 10px;
				margin-left: 10px;
			}

			#policy li:last-child {
				border: none;
			}

			#policy strong {
				font-weight: 500;
			}

			.imageSlider .imgBtn {
				width:150px;
				height:500px;
				font-size: 70px;
				text-align: center;
				line-height: 500px;
				font-weight: 500;
				margin: 0;
				border:none;
				position:absolute;
				cursor:pointer;
				background:none;
				color:#49ACB5;
				opacity: .3;
			}
			
			.imageSlider .imgBtn:hover, .movieSequence .imgBtn:hover {
				opacity: 1;
			}

			.imageSlider .imgBtnLeft {
				right:0;
				top:0;
			}
			
			.imageSlider .imgBtnRight{
				top:0;
				left:0;
			}
			
			.movieSequence .imgBtnLeft {
				right:-100px;
				top:0;
			}
			
			.movieSequence .imgBtnRight{
				top:0;
				left:-100px;
			}
			
			#slideDot li:hover{
				background:#FF0000;
			}
			
			#slideDot li:nth-child(1){
				position: absolute;
				display: inline-block;
				vertical-align: middle;
				bottom:20px;
				left:440px;			
			}
			#slideDot li:nth-child(2){
				position: absolute;
				display: inline-block;
				vertical-align: middle;
				bottom:20px;	
				left:460px;			
			}
			#slideDot li:nth-child(3){
				position: absolute;
				display: inline-block;
				vertical-align: middle;
				bottom:20px;	
				left:480px;			
			}
			#slideDot li:nth-child(4){
				position: absolute;
				display: inline-block;
				vertical-align: middle;
				bottom:20px;	
				left:500px;			
			}
			#slideDot li:nth-child(5){
				position: absolute;
				display: inline-block;
				vertical-align: middle;
				bottom:20px;	
				left:520px;			
			}
			
			#slideDot li {
				display: block;
				background: #333;
				text-indent: -9999px;
				overflow: hidden;
				width: 16px;
				height: 16px;
				margin: 4px;
				/*css3*/
				border-radius: 50%;
				box-shadow: 0 0 1px #fff;
				transition: .2s ease;
			}
			
			#slideDot li:hover {
				cursor: pointer;
			}
			
			.movieSequence{
				width:1000px;
				min-height:800px;
				position:relative;
				left:0;
				top:50px;
				margin:auto;
			}
			
			.movieSequence .imgBtn{
				width:100px;
				height:700px;
				font-size: 70px;
				text-align: center;
				line-height: 500px;
				font-weight: 500;
				margin: 0;
				border:none;
				position:absolute;
				top:56px;
				cursor:pointer;
				background:none;
				color:#49ACB5;
				opacity:.3;
			}
			
		
			.movieSequence h2 {
				border-right: 3px solid #581F7D;
				border-top: 3px solid #581F7D;
				text-align:center;
				width:140px;
				height:50px;
				line-height:50px;
				background-color:#581F7D;
				position: absolute;
				color:#fff;
				left:0;
				top:0;
				z-index: 1;
			}
			
			.movieSequence h2:nth-of-type(1){
				border-left: 3px solid #581F7D;
				left:0;
			}
			.movieSequence h2:nth-of-type(2){
				left:144px;
			}
			.movieSequence h2:nth-of-type(3){
				left:287px;
			}
			
			.movieBox li img{
				width:200px;
				height:290px;
				box-shadow: 0 27px 24px 0 rgba(0, 0, 0, 0.2), 0 40px 77px 0 rgba(0, 0, 0, 0.22);
			}
				
			.movieBox li:first-child img{
				width:430px;
				height:640px;
			}
			
			.movieSequence a {
				color: #fff;
				text-decoration: none;
				font-size:20px;
				font-weight:700;
				display:block;
				height:50px;
				width:140px;
			}
			
			.movieSequence a:hover {
				cursor:pointer;
				color:#00BFFF;
			}

			#content .movieBox{
				width:1000px;
				height:700px;
				border-top:3px solid #581F7D;
				border-bottom:3px solid #581F7D;
				position:relative;
				left:3px;
				top:27px;
				margin:auto;
				overflow:hidden;
			}
			
			#content .movieBox ul{
				position:relative;
				top:30px;
				left:45px;
			}
			
			#content .movieBox li{
				display: inline-block;
				vertical-align:top;
				width:200px;
				height:290px;
				position: absolute;
				transition:.5s ease;
			}
			
			#content .movieBox li a{
				display: block;
				width:200px;
				height:290px;
				background:yellow;
			}
			
			#content .movieBox li:nth-child(1) {
				left:0;
				top:0;
				width:430px;
				height:640px;
			}
			
			#content .movieBox li:nth-child(1) a{
				width:430px;
				height:640px;
			}
			
			#content .movieBox li:nth-child(2) {
				left:470px;
				top:0;
			}
			
			#content .movieBox li:nth-child(3) {
				left:710px;
				top:0;
			}
			
			#content .movieBox li:nth-child(4) {
				left:470px;
				top:350px;
			}
			
			#content .movieBox li:nth-child(5) {
				left:710px;
				top:350px;
			}
			
			.movieSequence #movieList1{
				position:absolute;
				left:0;
				top:53px;
				display: none;
			}
			
			.movieSequence #movieList2{
				position:absolute;
				left:0;
				top:53px;
				display:none;
			}
			
			.movieSequence #movieList3{
				position:absolute;
				left:0;
				top:53px;
				display:none;
			}

			#loginBox{
				width:350px;
				height:150px;
				background:#fff;
				position:absolute;
				top:0;
				left:0;
				border:3px solid #581F7D;
			}
			
			#loginBox input {
	            font-size: 14px;
	            width: 140px;
	            height: 20px;
	            border: 3px solid #E1E1E1;
	            font-weight: 300;
	            padding: 6px;
	            color: #606060;
	            transition: .2s ease;
	            font-family: 'bon', sans-serif;
 	     	}
 	     	
 	     	#loginBox input:focus {
           		border: 3px solid #581F7D;
			}
			
			#loginBox label {
	            padding: 3px 5px 3px 5px;
	            text-align: right;
	            /*background-color: orange;*/
       		 }
 	     	
 	     	#loginBox button{
 	     		width:80px;
 	     		height:75px;
 	     		position:absolute;
 	     		top:20px;
 	     		right:20px;
 	     		border:none;
 	     		background-color:#581F7D;
 	     		color:#fff;
 	     		font:700 18px 'bon' ,sans-serif;
			}

			#loginBox .loginForm {
				text-align: right;
				width: 228px;
				height: 80px;
				margin: 20px 0 0 20px;
			}

			#loginBox .joinBtn {
				text-align: center;
				width: 310px;
				height: 50px;
				margin: 0px 0 0 20px;
				position: relative;
				top: 10px;
			}

			#header .joinBtn a {
				display: block;
				height: 30px;
				color: #333;
				font-size: 15px;
				margin-left: 5px;
				position: absolute;
				line-height: 30px;
				top: 0px;
			}

			#header .joinBtn a:hover {
				color: #00BFFF;
			}

			#header .joinBtn a:nth-child(1) {
				width: 80px;
				left: 30px;
				font-size: 15px;
			}

			#header .joinBtn a:nth-child(2) {
				left: 110px;
				font-size: 15px;
			}

			

			.movieSequence h2.now a {
				background: #fff;
				color: #581F7D;
				border-bottom: 5px solid #fff;
			}
			
			#myPageBox{
				position:relative;
				top:0;
				left:50%;
				margin-left:143px;
				width:350px;
				display:none;
			}
			
			#myPageForm{
				width:350px;
				min-height:400px;
				background:#fff;
				position:absolute;
				top:0;
				left:0;
				border:3px solid #581F7D;
			}

			#myPageForm .myPicture {
				width: 120px;
				height: 140px;
				background: silver;
				border-radius: 60px;
				position: absolute;
				top: 20px;
				left: 10px;
			}

			#myPageForm .myInfo {
				width: 190px;
				height: 140px;
				position: absolute;
				top: 20px;
				right: 10px;
				border:2px solid #581F7D;
				border-radius:20px;
			}
			
			#myPageForm .myInfoBox {
				width:175px;
				height:35px;
				position:relative;
				margin-bottom:10px;
 			}
			
			#myPageForm .myInfoBox h4 {
				width: 75px;
				height: 30px;
				font-size:14px;
				text-align:right;
				padding-right:10px;
				font-weight:500;
				left:0;
				top:0;
				position:absolute;
			}
			
			#myPageForm .myInfoBox h3 {
				width: 155px;
				height: 30px;
				font-size:18px;
				font-weight:800;
				text-align:center;
				padding-left:10px;
				left:20px;
				top:20px;
				position:absolute;
			}

			#myPageForm .myPageBtn {
				width: 250px;
				height: 50px;
				position:absolute;
				top:180px;
				left:45px;
			}
			
			#myPageForm .myPageBtn a{
				width:100px;
				height:40px;
				font-size:16px;
				color:#581F7D;
				border:1px solid #581F7D;
				background:#fff;
				text-align:center;
				line-height:40px;
				position:absolute;
				top:0;
			}
			
			#myPageForm .myPageBtn a:nth-child(1){
				display:block;
				left:15px;
			}

			#myPageForm .myPageBtn a:nth-child(2){
				display:block;
				width: 100px;
				right:15px;
			}
			
			#myPageForm .myBookingList{
				width:330px;
				min-height:60px;
				background:#00BFFF;
				position:absolute;
				left:10px;
				top:240px;
			}
			
			#myPageForm .myBookingList h3{
				width:250px;
				height:30px;
				position:absolute;
				line-height:30px;
				left:10px;
				top:0px;
			}
			
			#myPageForm .myBookingList h3:nth-of-type(1){
				font-size:18px;
				font-weight:600;
				top:0px;
			}
			
			#myPageForm .myBookingList h3:nth-of-type(2){
				top:30px;
			}
			
			#myPageForm .myBookingList button{
				width:80px;
				height:50px;
				border:none;
				border-radius:20px;
				background:#581F7D;
				color:#fff;
				font:600 15px 'bon',sans-serif;
				position:absolute;
				right:10px;
				top:5px;
			}

			.movieSequence #movieList4{
				position:absolute;
				left:0;
				top:53px;
				display:none;
			}
			
			#movieList1.now, #movieList2.now, #movieList3.now , #movieList4.now {
				display: block;
			}
			
			#content .movieBox.show li:nth-child(6) {
				left:0;
				top:0;
			}
			
			#content .movieBox.show li:nth-child(7) {
				left:240px;
				top:0;
			}
			
			#content .movieBox.show li:nth-child(8) {
				left:480px;
				top:0;
			}
			
			#content .movieBox.show li:nth-child(9) {
				left:720px;
				top:0;
			}
			
			#content .movieBox.show li:nth-child(10) {
				left:0;
				top:330px;
			}
			
			#content .movieBox.show li:nth-child(11) {
				left:240px;
				top:330px;
			}
			
			#content .movieBox.show li:nth-child(12) {
				left:480px;
				top:330px;
			}
			
			#content .movieBox.show li:nth-child(13) {
				left:720px;
				top:330px;
			}
			
			#content .movieBox li:nth-child(6), #content .movieBox li:nth-child(7), 
			#content .movieBox li:nth-child(8), #content .movieBox li:nth-child(9), 
			#content .movieBox li:nth-child(10), #content .movieBox li:nth-child(11),
			#content .movieBox li:nth-child(12),#content .movieBox li:nth-child(13) {
				
				left:1200px;
				top: 200px;
				
			}
			
			#content .movieBox.show li:nth-child(1), #content .movieBox.show li:nth-child(2), 
			#content .movieBox.show li:nth-child(3), #content .movieBox.show li:nth-child(4), 
			#content .movieBox.show li:nth-child(5) {
				
				left:-1200px;
				top: 200px;
				
			}
			
			
			
		</style>
	</head>
	<body>
	<%@include file="template/header.jsp" %>

		<div class="imageSlider">
			<div id="item">
				<div id="imgBox">
					<img src="img/beauty.jpg" title="뷰티인사이드 이진욱" />
					<img src="img/bg1.png" alt="주문형극장"/>
					<img src="img/bg5.png" alt="탐정"/>
					<img src="img/bg3.png" alt="카카오"/>
					<img src="img/bg4.png" alt="사도"/>
				</div>
				
				<button id="imgRight" class="imgBtnRight imgBtn"><i class="fa fa-chevron-left"></i><span class="screen_out">왼쪽</span></button>
				<button id="imgLeft" class="imgBtnLeft imgBtn"><i class="fa fa-chevron-right"></i><span class="screen_out">오른쪽</span></button>		
			
				<div id="slideDot">
					<ol>
						<li><a href>1</a></li>
						<li><a href>2</a></li>
						<li><a href>3</a></li>
						<li><a href>4</a></li>
						<li><a href>5</a></li>
					</ol>
				</div><!--slideDot end-->
			</div><!--item end-->
		</div><!-- imageSlider end-->
	
		<div id="content">
			<div class="movieSequence">
				
				<button id="imgRight2" class="imgBtnRight imgBtn"><i class="fa fa-chevron-left"></i><span class="screen_out">왼쪽</span></button>
				<button id="imgLeft2" class="imgBtnLeft imgBtn"><i class="fa fa-chevron-right"></i><span class="screen_out">오른쪽</span></button>
				
				<h2 class="now"><a href="#">순위별</a></h2>
				<div id="movieList1" class="movieBox now">
					<ul>
						<%-- for(Movie list : movieList){ --%>
						<% if(movieList.size()>13){					
								for(int i = 0 ; i < 13 ; i++){ %>
									<li><a href="movieInfo.jsp?no=<%=movieList.get(i).getMovieNo() %>" data-no="<%=movieList.get(i).getMovieNo() %>" title="<%=movieList.get(i).getTitle()%>"><img src="<%=movieList.get(i).getPoster() %>" title="<%=movieList.get(i).getTitle()%> 포스터"><span class="screen_out"><%=movieList.get(i).getTitle()%></span></a></li>
						<% 		}
							}else{ 
								for(int j = 0 ; j < movieList.size() ; j++){%>
									<li><a href="movieInfo.jsp?no=<%=movieList.get(j).getMovieNo() %>" data-no="<%=movieList.get(j).getMovieNo() %>" title="<%=movieList.get(j).getTitle()%>"><img src="<%=movieList.get(j).getPoster() %>" title="<%=movieList.get(j).getTitle()%> 포스터"><span class="screen_out"><%=movieList.get(j).getTitle()%></span></a></li>
						<%		}
							} %>
					</ul>
				</div>
				
				<h2><a href="#">개봉순</a></h2>
				<div id="movieList2" class="movieBox">
					<ul>
						<%-- for(Movie list : movieList){ --%>
						<% if(movieList2.size()>13){					
								for(int i = 0 ; i < 13 ; i++){ %>
									<li><a href="movieInfo.jsp?no=<%=movieList2.get(i).getMovieNo() %>" data-no="<%=movieList2.get(i).getMovieNo() %>" title="<%=movieList2.get(i).getTitle()%>"><img src="<%=movieList2.get(i).getPoster() %>" title="<%=movieList2.get(i).getTitle()%> 포스터"><span class="screen_out"><%=movieList2.get(i).getTitle()%></span></a></li>
						<% 		}
							}else{ 
								for(int j = 0 ; j < movieList2.size() ; j++){%>
									<li><a href="movieInfo.jsp?no=<%=movieList2.get(j).getMovieNo() %>" data-no="<%=movieList2.get(j).getMovieNo() %>" title="<%=movieList2.get(j).getTitle()%>"><img src="<%=movieList2.get(j).getPoster() %>" title="<%=movieList2.get(j).getTitle()%> 포스터"><span class="screen_out"><%=movieList2.get(j).getTitle()%></span></a></li>
						<%		}
							} %>
					</ul>
				</div>
				
				<h2><a href="#">개봉예정</a></h2>
				<div id="movieList3" class="movieBox">
					<ul>
						<%-- for(Movie list : movieList){ --%>
						<% if(movieList3.size()>13){					
								for(int i = 0 ; i < 13 ; i++){ %>
									<li><a href="movieInfo.jsp?no=<%=movieList3.get(i).getMovieNo() %>" data-no="<%=movieList3.get(i).getMovieNo() %>" title="<%=movieList3.get(i).getTitle()%>"><img src="<%=movieList3.get(i).getPoster() %>" title="<%=movieList3.get(i).getTitle()%> 포스터"><span class="screen_out"><%=movieList3.get(i).getTitle()%></span></a></li>
						<% 		}
							}else{ 
								for(int j = 0 ; j < movieList3.size() ; j++){%>
									<li><a href="movieInfo.jsp?no=<%=movieList3.get(j).getMovieNo() %>" data-no="<%=movieList3.get(j).getMovieNo() %>" title="<%=movieList3.get(j).getTitle()%>"><img src="<%=movieList3.get(j).getPoster() %>" title="<%=movieList3.get(j).getTitle()%> 포스터"><span class="screen_out"><%=movieList3.get(j).getTitle()%></span></a></li>
						<%		}
							} %>
					</ul>
				</div>
			</div><!-- //movieSequence -->
		</div><!-- //content -->
		
		
		<%@include file="template/footer.jsp" %>
		<%@include file="template/movieInfo.jsp" %>
		
		<script src="js/jquery.js"></script>
		<script src="js/underscore-min.js"></script>
		<script src="js/Chart.min.js"></script>
		<script src="js/movieInfo.js"></script>
		<script>
		
		_.templateSettings = {
				interpolate : /\<\@\=(.+?)\@\>/gim,
				evaluate : /\<\@(.+?)\@\>/gim,
				escape : /\<\@\-(.+?)\@\>/gim
			};
		
			var $window = $(window), $img = $(".imageSlider");
			var offset = $img.offset();
			var imgBottom = offset.top + $img.height();
			var $h2 = $(".movieSequence h2");

			
			var $imgBox = $("#imgBox"),
				idx = 0,
				$nextBtn=$("#imgLeft"),
				$prevBtn= $("#imgRight"),
				startpoint=0;	

			$window.scroll(function() {
				var scrollTop = $window.scrollTop();
				
				console.log(scrollTop);
				
				if(scrollTop>=64) {
					$("#header").addClass("small");
				}else {
					$("#header").removeClass("small");
				}
			});
			
			startPoint();
			
			function startPoint() {
				if (startpoint == idx) {
					$("#slideDot li:eq(0)").css("background-color", "#eee");

				}
			}
			
			/* 이미지 슬라이드 이전 버튼 */
			$prevBtn.click(function(){
				if (idx == 0) {
					idx = 4;
					$imgBox.css("left", -(idx * 1000));
					$("#slideDot li:eq(0)").css("background-color", "#333");

				} else {
					--idx;
					$imgBox.css("left", -(idx * 1000));
				}

				$("#slideDot li:eq(" + idx + ")").css("background-color", "#eee");
				$("#slideDot li:eq(" + (idx + 1) + ")").css("background-color",
						"#333");
			});
			
			/* 이미지 슬라이드 다음 버튼 */
			$nextBtn.click(function(){
				++idx;
				$("#slideDot li:eq(" + idx + ")").css("background-color", "#eee");
				$("#slideDot li:eq(" + (idx - 1) + ")").css("background-color",
						"#333");

				$imgBox.css("left", -(idx * 1000));
				if (idx == 5) {
					idx = 0;

					$imgBox.css("left", -(idx * 1000));
					$("#slideDot li:eq(4)").css("background-color", "#333");
					$("#slideDot li:eq(0)").css("background-color", "#eee");

				}
			});
			
			$("#slideDot li").click(
					function() {

						idx = $(this).index();

						$imgBox.css("left", -((idx) * 1000));

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
			
			
			startInterval();
			
			/* 자동 슬라이드 2초 간격 , 아직 첫번째 슬라이드 트랜지션 미적용*/
			function startInterval() {
				var myVar = setInterval(function() {
					++idx;
					$imgBox.css("left", -(idx * 1000));
					$("#slideDot li:eq(" + idx + ")").css("background-color",
							"#eee");
					$("#slideDot li:eq(" + (idx - 1) + ")").css("background-color",
							"#333");
					if (idx == 5) {
						idx = 0;

						$imgBox.css("left", -(idx * 1000));
						$("#slideDot li:eq(4)").css("background-color", "#333");
						$("#slideDot li:eq(0)").css("background-color", "#eee");

					}
				}, 4000);
			}
			
			$("#header .aux li").eq(4).click(function(e){
				e.preventDefault();
				//$("#loginBox").fadeToggle(800);
				$("#myPageBox").fadeToggle(800);
			});


			$h2.click(function(e) {
				e.preventDefault();
				var $this = $(this);
				
				$(".now").removeClass("now");
				$this.addClass("now");
				$this.next().addClass("now");
			});
			
			$("#imgLeft2").click(function(){
				//$(".movieBox.now").removeClass("now").next().addClass("now");
				$(".movieBox.now").addClass("show");
			});
			
			$("#imgRight2").click(function(){
				//$(".movieBox2.now").removeClass("now").prev().addClass("now");
				$(".movieBox.now").removeClass("show");
			});
			
			$(".movieBox li a").click(function(e){
				e.preventDefault();
				var no = $(this).attr("data-no");
				getMovieInfo(no);
			});
			
			
		</script>
		
	</body>
</html>

