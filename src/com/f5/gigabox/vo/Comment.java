package com.f5.gigabox.vo;

import java.sql.*;
import java.text.SimpleDateFormat;

public class Comment {

  private int commentNo;
  private Timestamp regdate;
  private int star;
  private String contents;
  private int memberNo;
  private int movieNo;
  private String poster;
  private String title;


  private String memberName;
  private String memberProfile;

  private int likes;
  private int hates;
  private SimpleDateFormat sdft;

  public Comment() {
    sdft = new SimpleDateFormat("yyyy년 MM월 dd일");
  }

  public int getCommentNo() {
    return commentNo;
  }

  public void setCommentNo(int commentNo) {
    this.commentNo = commentNo;
  }

  public String getRegdate() {
    //return regdate;
    return sdft.format(regdate);
  }

  public void setRegdate(Timestamp regdate) {
    this.regdate = regdate;
  }

  public int getStar() {
    return star;
  }

  public void setStar(int star) {
    this.star = star;
  }

  public String getContents() {
    return contents;
  }

  public void setContents(String contents) {
    this.contents = contents;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public int getMovieNo() {
    return movieNo;
  }

  public void setMovieNo(int movieNo) {
    this.movieNo = movieNo;
  }

  public int getLikes() {
    return likes;
  }

  public void setLikes(int likes) {
    this.likes = likes;
  }

  public int getHates() {
    return hates;
  }

  public void setHates(int hates) {
    this.hates = hates;
  }

  public String getMemberName() {
    return memberName;
  }

  public void setMemberName(String memberName) {
    this.memberName = memberName;
  }

  public String getMemberProfile() {
    return memberProfile;
  }

  public void setMemberProfile(String memberProfile) {
    this.memberProfile = memberProfile;
  }

  public String getPoster() {
    return poster;
  }

  public void setPoster(String poster) {
    this.poster = poster;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public SimpleDateFormat getSdft() {
    return sdft;
  }

  public void setSdft(SimpleDateFormat sdft) {
    this.sdft = sdft;
  }
}
