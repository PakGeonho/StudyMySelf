<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	경로 표현
		절대경로(O) : 컨텍스트 루트 | 패스를 기준으로 자원 접근 경로 표현
					ex) /ddit/image/ddit.jpg
		상대경로 : 경로 표현이 작성되는 파일의 위치를 기준으로 자원 접근 경로 표현
				상위 레벨 접근 : ../
				현재 위치 : ./
					ex) ../image/ddit.jpg
 -->
	<img src="<%=request.getContextPath() %>/image/ddit.jpg" alt="" width="250px" height="200px" />
	<img src="../image/ddit.jpg" alt="" width="250px" height="200px" />
</body>
</html>