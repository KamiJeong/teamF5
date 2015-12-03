package com.f5.gigabox.vo;

/**
 * Created by kami on 9/23/15.
 */
public class Booking {
  private int bookingNo;
  private int payment;
  private int showingNo;
  private int memberNo;

  public Booking() {
  }

  public Booking(int memberNo, int showingNo, int price) {
    this.memberNo = memberNo;
    this.showingNo = showingNo;
    this.payment = price;
  }

  public int getBookingNo() {
    return bookingNo;
  }

  public void setBookingNo(int bookingNo) {
    this.bookingNo = bookingNo;
  }

  public int getPayment() {
    return payment;
  }

  public void setPayment(int payment) {
    this.payment = payment;
  }

  public int getShowingNo() {
    return showingNo;
  }

  public void setShowingNo(int showingNo) {
    this.showingNo = showingNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
}
