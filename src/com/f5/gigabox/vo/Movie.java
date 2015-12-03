package com.f5.gigabox.vo;

import java.sql.Date;

public class Movie {
	private int movieNo;
	private String director;
	private String actor;
	private String pg;
	private Date makingDate;
	private String poster;
	private Date releaseDate;
	private String genre;
	private String synopsis;
	private String title;
	private double grade;
	private String movieStartTime;
	private String movieEndTime;
	private String cinemaName;
	private String movieTitle;
	
	
	public Movie() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getMovieNo() {
		return movieNo;
	}


	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}


	public String getDirector() {
		return director;
	}


	public void setDirector(String director) {
		this.director = director;
	}


	public String getActor() {
		return actor;
	}


	public void setActor(String actor) {
		this.actor = actor;
	}


	public String getPg() {
		return pg;
	}


	public void setPg(String pg) {
		this.pg = pg;
	}


	public Date getMakingDate() {
		return makingDate;
	}


	public void setMakingDate(Date makingDate) {
		this.makingDate = makingDate;
	}


	public String getPoster() {
		return poster;
	}


	public void setPoster(String poster) {
		this.poster = poster;
	}


	public Date getReleaseDate() {
		return releaseDate;
	}


	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getSynopsis() {
		return synopsis;
	}


	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public double getGrade() {
		return grade;
	}


	public void setGrade(double grade) {
		this.grade = grade;
	}


	public String getMovieStartTime() {
		return movieStartTime;
	}


	public void setMovieStartTime(String movieStartTime) {
		this.movieStartTime = movieStartTime;
	}


	public String getMovieEndTime() {
		return movieEndTime;
	}


	public void setMovieEndTime(String movieEndTime) {
		this.movieEndTime = movieEndTime;
	}


	public String getCinemaName() {
		return cinemaName + "점";
	}


	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}


	public String getMovieTitle() {
		return movieTitle;
	}


	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	
	
}
