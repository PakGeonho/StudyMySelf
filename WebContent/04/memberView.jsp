<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="org.apache.catalina.tribes.membership.MemberImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");

	Map<String, String> params = new HashMap<String, String>();
	
	params.put("mem_id", mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type="text/javascript">
	$(function(){
		$('input[value=회원목록]').click(function(){
			$(location).attr('href','<%=request.getContextPath() %>/04/memberList.jsp');
		});
		$('input[value=회원탈퇴]').click(function(){
			$(location).attr('href',"<%=request.getContextPath() %>/04/deleteMemberInfo.jsp?mem_id=<%=mem_id%>");
		});
	})
</script>
</head>
<body>
	<form action="<%=request.getContextPath() %>/04/updateMemberInfo.jsp">
		<input type='hidden' name='mem_id' value='<%=memberInfo.getMem_id()%>'/>
		<table>
			<tr>
				<td>아이디</td>
				<td><input disabled='disabled' type="text" value='<%=memberInfo.getMem_id() %>'/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input name='mem_pass' type="text" value='<%=memberInfo.getMem_pass() %>'/></td>
			</tr>
			<tr>
				<td>성명</td>
				<td><input name='mem_name' disabled='disabled' type="text" value='<%=memberInfo.getMem_name() %>'/></td>
			</tr>
			<tr>
				<td>집전화번호</td>
				<td><input name='mem_hometel' type="text" value='<%=memberInfo.getMem_hometel() %>'/></td>
			</tr>
			<tr>
				<td>회사전화번호</td>
				<td><input name='mem_comtel' type="text" value='<%=memberInfo.getMem_comtel() %>'/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input name='mem_hp' type="text" value='<%=memberInfo.getMem_hp() %>'/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name='mem_mail' type="text" value='<%=memberInfo.getMem_mail() %>'/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input name='mem_add1' type="text" value='<%=memberInfo.getMem_add1() %>' />&nbsp;&nbsp;
				<input name='mem_add2' type="text" value='<%=memberInfo.getMem_add2() %>' /></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><input name='mem_job' type="text" value='<%= memberInfo.getMem_job()%>'/></td>
			</tr>
			<tr>
				<td>취미</td>
				<td><input name='mem_like' type="text" value='<%= memberInfo.getMem_job()%>'/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value='회원목록 수정' />
					<input type="button" value='회원탈퇴' />
					<input type="button" value='회원목록' />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>