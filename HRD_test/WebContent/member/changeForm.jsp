<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "DBPKG.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%	
	int custno = Integer.parseInt(request.getParameter("custno"));
	ShopDAO dao = ShopDAO.getInstance();
	MemberVO mv = dao.memberInfo(custno);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page = "/header.jsp" />
<title>Insert title here</title>
<script type = "text/javascript" src = "http://localhost:8181/HRD_test/script/shopMember.js"></script>

<style type = "text/css">
.upTable td {
	width : 300pt;
}

input[type = "text"] {
	text-align : center;
	outline: none;
}
</style>

</head>
<body>
<h2 style = "text-align : center;">홈쇼핑 회원정보 수정</h2>

<form name = "registFrm" method = "post" action = "http://localhost:8181/HRD_test/Update.do">

<table border = "1" class = "upTable" style = "margin-left : 30%;">

	<tr>
	<th>회원번호</th>
	<td><input type = "text" name = "custno" size = "20" value = "<%= mv.getCustno() %>" readonly></td>
	</tr>
	
	<tr>
	<th>회원성명</th>
	<td><input type = "text" name = "custname" size = "20" value = "<%= mv.getCustname() %>" readonly></td>
	</tr>
	
	<tr>
	<th>전화번호</th>
	<td><input type = "text" name = "phone" size = "30" value = "<%= mv.getPhone() %>"></td>
	</tr>
	
	<tr>
	<th>주소</th>
	<td><input type = "text" name = "address" size = "40" value = "<%= mv.getAddress() %>"></td>
	</tr>
	
	<tr>
	<th>가입일자</th>
	<td><input type = "text" name = "joindate" size = "20" value = "<%= mv.getJoindate() %>" readonly></td>
	</tr>
	
	<tr>
	<th>고객등급[A:VIP B:일반 C:직원]</th>
	<td><input type = "text" name = "grade" size = "20" value = "<%= mv.getGrade() %>"></td>
	</tr>
	
	<tr>
	<th>도시코드</th>
	<td><input type = "text" name = "city" size = "20" value = "<%= mv.getCity() %>"></td>
	</tr>
	
	<tr>
	<th colspan = "2" align = "center">
	<input type = "submit" value = "수정" onclick = "return checkReg()"> &nbsp;
	<input type = "button" value = "조회" onclick = "location.href = 'memberList.jsp'">
	</th>
	</tr>
</table>

	<c:if test = "${result == 1}">
		<script type = "text/javascript">
		alert("회원정보가 수정되었습니다");
		</script> </c:if>

</form>


</body>
</html>