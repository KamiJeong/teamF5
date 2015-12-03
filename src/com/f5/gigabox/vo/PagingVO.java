package com.f5.gigabox.vo;

public class PagingVO {
	//페이징 처리용 VO 시작수, 끝수
	private int start, end;
	
	public PagingVO() {
		// TODO Auto-generated constructor stub
	}
	
	public PagingVO(int pageNo, int numPerPage) {
		this.end = pageNo * numPerPage;
		this.start = end-(numPerPage-1);
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
}//PagingVO class end
