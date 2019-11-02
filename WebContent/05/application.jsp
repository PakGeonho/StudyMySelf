<%@page import="java.net.URL"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// application : 원래 ServletContext 타입.
	application.log("이클립스 내 콘솔 방향에 로그 출력(INFO Level의 경고 출력)");
	application.log("실제 서비스 시 출력 방향 : 서버폴더/logs/파일에 로그 작성 = apache-tomcat/logs/loalhost");
	
	// web.xml 내 상수 취득
	out.println("oracle driver : " + application.getInitParameter("oracleDriver") + "<br>");//getInitParameter(web.xml에 선언한 driver의 이름)
	out.println("oracle url : " + application.getInitParameter("oracleURL") + "<br>");
	out.println("mysql driver : " + application.getInitParameter("mysqlDriver") + "<br>");
	out.println("mysql url : " + application.getInitParameter("mysqlURL") + "<br>");
	
	out.println("이클립스 해당 웹 어플리케이션 배포 경로 : " + application.getRealPath("") + "<br>");//""하면 알아서 취득해서 보여줌.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
서블릿 버전 확인 : <%=application.getMajorVersion() %>.<%=application.getMinorVersion() %> <br>
<%
	//서버 내 실제 패스를 활용
	String buffer ="";
	BufferedReader reader = new BufferedReader(
			new InputStreamReader(
					new FileInputStream(
							application.getRealPath("/05/readme.txt")),"UTF-8"));
	while((buffer = reader.readLine())!=null){
		out.println(buffer);
	}
	
	//URL을 이용한 자원 접근 활용.
	String temp = "";
	// http://localhost/ddit/05/readme.txt
	URL url = application.getResource("/05/readme.txt");
	BufferedReader urlReader = new BufferedReader(
			new InputStreamReader(url.openStream(),"UTF-8"));
	while((temp = urlReader.readLine()) != null){
%>
		<%=temp %>
<%
	}
%>
</body>
</html>