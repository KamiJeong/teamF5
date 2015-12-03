<%@ page import="com.f5.gigabox.vo.Member" %>
<%@ page import="com.f5.gigabox.vo.Booking" %>
<%@ page import="com.f5.gigabox.dao.BookingsDAO" %>
<%@ page import="com.f5.gigabox.vo.Ticket" %>
<%@ page import="com.f5.gigabox.dao.TicketsDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: kami
  Date: 9/30/15
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Member loginMember = (Member) session.getAttribute("loginMember");
    if (loginMember == null) {

        response.sendRedirect("index.jsp");

    } else {

        request.setCharacterEncoding("UTF-8");

        int memberNo = loginMember.getMemberNo();

        String selectedSeat = request.getParameter("selectedSeat");
        String showingNoStr = request.getParameter("showingNo");
        String priceStr = request.getParameter("price");

        int showingNo = Integer.parseInt(showingNoStr);
        int price = Integer.parseInt(priceStr);

        System.out.println(showingNo);
        System.out.println(price);
        System.out.println(memberNo);

        Booking booking = new Booking(memberNo, showingNo, price);

        BookingsDAO.getDAO().insertBookingData(booking);

        int currentBookingNo = BookingsDAO.getDAO().selectBookingNo(booking);

        System.out.println(currentBookingNo);

        int j = 0;
        for (int i = 0; i < selectedSeat.length(); i++) {
            if (selectedSeat.charAt(i) == ',') {
                String temp = selectedSeat.substring(j, i);
                j = i + 1;
                Ticket ticket = new Ticket(currentBookingNo, Integer.parseInt(temp));
                TicketsDAO.getDAO().insertTicketData(ticket);
            }
            if (i + 1 == selectedSeat.length()) {
                String temp = selectedSeat.substring(j);
                Ticket ticket = new Ticket(currentBookingNo, Integer.parseInt(temp));
                TicketsDAO.getDAO().insertTicketData(ticket);
            }
        }

        response.sendRedirect("index.jsp");
    }
%>