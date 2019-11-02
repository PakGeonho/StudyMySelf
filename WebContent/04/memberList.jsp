<%@page import="org.apache.catalina.tribes.membership.MemberImpl"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IMemberService service = IMemberServiceImpl.getInstance();

	List<MemberVO> memList = service.memberList();
	
/* 	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
 */	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type="text/javascript">
	$(function(){
		$('table tr:gt(0)').click(function(){
			var mem_id = $(this).find('td:first').text();
			location.href= '<%=request.getContextPath()%>/04/memberView.jsp?mem_id='+mem_id;
		});
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>성명</th>
				<th>주민번호1</th>
				<th>직업</th>
				<th>취미</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(MemberVO memberInfo : memList){
		%>
			<tr>
				<td><%= memberInfo.getMem_id() %></td>
				<td><%= memberInfo.getMem_name() %></td>
				<td><%= memberInfo.getMem_regno1() %></td>
				<td><%= memberInfo.getMem_job() %></td>
				<td><%= memberInfo.getMem_like() %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>