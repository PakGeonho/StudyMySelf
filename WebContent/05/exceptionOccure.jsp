<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	JAVA Exception : 어플리케이션 개발 및 실행 중 발생 또는 발생될 여지가 존재하며 코드의 실행이 안되거나 또는 정상적인 종료를 보장할 수 없으므로 필수적으로 대응되어야 하며,
					개발자, 유저, 물리적인 리소스에 의해 발생되는 모든 에러.
		1. 에러 카테고리
			1.1 컴파일 에러(Compile-Time Errors) : 개발 간 빌드 시 컴파일러에 의해서 파악되며, 발생됨.
			1.2 런타임 에러(Runtime Errors) : 어플리케이션 실행 간 발생되며, 어플리케이션 비정상 종료 또는 모듈 간 충돌, 하드웨어 셧-다운 등을 유발.
			1.3 로직 에러(Logic Errors) : 어플리케이션 개발 간 개발자의 비논리적인 알고리즘 작성 및 반영으로 유발되는 에러.
										무한루프, 실행되어야하는 코드 미실행, 예측 불가능한 실행 결과 유도, 불명확하고 비논리적인 알고리즘 적용.
		2. 익셉션 카테고리
			2.1 Checked Exception : 컴파일 에러
			2.2 UnChecked Exception : 런타임 에러
			2.3 Fatal : 물리적인 리소스의 한계 또는 개발자가 예상하지 못한 유저의 신박한 조작 등의 개발자가 대응해야 할 범주를 벗어난 에러.
		
		3. JAVA 구조
								java.lang.Object
										|
								java.lang.Throwable
										|
								 ===========================
								|							|
						java.lang.Error				java.lang.Exception
								|							|
						 ===============				NullPointException
						|				|				ArrayIndexOutOfBoundsException 등등등
			VirtualMachineError			IOError
						|				|
				OutOfMemoryError		ThreadDeath 등등등
				StackOverflowError 등등등
		
		4. 익셉션 처리 규칙
			4.1 작은 범위, 구체적인 예외 선언.
			4.2 신속한 예외 처리.
			4.3 예외 Catch는 발생 또는 발생 여지가 존재하는 해당 코드의 호출부에서 처리.
			4.4 예외가 발생되면 활용되는 모든 리소스는 Close시켜야한다.
			4.5 예외 발생 정보는 로그(파일 단위)로 출력 및 저장 활용.
			4.6 예외 발생 시 유저, 개발자에게 메세지 전달.
			4.7 예외 선언 시 다수의 예외가 선언되며, Catch는 단일 Catch 선언을 활용한다.
			4.8 커스텀(개발자 정의) 익셉션을 활용해서 예외 처리.
			4.9 Java Doc 주석에 예외 포함.
 -->
 <%
 	//int i = 1 /0;
 	MemberVO memberInfo = null;
 	memberInfo.getMem_id();
 %>
</body>
</html>