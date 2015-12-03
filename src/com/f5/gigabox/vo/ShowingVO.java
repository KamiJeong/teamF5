package com.f5.gigabox.vo;


import java.sql.Date;

/**
 * Created by kami on 9/23/15.
 */
public class ShowingVO {

  private int showingNo;
  private Date showingDate;
  private int showingNth;
  private Date startTime;
  private Date endTime;
  private int screenNo;
  private int movieNo;
  private String title;
  private String pg;
  private String movieTime;
  private String movieEndTime;
  private int cinemaNo;
  private String temp;
  private String cinemaName;
  private String screenName;


  public ShowingVO() {
  }

  public ShowingVO(int cinemaNo, String title, String temp) {
    this.cinemaNo = cinemaNo;
    this.title = title;
    this.temp = temp;
  }


  public int getShowingNo() {
    return showingNo;
  }


  public void setShowingNo(int showingNo) {
    this.showingNo = showingNo;
  }


  public Date getShowingDate() {
    return showingDate;
  }


  public void setShowingDate(Date showingDate) {
    this.showingDate = showingDate;
  }


  public int getShowingNth() {
    return showingNth;
  }


  public void setShowingNth(int showingNth) {
    this.showingNth = showingNth;
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


  public int getScreenNo() {
    return screenNo;
  }


  public void setScreenNo(int screenNo) {
    this.screenNo = screenNo;
  }


  public int getMovieNo() {
    return movieNo;
  }


  public void setMovieNo(int movieNo) {
    this.movieNo = movieNo;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getPg() {
    return pg;
  }

  public void setPg(String pg) {
    this.pg = pg;
  }

  public String getMovieTime() {
    return movieTime;
  }

  public void setMovieTime(String movieTime) {
    this.movieTime = movieTime;
  }

  public int getCinemaNo() {
    return cinemaNo;
  }

  public void setCinemaNo(int cinemaNo) {
    this.cinemaNo = cinemaNo;
  }

  public String getTemp() {
    return temp;
  }

  public void setTemp(String temp) {
    this.temp = temp;
  }

  public String getCinemaName() {
    return cinemaName;
  }

  public void setCinemaName(String cinemaName) {
    this.cinemaName = cinemaName;
  }

  public String getScreenName() {
    return screenName;
  }

  public void setScreenName(String screenName) {
    this.screenName = screenName;
  }

  public String getMovieEndTime() {
    return movieEndTime;
  }

  public void setMovieEndTime(String movieEndTime) {
    this.movieEndTime = movieEndTime;
  }

  @Override
  public String toString() {
    return "{" +
            " \"showingNo\":" + "\"" + showingNo + "\"" +
            ", \"screenNo\":" + "\"" + screenNo + "\"" +
            ", \"screenName\":" + "\"" + screenName + "\"" +
            ", \"cinemaName\":" + "\"" + cinemaName + "\"" +
            ", \"title\":" + "\"" + title + "\"" +
            ", \"showingNth\":" + "\"" + showingNth + "\"" +
            ", \"startTime\":" + "\"" + startTime + "\"" +
            ", \"movieTime\":" + "\"" + movieTime + "\"" +
            '}';
  }
}

