<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/02/viewQueryString.jsp" method="POST">
   <table>
      <tr>
         <td>아이디</td>
         <td><input name='mem_id' type="text" /></td>
      </tr>
      <tr>
         <td>성명</td>
         <td><input name='mem_name' type="text" /></td>
      </tr>
      <tr>
         <td>학위</td>
         <td>
	         <input  type="checkbox" name='querystring_grp' value='학사' /> 이제 자기 전공분야에 대해서 모르는게 없다고 생각한다<br/>
	         <input  type="checkbox" name='querystring_grp' value='석사' /> 이제 자기 전공분야에 대해서 아는게 없다고 생각한다<br/>
	         <input  type="checkbox" name='querystring_grp' value='박사' /> 이제 자기 전공분야의 박사를 전공하는 다른 사람들도 모르는건 마찬가지임을 깨닫는다.<br/>
	         <input  type="checkbox" name='querystring_grp' value='교수' /> 아는 것만 가르친다.<br/>
         </td>
      </tr>
      <tr>
         <td colspan="2"><input type="submit" /></td>
      </tr>
   </table>
</form>
</body>
</html>