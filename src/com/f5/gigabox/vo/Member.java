package com.f5.gigabox.vo;

import java.sql.*;
import java.util.Calendar;

public class Member {

	private int memberNo;
	private String id;
	private String password;
	private String name;
	private Date birthDate;
	private String gender;
	private String phone;
	private Timestamp regdate;
	private String type;
	private String profile;
	private Calendar cal;
	private int bookingNo;
	private Date showingDate;
	private Date startTime;
	private Date endTime;
	private String movieTitle;
	private int seatRow;
	private String seatCol;
	private String screenName;
	private String screenFloor;
	private String cinemaName;
	private String frequentCinema;
	private int movieNo;
	private String moviePoster;

	public Member() {
		super();
		cal = Calendar.getInstance();
	}

	public Member(Date birthDate, String phone) {
		this.birthDate = birthDate;
		this.phone = phone;
	}

	public Member(String name, Date birthDate, String phone) {
		this(birthDate, phone);
		this.name = name;
	}

	public Member(int memberNo, String password, String name, String phone, String type) {
		super();
		this.memberNo = memberNo;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.type = type;
	}

	public Member(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public Member(int bookingNo, Date showingDate, Date startTime, Date endTime, String movieTitle, int seatRow,
			String seatCol, String screenName, String screenFloor, String cinemaName) {
		super();
		this.bookingNo = bookingNo;
		this.showingDate = showingDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.movieTitle = movieTitle;
		this.seatRow = seatRow;
		this.seatCol = seatCol;
		this.screenName = screenName;
		this.screenFloor = screenFloor;
		this.cinemaName = cinemaName;
	}

	public Member(String id, String pw, String name, Date birthDate, String gender, String phone, String type) {
		super();
		this.id = id;
		this.password = pw;
		this.name = name;
		this.birthDate = birthDate;
		this.gender = gender;
		this.phone = phone;
		this.type = type;
	}

	public int getYear() {
		cal.setTime(getBirthDate());
		return cal.get(Calendar.YEAR);
	}// getYear() end -> Calendar를 통해 받아온 date에서 년도를 반환해주는 메서드

	public int getAge() {
		int age = cal.get(Calendar.YEAR) - getYear() + 1;
		return age;
	}// getAge() end -> Calendar를 통해 현재 년도와 생년월일의 년도를 가져와 나이를 반환해주는 메서드

	public int getMonth() {
		cal.setTime(getBirthDate());
		return cal.get(Calendar.MONTH);
	}// getMonth() end -> Calendar를 통해 받아온 date에서 월을 반환해주는 메서드

	public int getDay() {
		cal.setTime(getBirthDate());
		return cal.get(Calendar.DATE);
	}// getDay() end -> Calendar를 통해 받아온 date에서 날짜 부분을 반환해주는 메서드

	public int getMemberNo() {

		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}

	public Date getShowingDate() {
		return showingDate;
	}

	public void setShowingDate(Date showingDate) {
		this.showingDate = showingDate;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public int getSeatRow() {
		return seatRow;
	}

	public void setSeatRow(int seatRow) {
		this.seatRow = seatRow;
	}

	public String getSeatCol() {
		return seatCol;
	}

	public void setSeatCol(String seatCol) {
		this.seatCol = seatCol;
	}

	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}

	public String getScreenFloor() {
		return screenFloor;
	}

	public void setScreenFloor(String screenFloor) {
		this.screenFloor = screenFloor;
	}

	public String getCinemaName() {
		return "GIGABOX " + cinemaName + "점";
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getFrequentCinema() {
		return frequentCinema;
	}

	public void setFrequentCinema(String frequentCinema) {
		this.frequentCinema = frequentCinema;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMoviePoster() {
		return moviePoster;
	}

	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}

	public String getPhoneNum() {
		String[] phone = new String[3];
		String phoneNum = null;
		if (getPhone().length() == 11) {
			phone[0] = getPhone().substring(0, 3);
			phone[1] = getPhone().substring(3, 7);
			phone[2] = getPhone().substring(7, 11);
		} else {
			phone[0] = getPhone().substring(0, 3);
			phone[1] = getPhone().substring(3, 6);
			phone[2] = getPhone().substring(6, 10);
		}
		phoneNum = phone[0] + "-" + phone[1] + "-" + phone[2];

		return phoneNum;
	}// getPhoneNum() end -> 11자리가 아닌 경우에도 번호를 나누어 배열로 값을 넘겨주는 메서드

}
