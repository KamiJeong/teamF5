<%@page import="com.f5.gigabox.vo.Ticket" %>
<%@page import="com.f5.gigabox.dao.TicketsDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%

    request.setCharacterEncoding("UTF-8");

    String ticketNoStr = request.getParameter("no");
    String bookingNoStr = request.getParameter("no2");

    int ticketNo = Integer.parseInt(ticketNoStr);
    int bookingNo = Integer.parseInt(bookingNoStr);

    TicketsDAO dao = TicketsDAO.getDAO();

    Ticket ticket = new Ticket(ticketNo, bookingNo);

    boolean result = dao.deleteTicket(ticket);

    TicketsDAO dao2 = TicketsDAO.getDAO();

    boolean result2 = dao2.deleteBooking(bookingNo);

    response.sendRedirect("bookingList.jsp");
%>

{"result" : <%=result%>}
{"result" : <%=result2%>}