package com.f5.gigabox.util;

public class PaginateUtil {
	public static String getPaginate(int now, int numPage, int numBlock, int total, String href,
							  String param){
		StringBuilder page = new StringBuilder("<div class='paginate'>");
		
		//math.ceil은 double자료형이므로 int형으로 강제형변환
		//전체 페이지수
		int totalPage = (int)Math.ceil((double)total/numPage);
		
		//현재 블록
		int nowBlock = (int)Math.ceil((double)now/numBlock);
		
		//전체 블록수
		int totalBlock = (int)Math.ceil((double)totalPage/numBlock);
		
		//이전페이지들e
		if(now<=1){
			//비활성화
			page.append("<span title=\"이전 페이지 없음\"><i class=\"fa fa-chevron-left\"></i></span>");
		}else{
			page.append("<a href='"+href+"?"+param+"="+(now-1)+"' title='"+(now-1)+"'><i class=\"fa fa-chevron-left\"></i><span class=\"screen_out\">이전 페이지</span></a>");
		}
		
		if(total>0){
		//기본페이지들
		for(int i=0; i<numBlock; i++){
			
			int realPage = (nowBlock * numBlock)+i-(numBlock-1);
			
			//현재 페이지
			if(now==realPage){
				page.append("<strong title='현재'+realpage+'페이지'>"+realPage+"</strong>");
			} else{
					page.append("<a class='pageList' href='"+href+"?"+param+"="+realPage+"' title='"+realPage+"'>"+realPage+"</a>");
				
			}
			
			//break
			if(realPage==totalPage){
				break;
			}
			
		}
		
		}
		//현재페이지가 마지막페이지 이상일때
		if(now>=totalPage){
			//비활성화
			page.append("<span title=\"다음 페이지 없음\"><i class=\"fa fa-chevron-right\"></i></span>");
		}else{
			page.append("<a href='"+href+"?"+param+"="+(now+1)+"' title='"+(now+1)+"'><i class=\"fa fa-chevron-right\"></i><span class=\"screen_out\">다음 페이지</span></a>");
		}
		page.append("</div>");
		return page.toString();
		
	
	}
}
