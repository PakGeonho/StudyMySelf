<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<%
	String prod_name = request.getParameter("prod_name");

	IBuyerService service = IBuyerServiceImpl.getInstance();
	
	List<HashMap<String, Object>> listMap = service.lprodForBuyer(prod_name);
	
	for(int i = 0 ; i < listMap.size() ; i++){
		if(i > 0) out.print(",");
%>
	{
		"lprod_gu" : "<%= listMap.get(i).get("LPROD_GU") %>",
		"lprod_nm" : "<%= listMap.get(i).get("LPROD_NM") %>",
		"buyer_id" : "<%= listMap.get(i).get("BUYER_ID") %>"
	}
<%
	}
%>
]