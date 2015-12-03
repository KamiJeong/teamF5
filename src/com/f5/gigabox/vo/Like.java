package com.f5.gigabox.vo;

/**
 * Created by kami on 9/23/15.
 */
public class Like {

  private int linkNo;
  private String preference;
  private int memberNo;
  private int commentNo;

  private int likeCount;

  public Like() {
  }


  public Like(int memberNo, int commentNo) {
    this.memberNo = memberNo;
    this.commentNo = commentNo;
  }

  public Like(String preference, int memberNo, int commentNo) {
    this.preference = preference;
    this.memberNo = memberNo;
    this.commentNo = commentNo;
  }

  public int getLinkNo() {
    return linkNo;
  }

  public void setLinkNo(int linkNo) {
    this.linkNo = linkNo;
  }

  public String getPreference() {
    return preference;
  }

  public void setPreference(String preference) {
    this.preference = preference;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public int getCommentNo() {
    return commentNo;
  }

  public void setCommentNo(int commentNo) {
    this.commentNo = commentNo;
  }

  public int getLikeCount() {
    return likeCount;
  }

  public void setLikeCount(int likeCount) {
    this.likeCount = likeCount;
  }
}
