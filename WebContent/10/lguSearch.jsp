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
		$('input[type=image]').click(function(){
			/* if(!$('#dong').val().validationDONG()){
				alert('상품명을 바르게 입력해주세요.');
				return false;
			} */
			$.ajax({
				type : "post",
				url : "<%=request.getContextPath()%>/10/searchedLgu.jsp",
				dataType : "json",
				data : {"prod_name" : $('#prod_name').val()},
				error : function(result){
					alert("code : " + result.status + "\r\n message : " + result.responseText);
				},
				success : function(result){
					var a = result;
					// TODO 취득한 json형식의 문자열을 활용해서 table태그의 tr을 반복적으로 작성 및 추가.
					// TODO Table 태그의 tr에 클릭 이벤트가 설정.
					var htmls = '<table width="100%" height="200px" border="0" cellspacing="0" cellpadding="0" '
								+ 'style="overflow:scroll;" id="zipcodeTBL">'
								+ '<thead>'
								+		'<tr>'
								+			'<th>상품코드</th>'
								+			'<th>상품명</th>'
								+			'<th>상품분류코드</th>'
								+		'</tr>'
								+ '</thead>'
								+ '<tbody>';
					for(var i = 0 ; i < result.length ; i++){
						htmls += '<tr>'
								+	'<td>' + result[i].prod_id + '</td>'
								+	'<td>' + result[i].prod_name + '</td>'
								+	'<td>' + result[i].prod_lgu + '</td>'
								+ '</tr>';
					}
						htmls	+= '</tbody>'
								+ '</table>';
					var max_gu = "";
					$('#viewTable').empty().html(htmls);
					$('#zipcodeTBL tr:gt(0)').click(function(){
						var prod_idd = $(this).find('td:eq(0)').text();
						var new_id = "";
						lenCheck = parseInt(prod_idd.substring(prod_idd.length-3));
						if(lenCheck >= 10){
							id_front = prod_idd.substring(0, prod_idd.length-3);
							new_id = "" + id_front +(lenCheck + 1);
						}else{
							id_front = prod_idd.substring(0, prod_idd.length-2);
							new_id = id_front + "0" + (lenCheck + 1);
						}
						var aa = $('<option>',{
							'value' : $(this).find('td:last').text(),
							'text' : $(this).find('td:last').text(),
							'selected' : true
						});
					$('#prod_lgu option[value='+ $(this).find('td:last').text()+']', opener.document).remove();
					$('#prod_lgu', opener.document).prepend(aa);
					$('#prod_id', opener.document).val(new_id);
								
					//팝업 종료
					self.close();
					})
				}
			})
		});
	})
	function findMax(t){
		var max_gu = "";
		var canI = t.childNodes[2].textContent;
			$.ajax({
				url : "<%=request.getContextPath()%>/10/maxGu.jsp",
				type : "post",
				data : {"prod_lgu" : canI },
				dataType : "json",
				error : function(xhr2){
					alert("상태 : " + xhr2.status);
				},
				success : function(res){
					max_gu = res.max_no;
				}
			});
			
			var prod_idd = max_gu;
			var new_id = "";
			lenCheck = parseInt(prod_idd.substring(prod_idd.length-3));
			if(lenCheck >= 10){
				id_front = prod_idd.substring(0, prod_idd.length-3);
				new_id = "" + id_front +(lenCheck + 1);
			}else{
				id_front = prod_idd.substring(0, prod_idd.length-2);
				new_id = id_front + "0" + (lenCheck + 1);
			}
				
				
			// 팝업 오픈한 도큐멘트 : main.jsp?contentPage=/06/memberForm.jsp
			/* $(opener.document).find('#mem_zip1').val(zipcode.split('-')[0]);
			$(opener.document).find('#mem_zip2').val(zipcode.split('-')[1]);
			$(opener.document).find('#mem_add1').val(addr); */
/* 			var aa = $('<option>',{
					'value' : $(this).find('td:last').text(),
					'text' : $(this).find('td:last').text(),
					'selected' : true
				});
			$('#prod_lgu option[value='+ $(this).find('td:last').text()+']', opener.document).remove();
			$('#prod_lgu', opener.document).prepend(aa);
			$('#prod_id', opener.document).val(new_id);
						
			//팝업 종료
			self.close(); */
		}
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
						<td height="25"><div align="center">찾고자 하는 상품코드의 상품명을 입력해주십시오.</div></td>
					</tr>
					<tr>
						<td height="38" background="../image/open_tt.gif" align="center">
							<input type="text" id="prod_name">&nbsp;상품명&nbsp;
							<input type="image" src="../image/bt_search.gif" border='0' align="middle">
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