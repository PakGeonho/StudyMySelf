<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/validation.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#search').click(function(){
			var name = $('#prod_name').val();
			$.ajax({
				url : '<%=request.getContextPath()%>/11/prodBuyer.jsp',
				Type : 'post',
				data : {"prod_name" : name },
				dataType : 'json',
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					code = "<table id='buyerTBL'>";
					code += "<tr>";
					code += 	"<th>분류 번호</th><th>상품 분류명</th><th>등록될 거래처 번호</th>";
					code += "</tr>";
					$.each(res, function(i){
						code += "<tr>";
						code +=		"<td>" + res[i].lprod_gu + "</td><td>"+res[i].lprod_nm +"</td><td>"+res[i].buyer_id+"</td>";
						code += "</tr>";
					});
					code += "</table>";
				
					$('#viewTable').html(code);
					$('#buyerTBL tr:gt(0)').click(function(){
					
						
						var buyer_id = $(this).find('td:eq(2)').text();
						$('#buyer_id', opener.document).val(buyer_id);
						
						
						
						
						var lprod_gu = $(this).find('td:eq(0)').text();
						var htmls = $("<option>",{
								'text' : lprod_gu,
								'selected' : true,
								'value' : lprod_gu
						});
						$('#buyer_lgu', opener.document).prepend(htmls);
						
						self.close();
					});
				}
			});
		});
	})
</script>
</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"><img src="../image/open_post.gif" width="136"
				height="22"></td>
		</tr>
		<tr>
			<td><img src="../image/open_table01.gif" width="354" height="10"></td>
		</tr>
		<tr>
			<td height="10" background="../image/open_table02.gif" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td height="300" align="center" valign="top"
				background="../image/open_table02.gif">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25"><div align="center">등록할 거래처의 상품명을 입력해주십시오.</div></td>
					</tr>
					<tr>
						<td height="38" background="../image/open_tt.gif" align="center">
							<input type="text" id="prod_name">&nbsp;상품명&nbsp;
							<input type="image" src="../image/bt_search.gif" border='0' align="middle" id="search">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="../image/open_table03.gif" width="354" height="10"></td>
		</tr>
	</table>
</body>
</html>