package com.f5.gigabox.vo;

import java.sql.Date;

public class Ticket {
	
	private int ticketNo;
	private int bookingNo;
	private int seatNo;
	private String seatName;
	private Date showingDate;
	private String movieStartTime;
	private String movieEndTime;
	private String screenName;
	private String cinemaName;
	private String movieTitle;
	
	public Ticket() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Ticket(int ticketNo, int bookingNo) {
		super();
		this.ticketNo = ticketNo;
		this.bookingNo = bookingNo;
	}

	public int getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}

	public int getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	public String getSeatName() {
		return seatName;
	}

	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	
	public Date getShowingDate() {
		return showingDate;
	}

	public void setShowingDate(Date showingDate) {
		this.showingDate = showingDate;
	}

	public String getMovieStartTime() {
		return movieStartTime;
	}

	public void setMovieStartTime(String movieStartTime) {
		this.movieStartTime = movieStartTime;
	}
	
	public String getMovieEndTime() {
		return movieEndTime;
	}

	public void setMovieEndTime(String movieEndTime) {
		this.movieEndTime = movieEndTime;
	}

	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}

	public String getCinemaName() {
		return "GIGABOX " + cinemaName + "점";
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	
}
