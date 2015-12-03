<%@page import="com.f5.gigabox.vo.Point"%>
<%@page import="com.f5.gigabox.dao.PointsDAO"%>
<%@page import="com.f5.gigabox.dao.MembersDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.f5.gigabox.dao.MoviesDAO"%>
<%@page import="com.f5.gigabox.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	String recentMovie="";
	int recentPoint=0;
	int allPoint=0;
	String membership="";
	Point pointMemvership = new Point();
	
	if(loginMember!=null){
		recentMovie = MoviesDAO.getDAO().recentMovie(loginMember.getMemberNo());
		recentPoint = PointsDAO.getDAO().recentPoint(loginMember.getMemberNo());
		allPoint = PointsDAO.getDAO().allPoint(loginMember.getMemberNo());
		membership = pointMemvership.getMembership(allPoint);
	}
%>

<div id="header" class="">
	<div class="aux">
		<h1 id="mainLogo">
			<a href="index.jsp"><span class="screen_out">메인로고</span></a>
		</h1>
		<!-- <img src="img/GIGABOX_LOGO2.jpg" title="GIGABOX LOGO"/><span class="screen_out">로고사진</span></li> -->
		<div id="menu">
		<h2 class="screen_out"> 메뉴목록 </h2>
			<ul>
			 	<li><a href="movieList.jsp">영화</a></li><!--
			 --><li><a href="selectMovie.jsp">예매</a></li><!--
			 --><li><a href="eventList.jsp">이벤트</a></li><!--
			 --><li><a href="membership.jsp">멤버십</a></li><!--
			 <% if(loginMember==null) { %>
				 --><li><a href="#">로그인 &amp; 회원가입</a></li>
			 <% }else{ %>
				 --><li><a href="#">마이페이지</a></li>
			 <% } %>
			</ul>
		</div>
	</div><!-- //aux -->
	
	
	<div id="myPageBox">	
	<% if(loginMember==null) { %>
	
			<div id="loginBox" class="loginMyPage">
				<form action="login.jsp" method="post">
					<fieldset>
						<legend class="screen_out">로그인 폼</legend>
						<div class="loginForm">
							<label for="id">아이디</label>
							<input type="text" id="id" name="id" />
							<label for="pw">비밀번호</label>
							<input type="password" id="pw" name="pw" />
						</div>
						<div class="loginBtn">
							<button type="submit">로그인</button>
						</div>
					</fieldset>
				</form>
				<div class="joinBtn">
					<a href="joinForm.jsp">회원가입</a> 
					<a href="idpw.jsp">아이디/비밀번호 찾기</a>
				</div>
			</div>	
	<% }else{ %>
			<div id="myPageForm" class="loginMyPage">
				<div class="myPicture" style="background-image:url(<%=loginMember.getProfile()%>); background-size:100% 100%; background-repeat: no-repeat;"></div>
				
				<div class="myInfo">
					<div class="myInfoBox">
						<h4>내등급</h4> <h3><%=membership %></h3>
					</div>
					<div class="myInfoBox">
						<h4>잔여포인트</h4> <h3><%=recentPoint %></h3> 
					</div>
					<div class="myInfoBox">
						<h4>최근 본 영화</h4> <h3><%=recentMovie %></h3> 
					</div>
				</div>
				
				<div class="myPageBtn">
					<a href="myPage.jsp">더보기</a> 
					<a href="logout.jsp">로그아웃</a>
				</div>
				
				<div class="myBookingList">
					<h3>베테랑</h3>
					<h3>영등포(17시5분~19시35분)</h3>
					
					<button>예매취소</button>
				</div>
			</div><!-- //myPageForm -->
	<% } %> </div><!-- //myPageBox -->	
</div><!-- //header -->
