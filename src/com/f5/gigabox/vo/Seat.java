package com.f5.gigabox.vo;

/**
 * Created by kami on 9/23/15.
 */
public class Seat {

  private int seatNo;
  private int rowValue;
  private String colValue;
  private int positionX;
  private int positionY;
  private int screenNo;
  private int showingNo;


  public Seat() {
  }


  public int getSeatNo() {
    return seatNo;
  }


  public void setSeatNo(int seatNo) {
    this.seatNo = seatNo;
  }


  public int getRowValue() {
    return rowValue;
  }

  public void setRowValue(int rowValue) {
    this.rowValue = rowValue;
  }

  public String getColValue() {
    return colValue;
  }

  public void setColValue(String colValue) {
    this.colValue = colValue;
  }

  public int getPositionX() {
    return positionX;
  }


  public void setPositionX(int positionX) {
    this.positionX = positionX;
  }


  public int getPositionY() {
    return positionY;
  }


  public void setPositionY(int positionY) {
    this.positionY = positionY;
  }


  public int getScreenNo() {
    return screenNo;
  }


  public void setScreenNo(int screenNo) {
    this.screenNo = screenNo;
  }

  public int getShowingNo() {
    return showingNo;
  }

  public void setShowingNo(int showingNo) {
    this.showingNo = showingNo;
  }
}

