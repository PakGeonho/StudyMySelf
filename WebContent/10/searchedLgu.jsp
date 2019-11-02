<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.ZipCodeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.zipcode.service.IZipCodeServiceImpl"%>
<%@page import="kr.or.ddit.zipcode.service.IZipCodeService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");//post방식이기때문에 선언해줘야한다.
	
	String prodNm = request.getParameter("prod_name");
	
	//Dao의 갯수 = 테이블의 갯수.
	IProdService service = IProdServiceImpl.getInstance();
	
	List<ProdVO> prodNmList = service.prodnmList(prodNm);
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(prodNmList);
	
	out.println(jsonData);
%>