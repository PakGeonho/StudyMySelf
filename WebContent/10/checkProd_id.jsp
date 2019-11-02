<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String prod_id = request.getParameter("prod_id");
	IProdService service = IProdServiceImpl.getInstance();

	int cnt = 0;
	cnt = service.checkProd(prod_id);
	
	out.println(cnt);
%>