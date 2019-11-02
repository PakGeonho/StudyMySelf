<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	BuyerVO vo = new BuyerVO();
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	try{
		BeanUtils.populate(vo, request.getParameterMap());
	}catch(IllegalAccessException e){
		e.printStackTrace();
	}catch(InvocationTargetException e){
		e.printStackTrace();
	}
	service.insertBuyerInfo(vo);
	
	response.setCharacterEncoding("UTF-8");
	response.sendRedirect(request.getContextPath()+"/11/main.jsp?contentPage=/11/buyerList.jsp");
	
%>