package com.f5.gigabox.vo;

import java.sql.Timestamp;

public class Point {
	
	private int memberNo;
	private String usageDetail;
	private int pointDetail;
	private Timestamp regdate;
	private int bookingNo;
	
	
	public Point() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getMembership(int point){
		String membership=null;
		
		if(point>=5000){
			membership="VVIP";
		}else if(point>=3000){
			membership="VIP";
		}else{
			membership="ACE";
		}
		return membership;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getUsageDetail() {
		return usageDetail;
	}
	public void setUsageDetail(String usageDetail) {
		this.usageDetail = usageDetail;
	}
	public int getPointDetail() {
		return pointDetail;
	}
	public void setPointDetail(int pointDetail) {
		this.pointDetail = pointDetail;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getBookingNo() {
		return bookingNo;
	}
	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}
	
	

}
