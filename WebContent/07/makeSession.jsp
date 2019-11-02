<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 생성과 활용
	// 1. 클라이언트(브라우저)의 최초 서버 대상 요청시 쿠키 베이스의 세션 제너레이트 키를 서버로 전송(해당 클라이언트와 맵핑되는 세션이 X)
	// 2. 서버에 전송된 세션제너레이트 키를 취득하고 활용해서 세션을 생성하고, 생성된 세션의 아이디를 부여.
	// 3. 클라이언트의 최초 요청 시 신규 생성된 세션에서 세션 아이디를 응답 객체(response)에 저장 후 클라이언트 대상 응답 컨텐츠와 함께 전송.
	// 4. 클라이언트는 이후 매번 서버대상 요청시 쿠키 베이스로 취득한 세션 아이디를 함께 전송.
	// 5. 클라이언트로부터 매번 요청 시 전송되는 쿠키 베이스의 세션 아이디를 서버가 취득 후 세션 아이디를 활용해서 해당 클라이언트와 맵핑되는 세션이 선택되고 활용.
	// 6. 웹 프로그래밍 언어별 쿠키 베이스로 전송되는 세션 ID의 키값이 상이.
	//		JSP : JSESSIONID
	//		PHP : PHPSESSION
	//		ASP : ASESSIONID
	
	// 생성된 세션을 취득
	// 1. HttpSession session = request.getSession();
	// 2. HttpSession session = request.getSession(true or false);
	//				true - 기존 생성된 세션이 존재하면 해당 세션을 반환.
	//					     기존 생성된 세션이 존재하지 않으면 신규 생성 후 반환.
	//				false - 기존 생성된 세션이 존재하면 해당 세션을 반환.
	//					     기존 생성된 세션이 존재하지 않으면 에러 발생.
	
	// 세션 유효시간 : Tomcat(default 30분).
	//			   자바를 활용해서 설정 가능 : session.setMaxInactiveInterval(초단위 설정)
	//			  web.xml 내 <session-timeout> : 분단위 설정
	
	// 세션 삭제 : 서버단 자바를 활용해서 session.invalidate(); 삭제
	//			해당 클라이언트의 최종 서버 요청시간 이후로 세션 유효시간이 경과되면 세션이 삭제.
	session.setMaxInactiveInterval(60*30*10);
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY/MM/dd hh:mm:ss");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
세션 아이디 : <%=session.getId() %> <br/>
세션 최초 생성된 일시 : <%=dateFormat.format(new Date(session.getCreationTime())) %> <br/>
클라이언트 최종 요청 일시 : <%=dateFormat.format(new Date(session.getLastAccessedTime())) %> <br/>
</body>
</html>