<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.catalina.tribes.membership.MemberImpl"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
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
			location.href= '<%=request.getContextPath()%>/06/main.jsp?contentPage=/06/memberView.jsp?mem_id='+mem_id;
		});
	})
</script>
<title>Insert title here</title>
</head>
<body>
<div id="list">
	<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">아이디</th>
				<th class="mdl-data-table__cell--non-numeric">이름</th>
				<th class="mdl-data-table__cell--non-numeric">주민번호1</th>
				<th class="mdl-data-table__cell--non-numeric">직업</th>
				<th class="mdl-data-table__cell--non-numeric">취미</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(MemberVO memberInfo : memList){
			%>
			<tr>
				<td class="mdl-data-table__cell--non-numeric"><%= memberInfo.getMem_id() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%= memberInfo.getMem_name() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%= memberInfo.getMem_regno1() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%= memberInfo.getMem_job() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%= memberInfo.getMem_like() %></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
<div class="searchForm" align="right" style="margin-top: 10px;">
	<form method="post" action="${pageContext.request.contextPath }/18_1/main.jsp?contentPage=boardList.jsp">
		<select name="search_keycode">
			<option value="ALL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">컨텐츠</option>
		</select>
		<input type="text" id="search_keyword" name="search_keyword">
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit">검색</button>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button">글쓰기</button>
	</form>
</div>
</body>
</html>








