<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList = service.memberList();
	// 마셜링 : 데이터를 포함하는 자바 객체를 전송 가능한 다른 데이터 형식(json, xml, etc...)으로 변환
	//		 JAVA Object -> 다른 데이터 형식 변환.
	// 언마셜링 : 마셜링 결과물 또는 전송되어 취득한 다양한 데이터 형식을 자바 객체로 변환
	//		  다른 데이터 형식 -> JAVA Object
	out.println("<members>");
	for(MemberVO memberInfo : memberList){
		out.println("<member mem_id='" + memberInfo.getMem_id() + "'>");
			out.println("<mem_pass>"+memberInfo.getMem_pass()+"</mem_pass>");
			out.println("<mem_name>"+memberInfo.getMem_name()+"</mem_name>");
			out.println("<mem_regno1>"+memberInfo.getMem_regno1()+"</mem_regno1>");
			out.println("<mem_regno2>"+memberInfo.getMem_regno2()+"</mem_regno2>");
		out.println("</member>");
	}
	out.println("</members>");
%>