<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String data = request.getParameter("data");
	String no = request.getParameter("no");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/noto.sans.korea.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<style>
	body{
		font:300 23px 'bon',sans-sarif;
		background:pink;
	}
	#idpopup{
		width:440px;
		height:100px;
		background:pink;
		position:relative;
		left:0;
		top:0;
	}
	
	#idpopup h3{
		position:absolute;
		left:10px;
		top:10px;
		width:220px;
		height:80px;
		line-height:80px;
	}
	
	#idpopup h3:last-child{
		left:330px;
		top:10px;
		width:100px;
		height:80px;
		line-height:80px;
	}
	
	#idpopup h2{
		position:absolute;
		left:230px;
		top:10px;
		font-size:30px;
		width:90px;
		height:80px;
		line-height:80px;
		font-weight:900;
		
	}
	
	.fa-heart{
		color:red;
	}
	
	#pwpopup{
		width:470px;
		height:100px;
		background:pink;
		position:relative;
		left:0;
		top:0;
	}
	
	#pwpopup h3{
		position:absolute;
		left:10px;
		top:10px;
		width:230px;
		height:80px;
		line-height:80px;
	}
	
	#pwpopup h3:last-child{
		left:350px;
		top:10px;
		width:100px;
		height:80px;
		line-height:80px;
	}
	
	#pwpopup h2{
		position:absolute;
		left:240px;
		top:10px;
		font-size:30px;
		width:100px;
		height:80px;
		line-height:80px;
		font-weight:900;
	}
	
	
</style>
</head>

<body>
	<% if(no.equals("1")){ %>
	<div id="idpopup">
		<h3><i class="fa fa-heart"></i> 고객님의 아이디는</h3>
		<h2><%=data %></h2>
		<h3>입니다 <i class="fa fa-heart"></i></h3>
	</div>
	<% }else{%>
	<div id="pwpopup">
		<h3><i class="fa fa-heart"></i> 고객님의 비밀번호는</h3>
		<h2><%=data %></h2>
		<h3>입니다 <i class="fa fa-heart"></i></h3>
	</div>
	<% } %>
</body>
</html>
