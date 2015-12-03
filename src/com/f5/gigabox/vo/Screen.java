package com.f5.gigabox.vo;

/**
 * Created by kami on 9/23/15.
 */
public class Screen {
  private int screenNo;
  private String name;
  private String floor;
  private int countSeat;
  private int cinemaNo;


  public Screen() {
    super();
    // TODO Auto-generated constructor stub
  }


  public int getScreenNo() {
    return screenNo;
  }


  public void setScreenNo(int screenNo) {
    this.screenNo = screenNo;
  }


  public String getName() {
    return name;
  }


  public void setName(String name) {
    this.name = name;
  }


  public String getFloor() {
    return floor;
  }


  public void setFloor(String floor) {
    this.floor = floor;
  }


  public int getCount() {
    return countSeat;
  }


  public void setCount(int countSeat) {
    this.countSeat = countSeat;
  }


  public int getCinemaNo() {
    return cinemaNo;
  }


  public void setCinemaNo(int cinemaNo) {
    this.cinemaNo = cinemaNo;
  }
}
