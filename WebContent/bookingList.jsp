<%@page import="com.f5.gigabox.vo.Ticket"%>
<%@page import="com.f5.gigabox.dao.TicketsDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TicketsDAO dao = TicketsDAO.getDAO();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>bookingList</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/main.css" />
		
		<style>

			#content{
				width: 1000px;
				margin: 150px auto 100px auto;
			}
			
			#content h3 {
				font:700 30px bon, sans-serif;
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
			}

			#category li:nth-child(3) {
				left: 330px;
				border-bottom:5px solid #581F7D;
			}
			
			#currentBookingListTable {
				width:1000px;
				vertical-align:middle;
				border-radius:5px;
				box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
				text-align:center;
				border-collapse: collapse;
				margin : 20px 10px;
			}
			
			#currentBookingListTable .no {
				width:50px;
			}
			
			#currentBookingListTable .showingDate {
				width:300px;
			}
			
			#currentBookingListTable .movieInfo {
				width:300px;
			}
			
			#currentBookingListTable th {
				padding:10px;
				font-size:20px;
				font-weight: bold;
				color: #369;
    			border-bottom: 3px solid #036;
			}
			
			#currentBookingListTable td {
				text-align:center;
				font-size:20px;
				padding:20px;
				border: 1px solid #ccc;
			}
			
			#currentBookingListTable strong {
				font-weight:700;
			}
			
			#currentBookingList {
				margin-bottom: 50px;
			}
			
			.btn {
				font: 500 17px bon, sans-serif;
				color: #463a84;
				text-decoration:none;
			}

			.btn:hover {
				color: #fff;
				background: #581F7D;
			}
			
		</style>
	</head>
	<body>
	
		<%@include file="template/header.jsp" %>
		<%
			if(loginMember==null){
				response.sendRedirect("index.jsp");
		    }else{
			Calendar calendar = Calendar.getInstance();
	        //Date date = calendar.getTime();
	        //SimpleDateFormat sdft = new SimpleDateFormat("yyyyMMddHHmmss");
	        //Date today = sdft.format(date);
	        //String today = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date));
			List<Ticket> bookingList = dao.bookingList(loginMember.getMemberNo());
			int i=0;
		%>
		
		
		
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

			<div id="currentBookingList">
				<h3>최근 예매목록</h3>
				<table border="1" id="currentBookingListTable">
					<caption class="screen_out">
						최근 예매목록표
					</caption>
					<thead>
						<tr>
							<th class="no">번 호</th>
							<th class="ticketNo">티켓번호</th>
							<th class="showingDate">상영날짜</th>
							<th class="movieInfo">영화정보</th>
							<th class="note">비고</th>
						</tr>
					</thead>
					<tbody>
					<%if(!bookingList.isEmpty()){
						for(Ticket TicketList : bookingList){ 
							
							String startHourText = TicketList.getMovieStartTime().substring(0,2);
							startHourText = startHourText + "시";
							String startMinuteText = TicketList.getMovieStartTime().substring(2,4);
							startMinuteText = startMinuteText + "분";
							String movieStart = startHourText + startMinuteText;
							
							String endHourText = TicketList.getMovieEndTime().substring(0,2);
							endHourText = endHourText + "시";
							String endMinuteText = TicketList.getMovieEndTime().substring(2,4);
							endMinuteText = endMinuteText + "분";
							String movieEnd = endHourText + endMinuteText;
					%>
						<tr>
							<td><p><span><%=++i %></span></p></td>
							<td><p><span><%=TicketList.getTicketNo() %></span></p></td>
							<td><p><strong><%=TicketList.getShowingDate() %></strong><br><span><%=movieStart%> ~ <%=movieEnd%></span></p></td>
							<td><p><strong><%=TicketList.getMovieTitle() %></strong><br><span><%=TicketList.getCinemaName() %> <%=TicketList.getScreenName() %> <%=TicketList.getSeatName() %></span></p></td>
							<%
								Calendar startTime = Calendar.getInstance ( );
								startTime.setTime(TicketList.getShowingDate());
							
								if(startTime.after(calendar)) {%>
									<td>
									<button><a href="deleteTicket.jsp?no=<%=TicketList.getTicketNo() %>&no2=<%=TicketList.getBookingNo() %>" class="btn">
										예약취소
									</a></button></td>
								<% }else{%>
									<td>
									<button><a href="" class="btn">
										평가하기
									</a></button></td>
								<% } %>
						</tr>
					<%} 
						}else{%>
								<tr>
									<td colspan="5"><p><span>예매목록이 없습니다 ㅠ_ㅠ</span></p></td>
								</tr>
							<% }%>
					</tbody>
				</table>

			</div><!-- //currentBookingList -->

		</div><!-- //content -->
		
		<%@include file="template/footer.jsp" %>
		
		<script src="js/jquery.js"></script>
		<script>
			$("#header .aux li").eq(4).click(function(e){
				e.preventDefault();
				//$("#loginBox").fadeToggle(800);
				$(".loginMyPage").fadeToggle(800);
			});
		</script>
	</body>
</html>

<%}%>