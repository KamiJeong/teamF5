package com.f5.gigabox.vo;

import java.sql.Timestamp;

public class Trailer {

  private int trailerNo;
  private String src;
  private Timestamp regdate;
  private int movieNo;


  public Trailer() {
    super();
    // TODO Auto-generated constructor stub
  }


  public Trailer(int trailerNo, String src, Timestamp regdate, int movieNo) {
    super();
    this.trailerNo = trailerNo;
    this.src = src;
    this.regdate = regdate;
    this.movieNo = movieNo;
  }

  public int getTrailerNo() {
    return trailerNo;
  }


  public void setTrailerNo(int trailerNo) {
    this.trailerNo = trailerNo;
  }


  public String getSrc() {
    return src;
  }


  public void setSrc(String src) {
    this.src = src;
  }


  public Timestamp getRegdate() {
    return regdate;
  }


  public void setRegdate(Timestamp regdate) {
    this.regdate = regdate;
  }


  public int getMovieNo() {
    return movieNo;
  }


  public void setMovieNo(int movieNo) {
    this.movieNo = movieNo;
  }

}
