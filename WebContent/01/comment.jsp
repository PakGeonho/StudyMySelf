<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	↑디렉티브 : 해당 jsp 파일의 선언부.
			서블릿에서 response.setContentType("text/html; charset=UTF-8")와
					response.setCharacterEncoding("UTF-8");에 해당하는 부분.
 -->
<%!
	// 디클러레이션 : 해당 jsp 파일 내에 메서드 정의. => html에서 어떻게 사용??
	private int plus(int i, int j){
		return i + j;
	}
%>

<%
	// 스크립트릿 : 해당 jsp 파일 내 자바 코드(비지니스 로직) 포함.
	Date currentDate = new Date();//정말 자바 코드이다.
	int i = 20;
	int f = 20;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	String now = sdf.format(currentDate);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	alert('헬로 제이에스피!!!!');
	$(function(){
		setInterval(function(){
			res = $('body').html();
			<%=currentDate = new Date() %>
			$('body').attr('display', 'none');
			$('body').append(res);
		}, 3000);
	})
</script>
</head>
<body>
<!-- ↓ 익스프레션 : 디클러레이션 또는 스크립트릿에 선언된 자원을 활용한 응답 컨텐츠 작성 시 활용
 -->
현재 날짜는 <%=currentDate %>입니다. <br />
10과 20을 더한 합은 <%=plus(10,20) %>입니다.

</body>
</html>