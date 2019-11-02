<%@page import="java.net.URLEncoder"%>
<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = request.getParameter("mem_id");
	
	Map<String, String> params = new HashMap<String, String>();
	IMemberService service = IMemberServiceImpl.getInstance();
	
	MemberVO memCheck = service.memberInfo(params);
	if(memCheck == null){
		MemberVO memberInfo = new MemberVO();
		try{
			BeanUtils.populate(memberInfo, request.getParameterMap());
		}catch(IllegalAccessException e){
			e.printStackTrace();
		}catch(InvocationTargetException e){
			e.printStackTrace();
		}
		service.insertMemberInfo(memberInfo);
		String message = URLEncoder.encode("회원가입에 성공하셨습니다.","UTF-8");
		response.sendRedirect(request.getContextPath()+"/06/main.jsp?contentPage=loginForm.jsp?message="+message);
	}else{
		String message = URLEncoder.encode("이미 존재하는 회원입니다.","UTF-8");
		response.sendRedirect(request.getContextPath()+"/06/main.jsp?contentPage=loginForm.jsp?message="+message);
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>