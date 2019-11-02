<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	http://localhost/ddit/01/gugudanResult.jsp?dan=2
 -->
 <%!
//디클러레이션
	public int multiple(int i, int j){
		return i * j;
	}
%>
<%
	//클라이언트 요청 헤더 구성
	//	요청 라인 : 클라이언트의 서버 대상 요청시 URL(주소), 프로토콜 정보, 쿼리스트링 전송방식
	//	요청 헤더 : 서버로부터 취득을 기대하는 응답 컨텐츠의 마임타입이 선언, 요청시 클라이언트의 위치 국가코드와 언어 코드, 클라이언트의 서버 대상 요청 후 상태정보, 쿠키정보, 세션정보, 클라이언트 정보.
	//	요청 본문 : 클라이언트에서 서버 대상 요청시 쿼리 스트링 전송방식 POST일 때, 패킷 내 저장된 쿼리 스트링의 내용
	//클라이언트 응답 헤더 구성
	//	응답 라인 : 프로토콜, 요청 처리 결과 상태코드 및 상태값
	//	응답 헤더 : 해당 요청을 처리한 서버, 응답 컨텐츠의 마임타입(>데이터를 설명하는 데이터), 응답 컨텐츠의 사이즈, 응답 처리 일자
	//	응답 본문 : 서버에서 클라이언트 대상 전송하는 응답 컨텐츠
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		res = "";
		var dan = 0;
		dan = <%= Integer.parseInt(request.getParameter("dan")) %>;
		for(var i = 1;i<10;i++){
			res +=  dan+" * " + i + " = " + (dan*i) + "<br>";
		}
/*  		$.each(function(i){
			if(i == 10) return false;
			res += dan +" * " + i + " = " + (dan*i) + "<br>";
		});
 */		$('body').html(res);
	})
</script>
</head>
<body>
<%
	int dan = Integer.parseInt(request.getParameter("dan"));
%>
	<%= dan%>단 <br/> <!-- 익스프레션 : 스크립트릿, 디클러레이션의 값, 메서드를 가지고 활용하는 영역. -->
<%
	for(int i = 1 ; i < 10 ; i++){
%>
	<%= dan %> * <%= i %> = <%= multiple(dan, i) %><br>
<%	
	}
%>
</body>
</html>