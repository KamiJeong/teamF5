package com.f5.gigabox.vo;

/**
 * Created by kami on 9/23/15.
 */
public class Cinema {
  private int cinemaNo;
  private String name;
  private int cityNo;

  public Cinema() {
  }

  public int getCinemaNo() {
    return cinemaNo;
  }

  public void setCinemaNo(int cinemaNo) {
    this.cinemaNo = cinemaNo;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getCityNo() {
    return cityNo;
  }

  public void setCityNo(int cityNo) {
    this.cityNo = cityNo;
  }


  @Override
  public String toString() {
    return "{" + "\"cinemaNo\":" + "\"" + cinemaNo + "\"" + ", \"name\":" + "\"" + name + "\"" + ", \"cityNo\":" + "\"" + cityNo + "\"" + '}';
  }
}
