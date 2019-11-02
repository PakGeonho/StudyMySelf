<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IBuyerService service = IBuyerServiceImpl.getInstance();

	List<BuyerVO> list = service.getAllBuyer();
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(list);
	
	out.println(jsonData);
%>