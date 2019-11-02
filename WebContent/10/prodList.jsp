<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	IProdService service = IProdServiceImpl.getInstance();
	
	List<ProdVO> prodList = service.getAllProd();
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/validation.js'></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/cookieControl.js'></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/jsbn.js' ></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/rsa.js' ></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/prng4.js' ></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/rng.js' ></script>
<script>
	$(function(){
		
		$('button[type=button]').click(function(){
			event.preventDefault();
			location.href = "<%= request.getContextPath()%>/10/main.jsp?contentPage=/10/prodForm.jsp";
		});
		$('tbody').on('click', 'tr', function(){
			location.href = "<%= request.getContextPath()%>/10/main.jsp?contentPage=/10/prodView.jsp?prod_id=" + $(this).attr('id');
		});
	})
</script>
</head>
<body>
<div id="list">
	<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">상품분류코드</th>
				<th class="mdl-data-table__cell--non-numeric">상품명</th>
				<th class="mdl-data-table__cell--non-numeric">매입가</th>
				<th class="mdl-data-table__cell--non-numeric">소비자가</th>
				<th class="mdl-data-table__cell--non-numeric">판매가</th>
				<th class="mdl-data-table__cell--non-numeric">총입고수량</th>
				<th class="mdl-data-table__cell--non-numeric">재고수량</th>
			</tr>
		</thead>
		<tbody>
		<%
		for(int i = 0 ; i < prodList.size() ; i++){
				ProdVO vo = prodList.get(i);
		%>
			<tr id="<%= vo.getProd_id()%>">
				<td class="mdl-data-table__cell--non-numeric" ><%= vo.getProd_lgu() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%= vo.getProd_name() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%= vo.getProd_cost() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%= vo.getProd_price() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%= vo.getProd_price() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%= vo.getProd_totalstock() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%= vo.getProd_properstock() %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>
<div class="searchForm" align="right" style="margin-top: 10px;">
	<form method="post" action="">
		<select name="search_keycode">
			<option value="ALL">전체</option>
			<option value="PRODLGU">상품분류코드</option>
			<option value="PRODNAME">상품명</option>
			<option value="BUYERNAME">거래처명</option>
		</select>
		<input type="text" id="search_keyword" name="search_keyword">
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit">검색</button>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button">상품등록</button>
	</form>
</div>
</body>
</html>








