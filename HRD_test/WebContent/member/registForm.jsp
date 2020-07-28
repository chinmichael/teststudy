<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBPKG.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<%
ShopDAO dao = ShopDAO.getInstance();
int inputNo = dao.showNo();	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page = "/header.jsp" />
<style type = "text/css">
.regist td {
	width : 300pt;
}

input[type = "text"] {
	text-align : center;
	outline: none;
}
</style>

<title>Insert title here</title>
<script type = "text/javascript" src = "http://localhost:8181/HRD_test/script/shopMember.js"></script>
</head>
<body>
<h2 style = "text-align : center;"> 홈쇼핑 회원등록 </h2>

<form name = "registFrm" method = "post" action = "http://localhost:8181/HRD_test/Regist.do">
<table class = "regist" border = "1" style = "margin-left : 30%;">
	<tr>
	<th>회원번호(자동발생)</th>
	<td><input type = "text" size = "20" name = "custno" value = "<%=inputNo %>" readonly></td>
	</tr>
	<tr>
	<th>회원성명</th>
	<td><input type = "text" size = "20" name = "custname"></td>
	</tr>
	<tr>
	<th>회원전화</th>
	<td><input type = "text" size = "30" name = "phone"></td>
	</tr>
	<tr>
	<th>회원주소</th>
	<td><input type = "text" size = "40" name = "address"></td>
	</tr>
	<tr>
	<th>가입일자</th>
	<td>
	<c:set var = "today" value = "<%=new java.util.Date() %>"></c:set>
	<input type = "text" size = "20" name = "joindate"
	value = "<fmt:formatDate value = '${today }' pattern = 'yyyyMMdd'></fmt:formatDate>" readonly></td>
	</tr>
	<tr>
	<th>고객등급[A:VIP B:일반 C:직원]</th>
	<td><input type = "text" size = "20" name = "grade"></td>
	</tr>
	<tr>
	<th>도시코드</th>
	<td><input type = "text" size = "20" name = "city"></td>
	</tr>
	<tr>
	<th colspan = "2" align = "center">
	<input type = "submit" value = "등록" onclick = "return checkReg()"> &nbsp;
	<input type = "button" value = "조회" onclick = "location.href = 'memberList.jsp'">
	</th>
	</tr>
</table>
	<c:if test = "${result == 1}">
		<script type = "text/javascript">
		alert("회원등록이 완료되었습니다");
		</script> </c:if>
</form>
</body>
</html>