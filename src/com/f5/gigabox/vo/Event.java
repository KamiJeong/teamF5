package com.f5.gigabox.vo;

import java.sql.*;

public class Event {

  private int evenNo;
  private String title;
  private String writer;
  private Date startDate;
  private Date endDate;
  private Timestamp regdate;
  private String contents;
  private String image;

  public Event() {
  }

  public int getEvenNo() {
    return evenNo;
  }

  public void setEvenNo(int evenNo) {
    this.evenNo = evenNo;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getWriter() {
    return writer;
  }

  public void setWriter(String writer) {
    this.writer = writer;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public Date getEndDate() {
    return endDate;
  }

  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }

  public Timestamp getRegdate() {
    return regdate;
  }

  public void setRegdate(Timestamp regdate) {
    this.regdate = regdate;
  }

  public String getContents() {
    return contents;
  }

  public void setContents(String contents) {
    this.contents = contents;
  }

  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }
}
