package com.f5.gigabox.vo;

import java.sql.*;

public class Eventboard {

  private int eventboardNo;
  private String title;
  private String writer;
  private Timestamp regdate;
  private int hits;
  private String contents;

  public Eventboard() {
  }

  public int getEventboardNo() {
    return eventboardNo;
  }

  public void setEventboardNo(int eventboardNo) {
    this.eventboardNo = eventboardNo;
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

  public Timestamp getRegdate() {
    return regdate;
  }

  public void setRegdate(Timestamp regdate) {
    this.regdate = regdate;
  }

  public int getHits() {
    return hits;
  }

  public void setHits(int hits) {
    this.hits = hits;
  }

  public String getContents() {
    return contents;
  }

  public void setContents(String contents) {
    this.contents = contents;
  }
}
