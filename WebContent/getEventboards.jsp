<%@page import="com.f5.gigabox.dao.EventBoardsDAO"%>
<%@page import="com.f5.gigabox.vo.Eventboard"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.f5.gigabox.util.PaginateUtil"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="com.f5.gigabox.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


//현재 페이지
	int now = 1;

	//넘어온 파라미터에 page가 있으면 그 페이지이니까
	String pageNo = request.getParameter("page");

	if (pageNo != null) {

		now = Integer.parseInt(pageNo);
	}

	//한 페이지당 보여질 게시물 수 
	int numPage = 5;

	//PagingVO객체를 생성
	PagingVO paging = new PagingVO(now, numPage);

	//BoardDAO

	EventBoardsDAO dao = EventBoardsDAO.getDAO();
	//List얻어오기
	List<Eventboard> list = dao.selectList(paging);

	int numBlock = 3;

	String href = "eventList.jsp";

	String param = "page";

	int total = dao.selectCount();

	//페이징 뿌리기
	String paginate = PaginateUtil.getPaginate(now, numPage, numBlock, total, href, param);
	
	ObjectMapper om = new ObjectMapper();
	
	
	Map<String,Object> map = new HashMap();
	
	map.put("list",list);
	map.put("paginate",paginate);
	


	String json = om.writeValueAsString(map);
	
	out.println(json);

%>