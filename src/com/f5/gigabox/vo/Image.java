package com.f5.gigabox.vo;

import java.sql.*;

/**
 * Created by kami on 9/23/15.
 */
public class Image {

  private int imageNo;
  private String src;
  private Timestamp regdate;
  private int movieNo;

  public Image() {
  }

  public int getImageNo() {
    return imageNo;
  }

  public void setImageNo(int imageNo) {
    this.imageNo = imageNo;
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
