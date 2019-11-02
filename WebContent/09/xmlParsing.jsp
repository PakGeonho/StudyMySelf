<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js"></script>
<script type="text/javascript">
	$(function(){
		/* $('input[type=button]').click(function(){
			$.ajax({//$(=jQuery) 이용해서 ajax를 사용하겠습니다.
			    type : "POST" //"POST", "GET"
			    , async : true //true, false-> false 하면 동기식으로 변경됨 .(ajax 안 쓴거처럼 됨.)
			    , url : "Inquiry.jsp" //Request URL
			    , dataType : "html" //전송받을 데이터의 타입 
			                        //"xml", "html", "script", "json" 등 지정 가능
			                        //미지정시 자동 판단
			    , timeout : 30000   //제한시간 지정
			    , cache : false     //true, false
			    , data : $("#inputForm").serialize() 
			                        //서버에 보낼 파라메터 
			                        //form에 serialize() 실행시 a=b&c=d 형태로 생성되며 한글은 UTF-8 방식으로 인코딩
			                        //"a=b&c=d" 문자열로 직접 입력 가능
			    , contentType: "application/x-www-form-urlencoded;charset=UTF-8"
			    , error : function(request, status, error) {
			                              //통신 에러 발생시 처리(ajax가 브라우저에게 보내는 이벤트)
			                              alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
			              }
			    , success : function(response, status, request) {
			                              //통신 성공시 처리
			                             $('#resultDIV').append(response);    
			              }
			    , beforeSend: function() {
			                              //통신을 시작할때 처리
			                             $('#ajax_indicator').show().fadeIn('fast'); 
			              }
			    , complete: function() {
			                             //통신이 완료된 후 처리
			                             $('#ajax_indicator').fadeOut();
			              }
			    });
		}); */
		 $('input[type=button]').click(function(){
			$.ajax({//$(=jQuery) 이용해서 ajax를 사용하겠습니다.
			    type : "POST" //"POST", "GET"
			    , async : true //true, false-> false 하면 동기식으로 변경됨 .(ajax 안 쓴거처럼 됨.)
			    , url : "<%=request.getContextPath()%>/09/createXML.jsp" //Request URL
			    , dataType : "xml" //전송받을 데이터의 타입 
			    , error : function(result) {
			                      alert("code : " + result.status + "\r\nmessage : " + result.reponseText);
			              }
			    , success : function(result) {
								// XML 형식 데이터를 파싱(분석)하는 파서 : JDOM, SAX
								//		* javascript, jquery : JDOM2
								//		* 엘리먼트는 배열처리, 
			    				// <members>
								//		<member mem_id="a001">
								//			<mem_pass>asdfasdf</mem_pass>
								//			<mem_name>asdfasdf</mem_name>
								//			<mem_regno1>asdfasdf</mem_regno1>
								//			<mem_regno2>asdfasdf</mem_regno2>
								//		</member>
								//		<member mem_id="a001">
								//			<mem_pass>asdfasdf</mem_pass>
								//			<mem_name>asdfasdf</mem_name>
								//			<mem_regno1>asdfasdf</mem_regno1>
								//			<mem_regno2>asdfasdf</mem_regno2>
								//		</member>
								//	</members>
								$('member',result).each(function(){
									$('#viewTable').html($('#viewTable').html() + "<br>" +
										$(this).attr("mem_id") + '<br>'
										+ $('mem_pass', this).text() + ' | '
										+ $('mem_name', this).text() + ' | '
										+ $('mem_regno1', this).text() + ' | '
										+ $('mem_regno2', this).text() + ' | '//member Element를 의미한다.
									)
								});
			    			}
			    });
		}); 
	})
</script>
</head>
<body>
	<form action="" enctype="application/x-www-form-urlencoded"></form>
	<input type="button" value="XML데이터요청" /><br/>
	<div id="viewTable">
	</div>
</body>
</html>