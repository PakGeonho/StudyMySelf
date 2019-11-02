<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String buyer_id = request.getParameter("buyer_id");

	IBuyerService service = IBuyerServiceImpl.getInstance();
	service.deleteBuyerInfo(buyer_id);
	
	response.setCharacterEncoding("UTF-8");
	response.sendRedirect(request.getContextPath()+"/11/main.jsp?contentPage=/11/buyerList.jsp");
%>