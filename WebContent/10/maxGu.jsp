<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	String prod_gu = request.getParameter("prod_lgu");
	String prod_gu = request.getParameter("P101");
	
	IProdService service = IProdServiceImpl.getInstance();
	
	String max_no = service.getMaxgu(prod_gu);
	Map<String, String> value = new HashMap<String, String>();
	value.put("max_no", max_no);
	
// 	request.setAttribute("max_no", max_no);
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(value);
	
	out.println(jsonData);
	
%>

